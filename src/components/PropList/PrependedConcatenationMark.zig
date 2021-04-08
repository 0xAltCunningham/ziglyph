// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt by running ucd_gen.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Array length
//    3. Highest code point
//    4. Lowest code point
//! Unicode Prepended_Concatenation_Mark code points.

const std = @import("std");
const mem = std.mem;

const PrependedConcatenationMark = @This();

allocator: *mem.Allocator,
array: []bool,
lo: u21 = 1757,
hi: u21 = 127487,

pub fn init(allocator: *mem.Allocator) !PrependedConcatenationMark {
    var instance = PrependedConcatenationMark{
        .allocator = allocator,
        .array = try allocator.alloc(bool, 125731),
    };

    mem.set(bool, instance.array, false);

    var index: u21 = 0;
    index = 2096931;
    while (index <= 2096936) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[0] = true;
    instance.array[50] = true;
    instance.array[517] = true;
    instance.array[68064] = true;
    instance.array[68080] = true;

    // Placeholder: 0. Struct name
    return instance;
}

pub fn deinit(self: *PrependedConcatenationMark) void {
    self.allocator.free(self.array);
}

// isPrependedConcatenationMark checks if cp is of the kind Prepended_Concatenation_Mark.
pub fn isPrependedConcatenationMark(self: PrependedConcatenationMark, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    const index = cp - self.lo;
    return if (index >= self.array.len) false else self.array[index];
}
