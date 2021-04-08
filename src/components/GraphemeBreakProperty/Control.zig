// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt by running ucd_gen.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Array length
//    3. Highest code point
//    4. Lowest code point
//! Unicode Control code points.

const std = @import("std");
const mem = std.mem;

const Control = @This();

allocator: *mem.Allocator,
array: []bool,
lo: u21 = 11,
hi: u21 = 921599,

pub fn init(allocator: *mem.Allocator) !Control {
    var instance = Control{
        .allocator = allocator,
        .array = try allocator.alloc(bool, 921589),
    };

    mem.set(bool, instance.array, false);

    var index: u21 = 0;
    index = 2097141;
    while (index <= 2097150) : (index += 1) {
        instance.array[index] = true;
    }
    index = 0;
    while (index <= 1) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3;
    while (index <= 20) : (index += 1) {
        instance.array[index] = true;
    }
    index = 116;
    while (index <= 148) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[162] = true;
    instance.array[1553] = true;
    instance.array[6147] = true;
    instance.array[8192] = true;
    index = 8195;
    while (index <= 8196) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[8221] = true;
    instance.array[8222] = true;
    index = 8223;
    while (index <= 8227) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8277;
    while (index <= 8281) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[8282] = true;
    index = 8283;
    while (index <= 8292) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[65268] = true;
    index = 65509;
    while (index <= 65517) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65518;
    while (index <= 65520) : (index += 1) {
        instance.array[index] = true;
    }
    index = 78885;
    while (index <= 78893) : (index += 1) {
        instance.array[index] = true;
    }
    index = 113813;
    while (index <= 113816) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119144;
    while (index <= 119151) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[917493] = true;
    instance.array[917494] = true;
    index = 917495;
    while (index <= 917524) : (index += 1) {
        instance.array[index] = true;
    }
    index = 917621;
    while (index <= 917748) : (index += 1) {
        instance.array[index] = true;
    }
    index = 917989;
    while (index <= 921588) : (index += 1) {
        instance.array[index] = true;
    }

    // Placeholder: 0. Struct name
    return instance;
}

pub fn deinit(self: *Control) void {
    self.allocator.free(self.array);
}

// isControl checks if cp is of the kind Control.
pub fn isControl(self: Control, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    const index = cp - self.lo;
    return if (index >= self.array.len) false else self.array[index];
}
