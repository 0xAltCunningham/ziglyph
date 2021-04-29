// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UCD.zip by running ucd_gen.sh.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Lowest code point
//    3. Highest code point
//! Unicode Enclosing_Mark code points.

const std = @import("std");
const mem = std.mem;

const EnclosingMark = @This();

allocator: *mem.Allocator,
cp_set: std.AutoHashMap(u21, void),
lo: u21 = 1160,
hi: u21 = 42610,

pub fn init(allocator: *mem.Allocator) !EnclosingMark {
    var instance = EnclosingMark{
        .allocator = allocator,
        .cp_set = std.AutoHashMap(u21, void).init(allocator),
    };

    var index: u21 = 0;
    index = 1160;
    while (index <= 1161) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(6846, {});
    index = 8413;
    while (index <= 8416) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 8418;
    while (index <= 8420) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 42608;
    while (index <= 42610) : (index += 1) {
        try instance.cp_set.put(index, {});
    }

    // Placeholder: 0. Struct name, 1. Code point kind
    return instance;
}

pub fn deinit(self: *EnclosingMark) void {
    self.cp_set.deinit();
}

// isEnclosingMark checks if cp is of the kind Enclosing_Mark.
pub fn isEnclosingMark(self: EnclosingMark, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    return self.cp_set.get(cp) != null;
}
