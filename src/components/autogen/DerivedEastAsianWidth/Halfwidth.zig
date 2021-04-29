// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UCD.zip by running ucd_gen.sh.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Lowest code point
//    3. Highest code point
//! Unicode Halfwidth code points.

const std = @import("std");
const mem = std.mem;

const Halfwidth = @This();

allocator: *mem.Allocator,
cp_set: std.AutoHashMap(u21, void),
lo: u21 = 8361,
hi: u21 = 65518,

pub fn init(allocator: *mem.Allocator) !Halfwidth {
    var instance = Halfwidth{
        .allocator = allocator,
        .cp_set = std.AutoHashMap(u21, void).init(allocator),
    };

    var index: u21 = 0;
    try instance.cp_set.put(8361, {});
    try instance.cp_set.put(65377, {});
    try instance.cp_set.put(65378, {});
    try instance.cp_set.put(65379, {});
    index = 65380;
    while (index <= 65381) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 65382;
    while (index <= 65391) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(65392, {});
    index = 65393;
    while (index <= 65437) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 65438;
    while (index <= 65439) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 65440;
    while (index <= 65470) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 65474;
    while (index <= 65479) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 65482;
    while (index <= 65487) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 65490;
    while (index <= 65495) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 65498;
    while (index <= 65500) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(65512, {});
    index = 65513;
    while (index <= 65516) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 65517;
    while (index <= 65518) : (index += 1) {
        try instance.cp_set.put(index, {});
    }

    // Placeholder: 0. Struct name, 1. Code point kind
    return instance;
}

pub fn deinit(self: *Halfwidth) void {
    self.cp_set.deinit();
}

// isHalfwidth checks if cp is of the kind Halfwidth.
pub fn isHalfwidth(self: Halfwidth, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    return self.cp_set.get(cp) != null;
}
