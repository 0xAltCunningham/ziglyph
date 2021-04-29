// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UCD.zip by running ucd_gen.sh.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Lowest code point
//    3. Highest code point
//! Unicode ASCII_Hex_Digit code points.

const std = @import("std");
const mem = std.mem;

const ASCIIHexDigit = @This();

allocator: *mem.Allocator,
cp_set: std.AutoHashMap(u21, void),
lo: u21 = 48,
hi: u21 = 102,

pub fn init(allocator: *mem.Allocator) !ASCIIHexDigit {
    var instance = ASCIIHexDigit{
        .allocator = allocator,
        .cp_set = std.AutoHashMap(u21, void).init(allocator),
    };

    var index: u21 = 0;
    index = 48;
    while (index <= 57) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 65;
    while (index <= 70) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 97;
    while (index <= 102) : (index += 1) {
        try instance.cp_set.put(index, {});
    }

    // Placeholder: 0. Struct name, 1. Code point kind
    return instance;
}

pub fn deinit(self: *ASCIIHexDigit) void {
    self.cp_set.deinit();
}

// isASCIIHexDigit checks if cp is of the kind ASCII_Hex_Digit.
pub fn isASCIIHexDigit(self: ASCIIHexDigit, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    return self.cp_set.get(cp) != null;
}
