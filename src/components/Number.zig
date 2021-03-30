// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt by running ucd_gen.
// Placeholders:
//    0. Struct name
//    1. Array length
//    2. Highest code point
//    3. Lowest code point
//! Unicode Number category code points data.

const std = @import("std");
const mem = std.mem;
const Range = @import("../Range.zig");

const Number = @This();

allocator: *mem.Allocator,
array: []bool,
lo: u21 = 48,
hi: u21 = 130041,

pub fn init(allocator: *mem.Allocator) !Number {
    var instance = Number{
        .allocator = allocator,
        .array = try allocator.alloc(bool, 129994),
    };

    for (instance.array) |*item| {
        item.* = false;
    }

    instance.array[137] = true;
    instance.array[8256] = true;
    instance.array[11469] = true;
    instance.array[12247] = true;
    instance.array[66321] = true;
    instance.array[66330] = true;
    instance.array[129984] = true;

    var index: u21 = 0;
    index = 0;
    while (index <= 9) : (index += 1) {
        instance.array[index] = true;
    }
    index = 130;
    while (index <= 131) : (index += 1) {
        instance.array[index] = true;
    }
    index = 140;
    while (index <= 142) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1584;
    while (index <= 1593) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1728;
    while (index <= 1737) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1936;
    while (index <= 1945) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2358;
    while (index <= 2367) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2486;
    while (index <= 2495) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2500;
    while (index <= 2505) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2614;
    while (index <= 2623) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2742;
    while (index <= 2751) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2870;
    while (index <= 2879) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2882;
    while (index <= 2887) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2998;
    while (index <= 3010) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3126;
    while (index <= 3135) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3144;
    while (index <= 3150) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3254;
    while (index <= 3263) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3368;
    while (index <= 3374) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3382;
    while (index <= 3400) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3510;
    while (index <= 3519) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3616;
    while (index <= 3625) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3744;
    while (index <= 3753) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3824;
    while (index <= 3843) : (index += 1) {
        instance.array[index] = true;
    }
    index = 4112;
    while (index <= 4121) : (index += 1) {
        instance.array[index] = true;
    }
    index = 4192;
    while (index <= 4201) : (index += 1) {
        instance.array[index] = true;
    }
    index = 4921;
    while (index <= 4940) : (index += 1) {
        instance.array[index] = true;
    }
    index = 5822;
    while (index <= 5824) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6064;
    while (index <= 6073) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6080;
    while (index <= 6089) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6112;
    while (index <= 6121) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6422;
    while (index <= 6431) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6560;
    while (index <= 6570) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6736;
    while (index <= 6745) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6752;
    while (index <= 6761) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6944;
    while (index <= 6953) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7040;
    while (index <= 7049) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7184;
    while (index <= 7193) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7200;
    while (index <= 7209) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8260;
    while (index <= 8265) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8272;
    while (index <= 8281) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8480;
    while (index <= 8530) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8533;
    while (index <= 8537) : (index += 1) {
        instance.array[index] = true;
    }
    index = 9264;
    while (index <= 9323) : (index += 1) {
        instance.array[index] = true;
    }
    index = 9402;
    while (index <= 9423) : (index += 1) {
        instance.array[index] = true;
    }
    index = 10054;
    while (index <= 10083) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12273;
    while (index <= 12281) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12296;
    while (index <= 12298) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12642;
    while (index <= 12645) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12784;
    while (index <= 12793) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12824;
    while (index <= 12831) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12833;
    while (index <= 12847) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12880;
    while (index <= 12889) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12929;
    while (index <= 12943) : (index += 1) {
        instance.array[index] = true;
    }
    index = 42480;
    while (index <= 42489) : (index += 1) {
        instance.array[index] = true;
    }
    index = 42678;
    while (index <= 42687) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43008;
    while (index <= 43013) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43168;
    while (index <= 43177) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43216;
    while (index <= 43225) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43424;
    while (index <= 43433) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43456;
    while (index <= 43465) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43552;
    while (index <= 43561) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43968;
    while (index <= 43977) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65248;
    while (index <= 65257) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65751;
    while (index <= 65795) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65808;
    while (index <= 65864) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65882;
    while (index <= 65883) : (index += 1) {
        instance.array[index] = true;
    }
    index = 66225;
    while (index <= 66251) : (index += 1) {
        instance.array[index] = true;
    }
    index = 66288;
    while (index <= 66291) : (index += 1) {
        instance.array[index] = true;
    }
    index = 66465;
    while (index <= 66469) : (index += 1) {
        instance.array[index] = true;
    }
    index = 66672;
    while (index <= 66681) : (index += 1) {
        instance.array[index] = true;
    }
    index = 67624;
    while (index <= 67631) : (index += 1) {
        instance.array[index] = true;
    }
    index = 67657;
    while (index <= 67663) : (index += 1) {
        instance.array[index] = true;
    }
    index = 67703;
    while (index <= 67711) : (index += 1) {
        instance.array[index] = true;
    }
    index = 67787;
    while (index <= 67791) : (index += 1) {
        instance.array[index] = true;
    }
    index = 67814;
    while (index <= 67819) : (index += 1) {
        instance.array[index] = true;
    }
    index = 67980;
    while (index <= 67981) : (index += 1) {
        instance.array[index] = true;
    }
    index = 67984;
    while (index <= 67999) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68002;
    while (index <= 68047) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68112;
    while (index <= 68120) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68173;
    while (index <= 68174) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68205;
    while (index <= 68207) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68283;
    while (index <= 68287) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68392;
    while (index <= 68399) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68424;
    while (index <= 68431) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68473;
    while (index <= 68479) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68810;
    while (index <= 68815) : (index += 1) {
        instance.array[index] = true;
    }
    index = 68864;
    while (index <= 68873) : (index += 1) {
        instance.array[index] = true;
    }
    index = 69168;
    while (index <= 69198) : (index += 1) {
        instance.array[index] = true;
    }
    index = 69357;
    while (index <= 69366) : (index += 1) {
        instance.array[index] = true;
    }
    index = 69409;
    while (index <= 69412) : (index += 1) {
        instance.array[index] = true;
    }
    index = 69525;
    while (index <= 69531) : (index += 1) {
        instance.array[index] = true;
    }
    index = 69666;
    while (index <= 69695) : (index += 1) {
        instance.array[index] = true;
    }
    index = 69824;
    while (index <= 69833) : (index += 1) {
        instance.array[index] = true;
    }
    index = 69894;
    while (index <= 69903) : (index += 1) {
        instance.array[index] = true;
    }
    index = 70048;
    while (index <= 70057) : (index += 1) {
        instance.array[index] = true;
    }
    index = 70065;
    while (index <= 70084) : (index += 1) {
        instance.array[index] = true;
    }
    index = 70336;
    while (index <= 70345) : (index += 1) {
        instance.array[index] = true;
    }
    index = 70688;
    while (index <= 70697) : (index += 1) {
        instance.array[index] = true;
    }
    index = 70816;
    while (index <= 70825) : (index += 1) {
        instance.array[index] = true;
    }
    index = 71200;
    while (index <= 71209) : (index += 1) {
        instance.array[index] = true;
    }
    index = 71312;
    while (index <= 71321) : (index += 1) {
        instance.array[index] = true;
    }
    index = 71424;
    while (index <= 71435) : (index += 1) {
        instance.array[index] = true;
    }
    index = 71856;
    while (index <= 71874) : (index += 1) {
        instance.array[index] = true;
    }
    index = 71968;
    while (index <= 71977) : (index += 1) {
        instance.array[index] = true;
    }
    index = 72736;
    while (index <= 72764) : (index += 1) {
        instance.array[index] = true;
    }
    index = 72992;
    while (index <= 73001) : (index += 1) {
        instance.array[index] = true;
    }
    index = 73072;
    while (index <= 73081) : (index += 1) {
        instance.array[index] = true;
    }
    index = 73616;
    while (index <= 73636) : (index += 1) {
        instance.array[index] = true;
    }
    index = 74704;
    while (index <= 74814) : (index += 1) {
        instance.array[index] = true;
    }
    index = 92720;
    while (index <= 92729) : (index += 1) {
        instance.array[index] = true;
    }
    index = 92960;
    while (index <= 92969) : (index += 1) {
        instance.array[index] = true;
    }
    index = 92971;
    while (index <= 92977) : (index += 1) {
        instance.array[index] = true;
    }
    index = 93776;
    while (index <= 93798) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119472;
    while (index <= 119491) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119600;
    while (index <= 119624) : (index += 1) {
        instance.array[index] = true;
    }
    index = 120734;
    while (index <= 120783) : (index += 1) {
        instance.array[index] = true;
    }
    index = 123152;
    while (index <= 123161) : (index += 1) {
        instance.array[index] = true;
    }
    index = 123584;
    while (index <= 123593) : (index += 1) {
        instance.array[index] = true;
    }
    index = 125079;
    while (index <= 125087) : (index += 1) {
        instance.array[index] = true;
    }
    index = 125216;
    while (index <= 125225) : (index += 1) {
        instance.array[index] = true;
    }
    index = 126017;
    while (index <= 126075) : (index += 1) {
        instance.array[index] = true;
    }
    index = 126077;
    while (index <= 126079) : (index += 1) {
        instance.array[index] = true;
    }
    index = 126081;
    while (index <= 126084) : (index += 1) {
        instance.array[index] = true;
    }
    index = 126161;
    while (index <= 126205) : (index += 1) {
        instance.array[index] = true;
    }
    index = 126207;
    while (index <= 126221) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127184;
    while (index <= 127196) : (index += 1) {
        instance.array[index] = true;
    }

    // Placeholder: 0. Struct name.
    return instance;
}

pub fn deinit(self: *Number) void {
    self.allocator.free(self.array);
}

pub fn isNumber(self: Number, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    const index = cp - self.lo;
    return if (index >= self.array.len) false else self.array[index];
}
