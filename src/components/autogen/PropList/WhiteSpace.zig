// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UCD.zip by running ucd_gen.sh.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Lowest code point
//    3. Highest code point
//! Unicode White_Space code points.

const std = @import("std");
const mem = std.mem;

const WhiteSpace = @This();

allocator: *mem.Allocator,
cp_set: std.AutoHashMap(u21, void),
lo: u21 = 9,
hi: u21 = 12288,

pub fn init(allocator: *mem.Allocator) !WhiteSpace {
    var instance = WhiteSpace{
        .allocator = allocator,
        .cp_set = std.AutoHashMap(u21, void).init(allocator),
    };

    var index: u21 = 0;
    index = 9;
    while (index <= 13) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(32, {});
    try instance.cp_set.put(133, {});
    try instance.cp_set.put(160, {});
    try instance.cp_set.put(5760, {});
    index = 8192;
    while (index <= 8202) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(8232, {});
    try instance.cp_set.put(8233, {});
    try instance.cp_set.put(8239, {});
    try instance.cp_set.put(8287, {});
    try instance.cp_set.put(12288, {});

    // Placeholder: 0. Struct name, 1. Code point kind
    return instance;
}

pub fn deinit(self: *WhiteSpace) void {
    self.cp_set.deinit();
}

// isWhiteSpace checks if cp is of the kind White_Space.
pub fn isWhiteSpace(self: WhiteSpace, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    return self.cp_set.get(cp) != null;
}
