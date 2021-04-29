// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UCD.zip by running ucd_gen.sh.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Lowest code point
//    3. Highest code point
//! Unicode SpacingMark code points.

const std = @import("std");
const mem = std.mem;

const SpacingMark = @This();

allocator: *mem.Allocator,
cp_set: std.AutoHashMap(u21, void),
lo: u21 = 2307,
hi: u21 = 119149,

pub fn init(allocator: *mem.Allocator) !SpacingMark {
    var instance = SpacingMark{
        .allocator = allocator,
        .cp_set = std.AutoHashMap(u21, void).init(allocator),
    };

    var index: u21 = 0;
    try instance.cp_set.put(2307, {});
    try instance.cp_set.put(2363, {});
    index = 2366;
    while (index <= 2368) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 2377;
    while (index <= 2380) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 2382;
    while (index <= 2383) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 2434;
    while (index <= 2435) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 2495;
    while (index <= 2496) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 2503;
    while (index <= 2504) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 2507;
    while (index <= 2508) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(2563, {});
    index = 2622;
    while (index <= 2624) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(2691, {});
    index = 2750;
    while (index <= 2752) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(2761, {});
    index = 2763;
    while (index <= 2764) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 2818;
    while (index <= 2819) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(2880, {});
    index = 2887;
    while (index <= 2888) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 2891;
    while (index <= 2892) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(3007, {});
    index = 3009;
    while (index <= 3010) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3014;
    while (index <= 3016) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3018;
    while (index <= 3020) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3073;
    while (index <= 3075) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3137;
    while (index <= 3140) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3202;
    while (index <= 3203) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(3262, {});
    index = 3264;
    while (index <= 3265) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3267;
    while (index <= 3268) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3271;
    while (index <= 3272) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3274;
    while (index <= 3275) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3330;
    while (index <= 3331) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3391;
    while (index <= 3392) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3398;
    while (index <= 3400) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3402;
    while (index <= 3404) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3458;
    while (index <= 3459) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3536;
    while (index <= 3537) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3544;
    while (index <= 3550) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 3570;
    while (index <= 3571) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(3635, {});
    try instance.cp_set.put(3763, {});
    index = 3902;
    while (index <= 3903) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(3967, {});
    try instance.cp_set.put(4145, {});
    index = 4155;
    while (index <= 4156) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 4182;
    while (index <= 4183) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(4228, {});
    try instance.cp_set.put(6070, {});
    index = 6078;
    while (index <= 6085) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 6087;
    while (index <= 6088) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 6435;
    while (index <= 6438) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 6441;
    while (index <= 6443) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 6448;
    while (index <= 6449) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 6451;
    while (index <= 6456) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 6681;
    while (index <= 6682) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(6741, {});
    try instance.cp_set.put(6743, {});
    index = 6765;
    while (index <= 6770) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(6916, {});
    try instance.cp_set.put(6971, {});
    index = 6973;
    while (index <= 6977) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 6979;
    while (index <= 6980) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(7042, {});
    try instance.cp_set.put(7073, {});
    index = 7078;
    while (index <= 7079) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(7082, {});
    try instance.cp_set.put(7143, {});
    index = 7146;
    while (index <= 7148) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(7150, {});
    index = 7154;
    while (index <= 7155) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 7204;
    while (index <= 7211) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 7220;
    while (index <= 7221) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(7393, {});
    try instance.cp_set.put(7415, {});
    index = 43043;
    while (index <= 43044) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(43047, {});
    index = 43136;
    while (index <= 43137) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 43188;
    while (index <= 43203) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 43346;
    while (index <= 43347) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(43395, {});
    index = 43444;
    while (index <= 43445) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 43450;
    while (index <= 43451) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 43454;
    while (index <= 43456) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 43567;
    while (index <= 43568) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 43571;
    while (index <= 43572) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(43597, {});
    try instance.cp_set.put(43755, {});
    index = 43758;
    while (index <= 43759) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(43765, {});
    index = 44003;
    while (index <= 44004) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 44006;
    while (index <= 44007) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 44009;
    while (index <= 44010) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(44012, {});
    try instance.cp_set.put(69632, {});
    try instance.cp_set.put(69634, {});
    try instance.cp_set.put(69762, {});
    index = 69808;
    while (index <= 69810) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 69815;
    while (index <= 69816) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(69932, {});
    index = 69957;
    while (index <= 69958) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(70018, {});
    index = 70067;
    while (index <= 70069) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 70079;
    while (index <= 70080) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(70094, {});
    index = 70188;
    while (index <= 70190) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 70194;
    while (index <= 70195) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(70197, {});
    index = 70368;
    while (index <= 70370) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 70402;
    while (index <= 70403) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(70463, {});
    index = 70465;
    while (index <= 70468) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 70471;
    while (index <= 70472) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 70475;
    while (index <= 70477) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 70498;
    while (index <= 70499) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 70709;
    while (index <= 70711) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 70720;
    while (index <= 70721) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(70725, {});
    index = 70833;
    while (index <= 70834) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(70841, {});
    index = 70843;
    while (index <= 70844) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(70846, {});
    try instance.cp_set.put(70849, {});
    index = 71088;
    while (index <= 71089) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 71096;
    while (index <= 71099) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(71102, {});
    index = 71216;
    while (index <= 71218) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 71227;
    while (index <= 71228) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(71230, {});
    try instance.cp_set.put(71340, {});
    index = 71342;
    while (index <= 71343) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(71350, {});
    index = 71456;
    while (index <= 71457) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(71462, {});
    index = 71724;
    while (index <= 71726) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(71736, {});
    index = 71985;
    while (index <= 71989) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 71991;
    while (index <= 71992) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(71997, {});
    try instance.cp_set.put(72000, {});
    try instance.cp_set.put(72002, {});
    index = 72145;
    while (index <= 72147) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 72156;
    while (index <= 72159) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(72164, {});
    try instance.cp_set.put(72249, {});
    index = 72279;
    while (index <= 72280) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(72343, {});
    try instance.cp_set.put(72751, {});
    try instance.cp_set.put(72766, {});
    try instance.cp_set.put(72873, {});
    try instance.cp_set.put(72881, {});
    try instance.cp_set.put(72884, {});
    index = 73098;
    while (index <= 73102) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 73107;
    while (index <= 73108) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(73110, {});
    index = 73461;
    while (index <= 73462) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 94033;
    while (index <= 94087) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    index = 94192;
    while (index <= 94193) : (index += 1) {
        try instance.cp_set.put(index, {});
    }
    try instance.cp_set.put(119142, {});
    try instance.cp_set.put(119149, {});

    // Placeholder: 0. Struct name, 1. Code point kind
    return instance;
}

pub fn deinit(self: *SpacingMark) void {
    self.cp_set.deinit();
}

// isSpacingMark checks if cp is of the kind SpacingMark.
pub fn isSpacingMark(self: SpacingMark, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    return self.cp_set.get(cp) != null;
}
