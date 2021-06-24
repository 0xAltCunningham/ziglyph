// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UCD.zip by running ucd_gen.sh.
//! Unicode decomposition map.

const std = @import("std");
const fmt = std.fmt;
const mem = std.mem;
const sort = std.sort.sort;
const unicode = std.unicode;

const CaseFoldMap = @import("../components.zig").CaseFoldMap;
const CccMap = @import("../components.zig").CombiningMap;
const HangulMap = @import("../components.zig").HangulMap;
const NFDCheck = @import("../components.zig").NFDCheck;
const Trieton = @import("Trieton.zig");
const DecompFile = @import("DecompFile.zig");
const Decomp = DecompFile.Decomp;
const Form = DecompFile.Form;

const Lookup = Trieton.Lookup;

allocator: *mem.Allocator,
arena: std.heap.ArenaAllocator,
decomp_trie: Trieton,

const Self = @This();

pub fn init(allocator: *mem.Allocator, filename: []const u8) !Self {
    var self = Self{
        .allocator = allocator,
        .arena = std.heap.ArenaAllocator.init(allocator),
        .decomp_trie = Trieton.init(allocator),
    };

    var file = try DecompFile.parseFile(allocator, filename);
    defer file.deinit();
    while (file.next()) |entry| {
        try self.decomp_trie.add(entry.key[0..entry.key_len], entry.value);
    }

    return self;
}

pub fn deinit(self: *Self) void {
    self.decomp_trie.deinit();
    self.arena.deinit();
}

var cp_buf: [4]u8 = undefined;

