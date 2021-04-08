// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt by running ucd_gen.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Array length
//    3. Highest code point
//    4. Lowest code point
//! Unicode Letter_Number code points.

const std = @import("std");
const mem = std.mem;

const LetterNumber = @This();

allocator: *mem.Allocator,
array: []bool,
lo: u21 = 5870,
hi: u21 = 74862,

pub fn init(allocator: *mem.Allocator) !LetterNumber {
    var instance = LetterNumber{
        .allocator = allocator,
        .array = try allocator.alloc(bool, 68993),
    };

    mem.set(bool, instance.array, false);

    var index: u21 = 0;
    index = 0;
    while (index <= 2) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2674;
    while (index <= 2708) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2711;
    while (index <= 2714) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[6425] = true;
    index = 6451;
    while (index <= 6459) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6474;
    while (index <= 6476) : (index += 1) {
        instance.array[index] = true;
    }
    index = 36856;
    while (index <= 36865) : (index += 1) {
        instance.array[index] = true;
    }
    index = 59986;
    while (index <= 60038) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[60499] = true;
    instance.array[60508] = true;
    index = 60643;
    while (index <= 60647) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68882;
    while (index <= 68992) : (index += 1) {
        instance.array[index] = true;
    }

    // Placeholder: 0. Struct name
    return instance;
}

pub fn deinit(self: *LetterNumber) void {
    self.allocator.free(self.array);
}

// isLetterNumber checks if cp is of the kind Letter_Number.
pub fn isLetterNumber(self: LetterNumber, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    const index = cp - self.lo;
    return if (index >= self.array.len) false else self.array[index];
}
