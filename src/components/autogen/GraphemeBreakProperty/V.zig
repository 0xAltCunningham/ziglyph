// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UCD.zip by running ucd_gen.sh.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Lowest code point
//    3. Highest code point
//! Unicode V code points.

const std = @import("std");
const mem = std.mem;

const V = @This();

allocator: *mem.Allocator,
cp_set: std.AutoHashMap(u21, void),
lo: u21 = 4448,
hi: u21 = 55238,

pub fn init(allocator: *mem.Allocator) !V {
    var instance = V{
        .allocator = allocator,
        .cp_set = std.AutoHashMap(u21, void).init(allocator),
    };

    var index: u21 = 0;
    index = 4448;
    while (index <= 4519) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 55216;
    while (index <= 55238) : (index += 1) {
        try instance.cp_set.put(index, {});
    }

    // Placeholder: 0. Struct name, 1. Code point kind
    return instance;
}

pub fn deinit(self: *V) void {
    self.cp_set.deinit();
}

// isV checks if cp is of the kind V.
pub fn isV(self: V, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    return self.cp_set.get(cp) != null;
}
