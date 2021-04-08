// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt by running ucd_gen.
// Placeholders:
//    0. Code point type
//    1. Struct name
//    2. Array length
//    3. Highest code point
//    4. Lowest code point
//! Unicode Canonical code points.

const std = @import("std");
const mem = std.mem;

const Canonical = @This();

allocator: *mem.Allocator,
array: []bool,
lo: u21 = 168,
hi: u21 = 195101,

pub fn init(allocator: *mem.Allocator) !Canonical {
    var instance = Canonical{
        .allocator = allocator,
        .array = try allocator.alloc(bool, 194934),
    };

    mem.set(bool, instance.array, false);

    var index: u21 = 0;
    index = 24;
    while (index <= 29) : (index += 1) {
        instance.array[index] = true;
    }
    index = 31;
    while (index <= 39) : (index += 1) {
        instance.array[index] = true;
    }
    index = 41;
    while (index <= 46) : (index += 1) {
        instance.array[index] = true;
    }
    index = 49;
    while (index <= 53) : (index += 1) {
        instance.array[index] = true;
    }
    index = 56;
    while (index <= 61) : (index += 1) {
        instance.array[index] = true;
    }
    index = 63;
    while (index <= 71) : (index += 1) {
        instance.array[index] = true;
    }
    index = 73;
    while (index <= 78) : (index += 1) {
        instance.array[index] = true;
    }
    index = 81;
    while (index <= 85) : (index += 1) {
        instance.array[index] = true;
    }
    index = 87;
    while (index <= 103) : (index += 1) {
        instance.array[index] = true;
    }
    index = 106;
    while (index <= 125) : (index += 1) {
        instance.array[index] = true;
    }
    index = 128;
    while (index <= 136) : (index += 1) {
        instance.array[index] = true;
    }
    index = 140;
    while (index <= 143) : (index += 1) {
        instance.array[index] = true;
    }
    index = 145;
    while (index <= 150) : (index += 1) {
        instance.array[index] = true;
    }
    index = 155;
    while (index <= 160) : (index += 1) {
        instance.array[index] = true;
    }
    index = 164;
    while (index <= 169) : (index += 1) {
        instance.array[index] = true;
    }
    index = 172;
    while (index <= 189) : (index += 1) {
        instance.array[index] = true;
    }
    index = 192;
    while (index <= 214) : (index += 1) {
        instance.array[index] = true;
    }
    index = 248;
    while (index <= 249) : (index += 1) {
        instance.array[index] = true;
    }
    index = 263;
    while (index <= 264) : (index += 1) {
        instance.array[index] = true;
    }
    index = 293;
    while (index <= 308) : (index += 1) {
        instance.array[index] = true;
    }
    index = 310;
    while (index <= 315) : (index += 1) {
        instance.array[index] = true;
    }
    index = 318;
    while (index <= 328) : (index += 1) {
        instance.array[index] = true;
    }
    index = 332;
    while (index <= 333) : (index += 1) {
        instance.array[index] = true;
    }
    index = 336;
    while (index <= 371) : (index += 1) {
        instance.array[index] = true;
    }
    index = 374;
    while (index <= 375) : (index += 1) {
        instance.array[index] = true;
    }
    index = 382;
    while (index <= 395) : (index += 1) {
        instance.array[index] = true;
    }
    index = 664;
    while (index <= 665) : (index += 1) {
        instance.array[index] = true;
    }
    index = 667;
    while (index <= 668) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[716] = true;
    instance.array[726] = true;
    instance.array[733] = true;
    instance.array[734] = true;
    instance.array[735] = true;
    index = 736;
    while (index <= 738) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[740] = true;
    index = 742;
    while (index <= 744) : (index += 1) {
        instance.array[index] = true;
    }
    index = 770;
    while (index <= 776) : (index += 1) {
        instance.array[index] = true;
    }
    index = 802;
    while (index <= 806) : (index += 1) {
        instance.array[index] = true;
    }
    index = 811;
    while (index <= 812) : (index += 1) {
        instance.array[index] = true;
    }
    index = 856;
    while (index <= 857) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[859] = true;
    instance.array[863] = true;
    index = 868;
    while (index <= 870) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[881] = true;
    instance.array[913] = true;
    index = 936;
    while (index <= 937) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[939] = true;
    instance.array[943] = true;
    index = 948;
    while (index <= 950) : (index += 1) {
        instance.array[index] = true;
    }
    index = 974;
    while (index <= 975) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1049;
    while (index <= 1050) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1064;
    while (index <= 1067) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1070;
    while (index <= 1071) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1074;
    while (index <= 1079) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1082;
    while (index <= 1087) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1090;
    while (index <= 1101) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1104;
    while (index <= 1105) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1402;
    while (index <= 1406) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[1560] = true;
    instance.array[1562] = true;
    instance.array[1579] = true;
    instance.array[2177] = true;
    instance.array[2185] = true;
    instance.array[2188] = true;
    index = 2224;
    while (index <= 2231) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2339;
    while (index <= 2340) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2356;
    while (index <= 2357) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[2359] = true;
    instance.array[2443] = true;
    instance.array[2446] = true;
    index = 2481;
    while (index <= 2483) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[2486] = true;
    instance.array[2720] = true;
    index = 2723;
    while (index <= 2724) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2740;
    while (index <= 2741) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[2796] = true;
    index = 2850;
    while (index <= 2852) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[2976] = true;
    instance.array[3096] = true;
    index = 3103;
    while (index <= 3104) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3106;
    while (index <= 3107) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3234;
    while (index <= 3236) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[3378] = true;
    index = 3380;
    while (index <= 3382) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[3739] = true;
    instance.array[3749] = true;
    instance.array[3754] = true;
    instance.array[3759] = true;
    instance.array[3764] = true;
    instance.array[3777] = true;
    instance.array[3787] = true;
    index = 3789;
    while (index <= 3790) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[3792] = true;
    instance.array[3801] = true;
    instance.array[3819] = true;
    instance.array[3829] = true;
    instance.array[3834] = true;
    instance.array[3839] = true;
    instance.array[3844] = true;
    instance.array[3857] = true;
    instance.array[3966] = true;
    instance.array[6750] = true;
    instance.array[6752] = true;
    instance.array[6754] = true;
    instance.array[6756] = true;
    instance.array[6758] = true;
    instance.array[6762] = true;
    instance.array[6803] = true;
    instance.array[6805] = true;
    index = 6808;
    while (index <= 6809) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[6811] = true;
    index = 7512;
    while (index <= 7665) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[7667] = true;
    index = 7672;
    while (index <= 7761) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7768;
    while (index <= 7789) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7792;
    while (index <= 7797) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7800;
    while (index <= 7837) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7840;
    while (index <= 7845) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7848;
    while (index <= 7855) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[7857] = true;
    instance.array[7859] = true;
    instance.array[7861] = true;
    index = 7863;
    while (index <= 7893) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7896;
    while (index <= 7948) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7950;
    while (index <= 7956) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[7958] = true;
    instance.array[7961] = true;
    index = 7962;
    while (index <= 7964) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7966;
    while (index <= 7972) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7973;
    while (index <= 7975) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7976;
    while (index <= 7979) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7982;
    while (index <= 7987) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7989;
    while (index <= 7991) : (index += 1) {
        instance.array[index] = true;
    }
    index = 7992;
    while (index <= 8004) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8005;
    while (index <= 8007) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8010;
    while (index <= 8012) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8014;
    while (index <= 8020) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[8021] = true;
    index = 8024;
    while (index <= 8025) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[8318] = true;
    index = 8322;
    while (index <= 8323) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8434;
    while (index <= 8435) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[8454] = true;
    instance.array[8485] = true;
    index = 8486;
    while (index <= 8487) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[8540] = true;
    instance.array[8545] = true;
    instance.array[8548] = true;
    instance.array[8572] = true;
    instance.array[8574] = true;
    instance.array[8601] = true;
    instance.array[8604] = true;
    instance.array[8607] = true;
    instance.array[8609] = true;
    instance.array[8632] = true;
    instance.array[8634] = true;
    index = 8645;
    while (index <= 8649) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8652;
    while (index <= 8653) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8656;
    while (index <= 8657) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8664;
    while (index <= 8665) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8668;
    while (index <= 8669) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8672;
    while (index <= 8673) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8708;
    while (index <= 8711) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8760;
    while (index <= 8763) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8770;
    while (index <= 8773) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[8833] = true;
    instance.array[8834] = true;
    instance.array[10804] = true;
    instance.array[12196] = true;
    instance.array[12198] = true;
    instance.array[12200] = true;
    instance.array[12202] = true;
    instance.array[12204] = true;
    instance.array[12206] = true;
    instance.array[12208] = true;
    instance.array[12210] = true;
    instance.array[12212] = true;
    instance.array[12214] = true;
    instance.array[12216] = true;
    instance.array[12218] = true;
    instance.array[12221] = true;
    instance.array[12223] = true;
    instance.array[12225] = true;
    index = 12232;
    while (index <= 12233) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12235;
    while (index <= 12236) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12238;
    while (index <= 12239) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12241;
    while (index <= 12242) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12244;
    while (index <= 12245) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[12268] = true;
    instance.array[12278] = true;
    instance.array[12292] = true;
    instance.array[12294] = true;
    instance.array[12296] = true;
    instance.array[12298] = true;
    instance.array[12300] = true;
    instance.array[12302] = true;
    instance.array[12304] = true;
    instance.array[12306] = true;
    instance.array[12308] = true;
    instance.array[12310] = true;
    instance.array[12312] = true;
    instance.array[12314] = true;
    instance.array[12317] = true;
    instance.array[12319] = true;
    instance.array[12321] = true;
    index = 12328;
    while (index <= 12329) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12331;
    while (index <= 12332) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12334;
    while (index <= 12335) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12337;
    while (index <= 12338) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12340;
    while (index <= 12341) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[12364] = true;
    index = 12367;
    while (index <= 12370) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[12374] = true;
    index = 43864;
    while (index <= 55035) : (index += 1) {
        instance.array[index] = true;
    }
    index = 63576;
    while (index <= 63845) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[63848] = true;
    instance.array[63850] = true;
    index = 63853;
    while (index <= 63862) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[63864] = true;
    instance.array[63866] = true;
    index = 63869;
    while (index <= 63870) : (index += 1) {
        instance.array[index] = true;
    }
    index = 63874;
    while (index <= 63941) : (index += 1) {
        instance.array[index] = true;
    }
    index = 63944;
    while (index <= 64049) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[64117] = true;
    instance.array[64119] = true;
    index = 64130;
    while (index <= 64142) : (index += 1) {
        instance.array[index] = true;
    }
    index = 64144;
    while (index <= 64148) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[64150] = true;
    index = 64152;
    while (index <= 64153) : (index += 1) {
        instance.array[index] = true;
    }
    index = 64155;
    while (index <= 64156) : (index += 1) {
        instance.array[index] = true;
    }
    index = 64158;
    while (index <= 64166) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[69618] = true;
    instance.array[69620] = true;
    instance.array[69635] = true;
    index = 69766;
    while (index <= 69767) : (index += 1) {
        instance.array[index] = true;
    }
    index = 70307;
    while (index <= 70308) : (index += 1) {
        instance.array[index] = true;
    }
    index = 70675;
    while (index <= 70676) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[70678] = true;
    index = 70930;
    while (index <= 70931) : (index += 1) {
        instance.array[index] = true;
    }
    instance.array[71824] = true;
    index = 118966;
    while (index <= 118972) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119059;
    while (index <= 119064) : (index += 1) {
        instance.array[index] = true;
    }
    index = 194392;
    while (index <= 194933) : (index += 1) {
        instance.array[index] = true;
    }

    // Placeholder: 0. Struct name
    return instance;
}

pub fn deinit(self: *Canonical) void {
    self.allocator.free(self.array);
}

// isCanonical checks if cp is of the kind Canonical.
pub fn isCanonical(self: Canonical, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    const index = cp - self.lo;
    return if (index >= self.array.len) false else self.array[index];
}
