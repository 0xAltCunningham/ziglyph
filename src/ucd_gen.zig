const std = @import("std");

const ArrayList = std.ArrayList;
const AutoHashMap = std.AutoHashMap;
const HashMap = std.HashMap;
const fmt = std.fmt;
const io = std.io;
const mem = std.mem;

const host = "www.unicode.org";
const remote_path = "/Public/UCD/latest/ucd/UnicodeData.txt";

const CaseKind = enum {
    Lower,
    Title,
    Upper,
};

const Range = struct {
    start: u21,
    end: u21,
};

const UcdGenerator = struct {
    allocator: *mem.Allocator,

    control_ranges: ArrayList(Range),
    letter_ranges: ArrayList(Range),
    control: ArrayList(u21),
    letter: ArrayList(u21),
    lower: ArrayList(u21),
    mark: ArrayList(u21),
    number: ArrayList(u21),
    punct: ArrayList(u21),
    space: ArrayList(u21),
    symbol: ArrayList(u21),
    title: ArrayList(u21),
    upper: ArrayList(u21),

    to_lower_map: AutoHashMap(u21, u21),
    to_upper_map: AutoHashMap(u21, u21),
    to_title_map: AutoHashMap(u21, u21),
    decomp_map: AutoHashMap(u21, []const u21),

    pub fn init(allocator: *mem.Allocator) !UcdGenerator {
        return UcdGenerator{
            .allocator = allocator,

            .control_ranges = ArrayList(Range).init(allocator),
            .letter_ranges = ArrayList(Range).init(allocator),

            .control = ArrayList(u21).init(allocator),
            .letter = ArrayList(u21).init(allocator),
            .lower = ArrayList(u21).init(allocator),
            .mark = ArrayList(u21).init(allocator),
            .number = ArrayList(u21).init(allocator),
            .punct = ArrayList(u21).init(allocator),
            .space = ArrayList(u21).init(allocator),
            .symbol = ArrayList(u21).init(allocator),
            .title = ArrayList(u21).init(allocator),
            .upper = ArrayList(u21).init(allocator),

            .to_lower_map = AutoHashMap(u21, u21).init(allocator),
            .to_upper_map = AutoHashMap(u21, u21).init(allocator),
            .to_title_map = AutoHashMap(u21, u21).init(allocator),
            .decomp_map = AutoHashMap(u21, []const u21).init(allocator),
        };
    }

    const Self = @This();

    pub fn deinit(self: *Self) void {
        self.control_ranges.deinit();
        self.letter_ranges.deinit();

        self.control.deinit();
        self.letter.deinit();
        self.lower.deinit();
        self.mark.deinit();
        self.number.deinit();
        self.punct.deinit();
        self.space.deinit();
        self.symbol.deinit();
        self.title.deinit();
        self.upper.deinit();
        self.to_lower_map.deinit();
        self.to_title_map.deinit();
        self.to_upper_map.deinit();

        var decomp_iter = self.decomp_map.iterator();
        while (decomp_iter.next()) |entry| {
            self.allocator.free(entry.value);
        }
        self.decomp_map.deinit();
    }

    pub fn gen(self: *Self) !void {
        var cache_file = std.fs.cwd().openFile("UnicodeData.txt", .{});
        if (cache_file) |f| {
            // Cache hit.
            defer f.close();
            var buf_reader = io.bufferedReader(f.reader());
            const in_stream = buf_reader.reader();
            var buf_writer = io.bufferedWriter(f.writer());
            const cache_stream = buf_writer.writer();
            try self.gen2(in_stream, cache_stream, false);
        } else |_| {
            // Cache file.
            var new_cache_file = try std.fs.cwd().createFile("UnicodeData.txt", .{});
            defer new_cache_file.close();
            var buf_writer = io.bufferedWriter(new_cache_file.writer());
            const cache_stream = buf_writer.writer();

            // TCP / HTTP connection.
            var conn = try std.net.tcpConnectToHost(self.allocator, host, 80);
            defer conn.close();
            var buf_reader = io.bufferedReader(conn.reader());
            const in_stream = buf_reader.reader();
            var buffer: [256]u8 = undefined;
            const http_request = "GET {s} HTTP/1.1\r\nHost: {s}\r\nConnection: close\r\n\r\n";
            var msg = try std.fmt.bufPrint(&buffer, http_request, .{ remote_path, host });
            _ = try conn.write(msg);

            try self.gen2(in_stream, cache_stream, true);
            try buf_writer.flush();
        }
    }

    fn gen2(self: *Self, in_stream: anytype, cache_stream: anytype, is_net: bool) !void {
        try self.process_stream(in_stream, cache_stream, is_net);
        try self.write_files();
    }

    fn process_stream(self: *Self, in_stream: anytype, cache_stream: anytype, is_net: bool) !void {
        var buf: [1024]u8 = undefined;
        var at_body = if (is_net) false else true;
        var range_start: ?u21 = null;
        while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
            if (!at_body) {
                if (line.len == 1 and line[0] == '\r') {
                    at_body = true;
                }
                continue;
            }

            if (is_net) {
                _ = try cache_stream.print("{s}\n", .{line});
            }

            if (range_start) |rscp| {
                var iter = mem.split(line, ";");
                var fields: [3][]const u8 = undefined;
                var i: usize = 0;
                while (iter.next()) |field| : (i += 1) {
                    if (i < 3) fields[i] = field else break;
                }
                if (!mem.endsWith(u8, fields[1], "Last>")) return error.UnclosedRange;

                const range_end = try fmt.parseInt(u21, fields[0], 16);
                switch (fields[2][0]) {
                    'C' => try self.control_ranges.append(.{ .start = rscp, .end = range_end }),
                    'L' => try self.letter_ranges.append(.{ .start = rscp, .end = range_end }),
                    else => return error.UnexpectedRangeCategory,
                }

                range_start = null;
                continue;
            }

            var fields = mem.split(line, ";");
            var i: usize = 0;
            var code_point: u21 = undefined;
            while (fields.next()) |field| : (i += 1) {
                if (i == 0) {
                    // Parse code point.
                    code_point = try fmt.parseInt(u21, field, 16);
                } else if (i == 1 and mem.endsWith(u8, field, "First>")) {
                    range_start = code_point;
                } else if (i == 2 and field.len != 0) {
                    // Major categories.
                    switch (field[0]) {
                        'C' => if (!contains(self.control.items, code_point)) {
                            try self.control.append(code_point);
                        },
                        'L' => {
                            if (!contains(self.letter.items, code_point)) {
                                try self.letter.append(code_point);
                            }
                            if (mem.eql(u8, field, "Ll")) {
                                if (!contains(self.lower.items, code_point)) {
                                    try self.lower.append(code_point);
                                }
                            } else if (mem.eql(u8, field, "Lt")) {
                                if (!contains(self.title.items, code_point)) {
                                    try self.title.append(code_point);
                                }
                            } else if (mem.eql(u8, field, "Lu")) {
                                if (!contains(self.upper.items, code_point)) {
                                    try self.upper.append(code_point);
                                }
                            }
                        },
                        'M' => if (!contains(self.mark.items, code_point)) {
                            try self.mark.append(code_point);
                        },
                        'N' => if (!contains(self.number.items, code_point)) {
                            try self.number.append(code_point);
                        },
                        'P' => if (!contains(self.punct.items, code_point)) {
                            try self.punct.append(code_point);
                        },
                        'S' => if (!contains(self.symbol.items, code_point)) {
                            try self.symbol.append(code_point);
                        },
                        else => {
                            if (mem.eql(u8, field, "Zs")) {
                                if (!contains(self.space.items, code_point)) {
                                    try self.space.append(code_point);
                                }
                            } else {
                                continue;
                            }
                        },
                    }
                } else if (i == 5 and field.len != 0) {
                    // Decomposition.
                    try self.decomp_map_add(field, code_point);
                } else if (i == 12 and field.len != 0) {
                    // Map to uppercase.
                    try self.case_map_add(.Upper, field, code_point);
                } else if (i == 13 and field.len != 0) {
                    // Map to lowercase.
                    try self.case_map_add(.Lower, field, code_point);
                } else if (i == 14 and field.len != 0) {
                    // Map to titlecase.
                    try self.case_map_add(.Title, field, code_point);
                } else {
                    continue;
                }
            }
        }
    }

    fn write_files(self: *Self) !void {
        // Write out.
        const List = struct {
            name: []const u8,
            items: []u21,
        };

        const lists = [_]List{
            .{
                .name = "control",
                .items = self.control.items,
            },
            .{
                .name = "letter",
                .items = self.letter.items,
            },
            .{
                .name = "lower",
                .items = self.lower.items,
            },
            .{
                .name = "mark",
                .items = self.mark.items,
            },
            .{
                .name = "number",
                .items = self.number.items,
            },
            .{
                .name = "punct",
                .items = self.punct.items,
            },
            .{
                .name = "space",
                .items = self.space.items,
            },
            .{
                .name = "symbol",
                .items = self.symbol.items,
            },
            .{
                .name = "title",
                .items = self.title.items,
            },
            .{
                .name = "upper",
                .items = self.upper.items,
            },
        };

        for (lists) |list| {
            const file_name = try mem.concat(self.allocator, u8, &[2][]const u8{ list.name, ".zig" });
            defer self.allocator.free(file_name);
            var file = try std.fs.cwd().createFile(file_name, .{});
            defer file.close();
            var buf_writer = io.bufferedWriter(file.writer());
            const writer = buf_writer.writer();
            _ = try writer.print("// Autogenerated from http://{s}{s} by running ucd_gen.\n\n", .{ host, remote_path });

            const last = mem.max(u21, list.items);
            _ = try writer.print("pub const {s} = [{d}]bool{{\n", .{ list.name, last + 1 });
            var index: u21 = 0;
            while (index <= last) : (index += 1) {
                _ = try writer.print("    {b},\n", .{contains(list.items, index)});
            }
            _ = try writer.write("};\n");

            if (mem.eql(u8, list.name, "control")) {
                _ = try writer.write("\nconst Range = @import(\"range.zig\").Range;\n");
                _ = try writer.write("\npub const ranges = [_]Range{\n");
                for (self.control_ranges.items) |range| {
                    _ = try writer.print("    .{{ .start = 0x{X}, .end = 0x{X} }},\n", .{ range.start, range.end });
                }
                _ = try writer.write("};\n");
            }

            if (mem.eql(u8, list.name, "letter")) {
                _ = try writer.write("\nconst Range = @import(\"range.zig\").Range;\n");
                _ = try writer.write("\npub const ranges = [_]Range{\n");
                for (self.letter_ranges.items) |range| {
                    _ = try writer.print("    .{{ .start = 0x{X}, .end = 0x{X} }},\n", .{ range.start, range.end });
                }
                _ = try writer.write("};\n");
            }

            try buf_writer.flush();
        }

        // Case mappings.
        // ToLowerMap
        var tlf = try std.fs.cwd().createFile("to_lower.zig", .{});
        defer tlf.close();
        var tlf_buf = io.bufferedWriter(tlf.writer());
        const tlf_writer = tlf_buf.writer();
        _ = try tlf_writer.print("// Autogenerated from http://{s}{s} by running ucd_gen.\n\n", .{ host, remote_path });
        const tlf_start =
            \\const std = @import("std");
            \\
            \\pub const ToLowerMap = struct {
            \\    map: std.AutoHashMap(u21, u21),
            \\
            \\    pub fn init(allocator: *std.mem.allocator) !ToLowerMap {
            \\        var tlm = ToLowerMap{
            \\            .map = std.AutoHashMap(u21, u21).init(allocator),
            \\        };
            \\
            \\
        ;
        _ = try tlf_writer.write(tlf_start);

        var tlf_iter = self.to_lower_map.iterator();
        while (tlf_iter.next()) |entry| {
            _ = try tlf_writer.print("        try tlm.put(0x{X}, 0x{X});\n", .{ entry.key, entry.value });
        }

        const tlf_end =
            \\
            \\        return tlm;
            \\    }
            \\
            \\    const Self = @This();
            \\    pub fn deinit(self: Self) void {
            \\      self.map.deinit();
            \\    }
            \\};
        ;
        _ = try tlf_writer.write(tlf_end);
        try tlf_buf.flush();

        // ToTitleMap
        var ttf = try std.fs.cwd().createFile("to_title.zig", .{});
        defer ttf.close();
        var ttf_buf = io.bufferedWriter(ttf.writer());
        const ttf_writer = ttf_buf.writer();
        _ = try ttf_writer.print("// Autogenerated from http://{s}{s} by running ucd_gen.\n\n", .{ host, remote_path });
        const ttf_start =
            \\const std = @import("std");
            \\
            \\pub const ToTitleMap = struct {
            \\    map: std.AutoHashMap(u21, u21),
            \\
            \\    pub fn init(allocator: *std.mem.allocator) !ToTitleMap {
            \\        var ttm = ToTitleMap{
            \\            .map = std.AutoHashMap(u21, u21).init(allocator),
            \\        };
            \\
            \\
        ;
        _ = try ttf_writer.write(ttf_start);

        var ttf_iter = self.to_title_map.iterator();
        while (ttf_iter.next()) |entry| {
            _ = try ttf_writer.print("        try ttm.put(0x{X}, 0x{X});\n", .{ entry.key, entry.value });
        }

        const ttf_end =
            \\
            \\        return ttm;
            \\    }
            \\
            \\    const Self = @This();
            \\    pub fn deinit(self: Self) void {
            \\      self.map.deinit();
            \\    }
            \\};
        ;
        _ = try ttf_writer.write(ttf_end);
        try ttf_buf.flush();

        // ToUpperMap
        var tuf = try std.fs.cwd().createFile("to_upper.zig", .{});
        defer tuf.close();
        var tuf_buf = io.bufferedWriter(tuf.writer());
        const tuf_writer = tuf_buf.writer();
        _ = try tuf_writer.print("// Autogenerated from http://{s}{s} by running ucd_gen.\n\n", .{ host, remote_path });
        const tuf_start =
            \\const std = @import("std");
            \\
            \\pub const ToUpperMap = struct {
            \\    map: std.AutoHashMap(u21, u21),
            \\
            \\    pub fn init(allocator: *std.mem.allocator) !ToUpperMap {
            \\        var tum = ToUpperMap{
            \\            .map = std.AutoHashMap(u21, u21).init(allocator),
            \\        };
            \\
            \\
        ;
        _ = try tuf_writer.write(tuf_start);

        var tuf_iter = self.to_upper_map.iterator();
        while (tuf_iter.next()) |entry| {
            _ = try tuf_writer.print("        try tum.put(0x{X}, 0x{X});\n", .{ entry.key, entry.value });
        }

        const tuf_end =
            \\
            \\        return tum;
            \\    }
            \\
            \\    const Self = @This();
            \\    pub fn deinit(self: Self) void {
            \\      self.map.deinit();
            \\    }
            \\};
        ;
        _ = try tuf_writer.write(tuf_end);
        try tuf_buf.flush();

        // Decomposition map.
        var decompf = try std.fs.cwd().createFile("decompose.zig", .{});
        defer decompf.close();
        var decompf_buf = io.bufferedWriter(decompf.writer());
        const decompf_writer = decompf_buf.writer();
        _ = try decompf_writer.print("// Autogenerated from http://{s}{s} by running ucd_gen.\n\n", .{ host, remote_path });
        const decompf_start =
            \\const std = @import("std");
            \\
            \\pub const DecomposeMap = struct {
            \\    allocator: *std.mem.Allocator,
            \\    map: std.AutoHashMap(u21, []const u21),
            \\
            \\    pub fn init(allocator: *std.mem.allocator) !DecomposeMap {
            \\        var decompm = DecomposeMap{
            \\            .allocator = allocator,
            \\            .map = std.AutoHashMap(u21, []const u21).init(allocator),
            \\        };
            \\
            \\
        ;
        _ = try decompf_writer.write(decompf_start);

        var decompf_iter = self.decomp_map.iterator();
        while (decompf_iter.next()) |entry| {
            _ = try decompf_writer.print("        try decompm.put(0x{X}, &[{d}]u21{{\n", .{ entry.key, entry.value.len });
            for (entry.value) |cp| {
                _ = try decompf_writer.print("            0x{X},\n", .{cp});
            }
            _ = try decompf_writer.write("        });\n");
        }

        const decompf_end =
            \\
            \\        return decompm;
            \\    }
            \\
            \\    const Self = @This();
            \\    pub fn deinit(self: Self) void {
            \\        var miter = self.map.iterator();
            \\        while (miter.next()) |entry| {
            \\            self.allocator.free(entry.value);
            \\        }
            \\        self.map.deinit();
            \\    }
            \\};
        ;
        _ = try decompf_writer.write(decompf_end);
        try decompf_buf.flush();
    }

    fn decomp_map_add(self: *Self, field: []const u8, code_point: u21) !void {
        var seq = mem.split(field, " ");
        var cp_list = try self.allocator.alloc(u21, 18); // Max decomp code points = 18
        errdefer self.allocator.free(cp_list);
        var i: usize = 0;
        while (seq.next()) |scp| {
            if (scp.len == 0 or scp[0] == '<') continue;
            const ncp: u21 = try fmt.parseInt(u21, scp, 16);
            cp_list[i] = ncp;
            i += 1;
        }
        cp_list = self.allocator.shrink(cp_list, i);
        try self.decomp_map.put(code_point, cp_list);
    }

    fn case_map_add(self: *Self, case_map: CaseKind, field: []const u8, code_point: u21) !void {
        const ccp: u21 = try fmt.parseInt(u21, field, 16);
        switch (case_map) {
            .Lower => try self.to_lower_map.put(code_point, ccp),
            .Title => try self.to_title_map.put(code_point, ccp),
            .Upper => try self.to_upper_map.put(code_point, ccp),
        }
    }
};

fn contains(slice: []u21, cp: u21) bool {
    for (slice) |item| {
        if (item == cp) return true;
    }
    return false;
}

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();
    var allocator = &arena.allocator;
    //var allocator = std.testing.allocator;
    var ugen = try UcdGenerator.init(allocator);
    defer ugen.deinit();
    try ugen.gen();
}