/// mapping retrieves the decomposition mapping for a code point as per the UCD.
pub fn mapping(self: Self, cp: u21, nfd: bool) Decomp {
    const len = unicode.utf8Encode(cp, &cp_buf) catch |err| {
        std.debug.print("Normalizer.mapping: error encoding UTF-8 for 0x{x}; {}\n", .{ cp, err });
        std.os.exit(1);
    };

    const lookup = self.decomp_trie.find(cp_buf[0..len]);

    if (lookup) |l| {
        // Got an entry.
        if (l.index == len - 1) {
            // Full match.
            if (nfd and l.value.form == .compat) {
                return Decomp{ .form = .same, .len = 1, .seq = [_]u21{ cp, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
            } else {
                return l.value;
            }
        }
    }

    return Decomp{ .form = .same, .len = 1, .seq = [_]u21{ cp, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 } };
}

/// decompose takes a code point and returns its decomposition to NFD if `nfd` is true, NFKD otherwise.
pub fn decompose(self: Self, cp: u21, nfd: bool) Decomp {
    var dc = Decomp{};

    if (nfd and NFDCheck.isNFD(cp)) {
        dc.len = 1;
        dc.seq[0] = cp;
        return dc;
    }

    if (self.isHangulPrecomposed(cp)) {
        // Hangul precomposed syllable full decomposition.
        const seq = self.decomposeHangul(cp);
        dc.len = if (seq[2] == 0) 2 else 3;
        mem.copy(u21, &dc.seq, seq[0..dc.len]);
        return dc;
    }

    if (!nfd) dc.form = .compat;
    var result_index: usize = 0;

    var work: [18]u21 = undefined;
    var work_index: usize = 1;
    work[0] = cp;

    while (work_index > 0) {
        work_index -= 1;
        const next = work[work_index];
        const m = self.mapping(next, nfd);

        if (m.form == .same) {
            dc.seq[result_index] = m.seq[0];
            result_index += 1;
            continue;
        }

        var i: usize = m.len - 1;

        while (true) {
            work[work_index] = m.seq[i];
            work_index += 1;
            if (i == 0) break;
            i -= 1;
        }
    }

    dc.len = result_index;

    return dc;
}

fn finalizeAndEncode(self: *Self, code_points: []u21) ![]u8 {
    var result = try std.ArrayList(u8).initCapacity(&self.arena.allocator, code_points.len * 4);

    // Apply canonical sort algorithm.
    self.canonicalSort(code_points);

    // Encode as UTF-8 code units.
    var buf: [4]u8 = undefined;
    for (code_points) |dcp| {
        const len = try unicode.utf8Encode(dcp, &buf);
        result.appendSliceAssumeCapacity(buf[0..len]);
    }

    return result.items;
}

/// normalizeTo will normalize the code points in str, producing a slice of u8 with the new bytes
/// corresponding to the specified Normalization Form.
pub fn normalizeTo(self: *Self, form: Form, str: []const u8) anyerror![]u8 {
    // Gather source code points.
    var code_points = try std.ArrayList(u21).initCapacity(&self.arena.allocator, str.len);

    var iter = (try unicode.Utf8View.init(str)).iterator();

    while (iter.nextCodepoint()) |cp| {
        code_points.appendAssumeCapacity(cp);
    }

    // NFD Quick Check.
    if (form == .canon) {
        var already_nfd = true;

        for (code_points.items) |cp| {
            if (!NFDCheck.isNFD(cp)) already_nfd = false;
        }

        // Already NFD, nothing more to do.
        if (already_nfd) return self.finalizeAndEncode(code_points.items);
    }

    var d_code_points = std.ArrayList(u21).init(&self.arena.allocator);

    // Gather decomposed code points.
    for (code_points.items) |cp| {
        const dc = self.decompose(cp, form == .canon);
        try d_code_points.appendSlice(dc.seq[0..dc.len]);
    }

    return self.finalizeAndEncode(d_code_points.items);
}

/// normalizeCodePointsTo will normalize the code points in str, producing a new slice of code points
/// corresponding to the specified Normalization Form.
pub fn normalizeCodePointsTo(self: *Self, form: Form, str: []const u8) anyerror![]u21 {
    // Gather source code points.
    var code_points = try std.ArrayList(u21).initCapacity(&self.arena.allocator, str.len);

    var iter = (try unicode.Utf8View.init(str)).iterator();

    while (iter.nextCodepoint()) |cp| {
        code_points.appendAssumeCapacity(cp);
    }

    // NFD Quick Check.
    if (form == .canon) {
        var already_nfd = true;

        for (code_points.items) |cp| {
            if (!NFDCheck.isNFD(cp)) already_nfd = false;
        }

        // Already NFD, nothing more to do.
        if (already_nfd) {
            // Apply canonical sort algorithm.
            self.canonicalSort(code_points.items);
            return code_points.items;
        }
    }

    var d_code_points = std.ArrayList(u21).init(&self.arena.allocator);

    // Gather decomposed code points.
    for (code_points.items) |cp| {
        const dc = self.decompose(cp, form == .canon);
        try d_code_points.appendSlice(dc.seq[0..dc.len]);
    }

    // Apply canonical sort algorithm.
    self.canonicalSort(d_code_points.items);
    return d_code_points.items;
}

fn cccLess(self: Self, lhs: u21, rhs: u21) bool {
    return CccMap.combiningClass(lhs) < CccMap.combiningClass(rhs);
}

fn canonicalSort(self: Self, cp_list: []u21) void {
    var i: usize = 0;
    while (true) {
        if (i >= cp_list.len) break;
        var start: usize = i;
        while (i < cp_list.len and CccMap.combiningClass(cp_list[i]) != 0) : (i += 1) {}
        sort(u21, cp_list[start..i], self, cccLess);
        i += 1;
    }
}

fn decomposeHangul(self: Self, cp: u21) [3]u21 {
    const SBase: u21 = 0xAC00;
    const LBase: u21 = 0x1100;
    const VBase: u21 = 0x1161;
    const TBase: u21 = 0x11A7;
    const LCount: u21 = 19;
    const VCount: u21 = 21;
    const TCount: u21 = 28;
    const NCount: u21 = 588; // VCount * TCount
    const SCount: u21 = 11172; // LCount * NCount

    const SIndex: u21 = cp - SBase;
    const LIndex: u21 = SIndex / NCount;
    const VIndex: u21 = (SIndex % NCount) / TCount;
    const TIndex: u21 = SIndex % TCount;
    const LPart: u21 = LBase + LIndex;
    const VPart: u21 = VBase + VIndex;
    var TPart: u21 = 0;
    if (TIndex != 0) TPart = TBase + TIndex;

    return [3]u21{ LPart, VPart, TPart };
}

fn isHangulPrecomposed(self: Self, cp: u21) bool {
    if (HangulMap.syllableType(cp)) |kind| {
        return switch (kind) {
            .LV, .LVT => true,
            else => false,
        };
    } else {
        return false;
    }
}

/// CmpMode determines the type of comparison to be performed.
/// * ignore_case compares ignoring letter case.
/// * normalize compares the result of normalizing to canonical form (NFD).
/// * norm_ignore combines both ignore_case and normalize modes.
pub const CmpMode = enum {
    ignore_case,
    normalize,
    norm_ignore,
};

/// eqlBy compares for equality between `a` and `b` according to the specified comparison mode.
pub fn eqlBy(self: *Self, a: []const u8, b: []const u8, mode: CmpMode) !bool {
    // Empty string quick check.
    if (a.len == 0 and b.len == 0) return true;
    if (a.len == 0 and b.len != 0) return false;
    if (b.len == 0 and a.len != 0) return false;

    // Check for ASCII only comparison.
    var ascii_only = try isAsciiStr(a);

    if (ascii_only) {
        ascii_only = try isAsciiStr(b);
    }

    // If ASCII only, different lengths mean inequality.
    const len_a = a.len;
    const len_b = b.len;
    var len_eql = len_a == len_b;

    if (ascii_only and !len_eql) return false;

    if (mode == .ignore_case and len_eql) {
        if (ascii_only) {
            // ASCII case insensitive.
            for (a) |c, i| {
                const oc = b[i];
                const lc = if (c >= 'A' and c <= 'Z') c ^ 32 else c;
                const olc = if (oc >= 'A' and oc <= 'Z') oc ^ 32 else oc;
                if (lc != olc) return false;
            }
            return true;
        }

        // Non-ASCII case insensitive.
        return self.eqlIgnoreCase(a, b);
    }

    if (mode == .normalize) return self.eqlNorm(a, b);
    if (mode == .norm_ignore) return self.eqlNormIgnore(a, b);

    return false;
}

fn eqlIgnoreCase(self: *Self, a: []const u8, b: []const u8) !bool {
    const cf_a = try CaseFoldMap.caseFoldStr(&self.arena.allocator, a);
    const cf_b = try CaseFoldMap.caseFoldStr(&self.arena.allocator, b);

    return mem.eql(u8, cf_a, cf_b);
}

fn eqlNorm(self: *Self, a: []const u8, b: []const u8) !bool {
    const norm_a = try self.normalizeTo(.canon, a);
    const norm_b = try self.normalizeTo(.canon, b);

    return mem.eql(u8, norm_a, norm_b);
}

fn eqlNormIgnore(self: *Self, a: []const u8, b: []const u8) !bool {
    // The long winding road of normalized caseless matching...
    // NFD(CaseFold(NFD(str)))
    var norm_a = try self.normalizeTo(.canon, a);
    var cf_a = try CaseFoldMap.caseFoldStr(&self.arena.allocator, norm_a);
    norm_a = try self.normalizeTo(.canon, cf_a);
    var norm_b = try self.normalizeTo(.canon, b);
    var cf_b = try CaseFoldMap.caseFoldStr(&self.arena.allocator, norm_b);
    norm_b = try self.normalizeTo(.canon, cf_b);

    return mem.eql(u8, norm_a, norm_b);
}

/// isAsciiStr checks if a string (`[]const uu`) is composed solely of ASCII characters.
fn isAsciiStr(str: []const u8) !bool {
    // Shamelessly stolen from std.unicode.
    const N = @sizeOf(usize);
    const MASK = 0x80 * (std.math.maxInt(usize) / 0xff);

    var i: usize = 0;
    while (i < str.len) {
        // Fast path for ASCII sequences
        while (i + N <= str.len) : (i += N) {
            const v = mem.readIntNative(usize, str[i..][0..N]);
            if (v & MASK != 0) {
                return false;
            }
        }

        if (i < str.len) {
            const n = try unicode.utf8ByteSequenceLength(str[i]);
            if (i + n > str.len) return error.TruncatedInput;

            switch (n) {
                1 => {}, // ASCII
                else => return false,
            }

            i += n;
        }
    }

    return true;
}

test "Normalizer decompose D" {
    var allocator = std.testing.allocator;
    var normalizer = try init(allocator, "src/data/ucd/UnicodeData.txt");
    defer normalizer.deinit();

    var result = normalizer.decompose('\u{00E9}', true);
    try std.testing.expectEqual(result.seq[0], 0x0065);
    try std.testing.expectEqual(result.seq[1], 0x0301);

    result = normalizer.decompose('\u{03D3}', true);
    try std.testing.expectEqual(result.seq[0], 0x03D2);
    try std.testing.expectEqual(result.seq[1], 0x0301);
}

test "Normalizer decompose KD" {
    var allocator = std.testing.allocator;
    var normalizer = try init(allocator, "src/data/ucd/UnicodeData.txt");
    defer normalizer.deinit();

    var result = normalizer.decompose('\u{00E9}', false);
    try std.testing.expectEqual(result.seq[0], 0x0065);
    try std.testing.expectEqual(result.seq[1], 0x0301);

    result = normalizer.decompose('\u{03D3}', false);
    try std.testing.expectEqual(result.seq[0], 0x03A5);
    try std.testing.expectEqual(result.seq[1], 0x0301);
}

test "Normalizer normalizeTo" {
    var arena = std.heap.ArenaAllocator.init(std.testing.allocator);
    defer arena.deinit();
    var allocator = &arena.allocator;
    var normalizer = try init(allocator, "src/data/ucd/UnicodeData.txt");
    defer normalizer.deinit();

    var file = try std.fs.cwd().openFile("src/data/ucd/NormalizationTest.txt", .{});
    defer file.close();
    var buf_reader = std.io.bufferedReader(file.reader());
    var input_stream = buf_reader.reader();
    var buf: [640]u8 = undefined;

    while (try input_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        // Skip comments or empty lines.
        if (line.len == 0 or line[0] == '#' or line[0] == '@') continue;
        // Iterate over fields.
        var fields = mem.split(line, ";");
        var field_index: usize = 0;
        var input: []u8 = undefined;

        while (fields.next()) |field| : (field_index += 1) {
            if (field_index == 0) {
                var i_buf = std.ArrayList(u8).init(allocator);
                defer i_buf.deinit();
                var i_fields = mem.split(field, " ");
                while (i_fields.next()) |s| {
                    const icp = try std.fmt.parseInt(u21, s, 16);
                    const len = try unicode.utf8Encode(icp, &cp_buf);
                    try i_buf.appendSlice(cp_buf[0..len]);
                }
                input = i_buf.toOwnedSlice();
            } else if (field_index == 2) {
                // NFD, time to test.
                var w_buf = std.ArrayList(u8).init(allocator);
                defer w_buf.deinit();
                var w_fields = mem.split(field, " ");
                while (w_fields.next()) |s| {
                    const wcp = try std.fmt.parseInt(u21, s, 16);
                    const len = try unicode.utf8Encode(wcp, &cp_buf);
                    try w_buf.appendSlice(cp_buf[0..len]);
                }
                const want = w_buf.items;
                const got = try normalizer.normalizeTo(.canon, input);
                try std.testing.expectEqualSlices(u8, want, got);
                continue;
            } else if (field_index == 4) {
                // NFKD, time to test.
                var w_buf = std.ArrayList(u8).init(allocator);
                defer w_buf.deinit();
                var w_fields = mem.split(field, " ");
                while (w_fields.next()) |s| {
                    const wcp = try std.fmt.parseInt(u21, s, 16);
                    const len = try unicode.utf8Encode(wcp, &cp_buf);
                    try w_buf.appendSlice(cp_buf[0..len]);
                }
                const want = w_buf.items;
                const got = try normalizer.normalizeTo(.compat, input);
                try std.testing.expectEqualSlices(u8, want, got);
                continue;
            } else {
                continue;
            }
        }
    }
}

test "Normalizer eqlBy" {
    var allocator = std.testing.allocator;
    var normalizer = try init(allocator, "src/data/ucd/UnicodeData.txt");
    defer normalizer.deinit();

    try std.testing.expect(try normalizer.eqlBy("foé", "foe\u{0301}", .normalize));
    try std.testing.expect(try normalizer.eqlBy("foϓ", "fo\u{03D2}\u{0301}", .normalize));
    try std.testing.expect(try normalizer.eqlBy("Foϓ", "fo\u{03D2}\u{0301}", .norm_ignore));
    try std.testing.expect(try normalizer.eqlBy("FOÉ", "foe\u{0301}", .norm_ignore)); // foÉ == foé
}
