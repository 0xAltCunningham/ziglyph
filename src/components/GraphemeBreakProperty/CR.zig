// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt by running ucd_gen.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Array length
//    3. Highest code point
//    4. Lowest code point
//! Unicode CR code points.

const std = @import("std");
const mem = std.mem;

const CR = @This();

allocator: *mem.Allocator,
array: []bool,
lo: u21 = 10,
hi: u21 = 10,

pub fn init(allocator: *mem.Allocator) !CR {
    var instance = CR{
        .allocator = allocator,
        .array = try allocator.alloc(bool, 1),
    };

    mem.set(bool, instance.array, false);

    var index: u21 = 0;
    instance.array[3] = true;

    // Placeholder: 0. Struct name
    return instance;
}

pub fn deinit(self: *CR) void {
    self.allocator.free(self.array);
}

// isCR checks if cp is of the kind CR.
pub fn isCR(self: CR, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    const index = cp - self.lo;
    return if (index >= self.array.len) false else self.array[index];
}
