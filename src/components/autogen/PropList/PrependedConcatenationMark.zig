// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UCD.zip by running ucd_gen.sh.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Lowest code point
//    3. Highest code point
//! Unicode Prepended_Concatenation_Mark code points.

const std = @import("std");
const mem = std.mem;

const PrependedConcatenationMark = @This();

allocator: *mem.Allocator,
cp_set: std.AutoHashMap(u21, void),
lo: u21 = 1536,
hi: u21 = 69837,

pub fn init(allocator: *mem.Allocator) !PrependedConcatenationMark {
    var instance = PrependedConcatenationMark{
        .allocator = allocator,
        .cp_set = std.AutoHashMap(u21, void).init(allocator),
    };

    var index: u21 = 0;
    index = 1536;
    while (index <= 1541) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(1757, {});
    try instance.cp_set.put(1807, {});
    try instance.cp_set.put(2274, {});
    try instance.cp_set.put(69821, {});
    try instance.cp_set.put(69837, {});

    // Placeholder: 0. Struct name, 1. Code point kind
    return instance;
}

pub fn deinit(self: *PrependedConcatenationMark) void {
    self.cp_set.deinit();
}

// isPrependedConcatenationMark checks if cp is of the kind Prepended_Concatenation_Mark.
pub fn isPrependedConcatenationMark(self: PrependedConcatenationMark, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    return self.cp_set.get(cp) != null;
}
