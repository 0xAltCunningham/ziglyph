// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UCD.zip by running ucd_gen.sh.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Array length
//    3. Highest code point
//    4. Lowest code point
//! Unicode Quotation_Mark code points.

const std = @import("std");
const mem = std.mem;

const QuotationMark = @This();

allocator: *mem.Allocator,
array: []bool,
lo: u21 = 34,
hi: u21 = 65379,

pub fn init(allocator: *mem.Allocator) !QuotationMark {
    var instance = QuotationMark{
        .allocator = allocator,
        .array = try allocator.alloc(bool, 65346),
    };

    mem.set(bool, instance.array, false);

    var index: u21 = 0;
    instance.array[0] = true;
    instance.array[5] = true;
    instance.array[137] = true;
    instance.array[153] = true;
    instance.array[8182] = true;
    instance.array[8183] = true;
    instance.array[8184] = true;
    index = 8185;
    while (index <= 8186) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[8187] = true;
    instance.array[8188] = true;
    instance.array[8189] = true;
    instance.array[8215] = true;
    instance.array[8216] = true;
    instance.array[11808] = true;
    instance.array[12266] = true;
    instance.array[12267] = true;
    instance.array[12268] = true;
    instance.array[12269] = true;
    instance.array[12283] = true;
    index = 12284;
    while (index <= 12285) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[65055] = true;
    instance.array[65056] = true;
    instance.array[65057] = true;
    instance.array[65058] = true;
    instance.array[65248] = true;
    instance.array[65253] = true;
    instance.array[65344] = true;
    instance.array[65345] = true;

    // Placeholder: 0. Struct name
    return instance;
}

pub fn deinit(self: *QuotationMark) void {
    self.allocator.free(self.array);
}

// isQuotationMark checks if cp is of the kind Quotation_Mark.
pub fn isQuotationMark(self: QuotationMark, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    const index = cp - self.lo;
    return if (index >= self.array.len) false else self.array[index];
}