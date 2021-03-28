// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt by running ucd_gen.
// Placeholders:
//    1. Struct name
//    2. Array length
//    3. Ranges length
//! Unicode Control category code points data.

const std = @import("std");
const Range = @import("../Range.zig");

const Control = @This();

array: [1048577]bool = [_]bool{false} ** 1048577,
ranges: [18]Range = undefined, // Should this be optional?

pub fn new() Control {
    var instance: Control = Control{};

    instance.array[173] = true;
    instance.array[1564] = true;
    instance.array[1757] = true;
    instance.array[1807] = true;
    instance.array[2274] = true;
    instance.array[6158] = true;
    instance.array[55296] = true;
    instance.array[56192] = true;
    instance.array[56320] = true;
    instance.array[57344] = true;
    instance.array[65279] = true;
    instance.array[69821] = true;
    instance.array[69837] = true;
    instance.array[917505] = true;
    instance.array[983040] = true;
    instance.array[1048576] = true;
    instance.ranges[0] = Range.new(0x0, 0x1F);
    instance.ranges[1] = Range.new(0x7F, 0x9F);
    instance.ranges[2] = Range.new(0x600, 0x605);
    instance.ranges[3] = Range.new(0x200B, 0x200F);
    instance.ranges[4] = Range.new(0x202A, 0x202E);
    instance.ranges[5] = Range.new(0x2060, 0x2064);
    instance.ranges[6] = Range.new(0x2066, 0x206F);
    instance.ranges[7] = Range.new(0xFFF9, 0xFFFB);
    instance.ranges[8] = Range.new(0x13430, 0x13438);
    instance.ranges[9] = Range.new(0x1BCA0, 0x1BCA3);
    instance.ranges[10] = Range.new(0x1D173, 0x1D17A);
    instance.ranges[11] = Range.new(0xE0020, 0xE007F);
    instance.ranges[12] = Range.new(0xD800, 0xDB7F);
    instance.ranges[13] = Range.new(0xDB80, 0xDBFF);
    instance.ranges[14] = Range.new(0xDC00, 0xDFFF);
    instance.ranges[15] = Range.new(0xE000, 0xF8FF);
    instance.ranges[16] = Range.new(0xF0000, 0xFFFFD);
    instance.ranges[17] = Range.new(0x100000, 0x10FFFD);

    // Placeholder: Struct name.
    return instance;
}

pub fn isControl(self: Control, cp: u21) bool {
    if (cp < self.array.len and self.array[cp]) return true;

    //for (self.ranges) |range| {
    //    if (cp >= range.start and cp <= range.end) return true;
    //}

    return false;
}
