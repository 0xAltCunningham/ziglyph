// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt by running ucd_gen.
// Placeholders:
//    0. Struct name
//    1. Array length
//    2. Highest code point
//    3. Lowest code point
//! Unicode Symbol category code points data.

const std = @import("std");
const mem = std.mem;
const Range = @import("../Range.zig");

const Symbol = @This();

allocator: *mem.Allocator,
array: []bool,
lo: u21 = 36,
hi: u21 = 129994,

pub fn init(allocator: *mem.Allocator) !Symbol {
    var instance = Symbol{
        .allocator = allocator,
        .array = try allocator.alloc(bool, 129959),
    };

    for (instance.array) |*item| {
        item.* = false;
    }

    instance.array[0] = true;
    instance.array[7] = true;
    instance.array[58] = true;
    instance.array[60] = true;
    instance.array[88] = true;
    instance.array[90] = true;
    instance.array[136] = true;
    instance.array[144] = true;
    instance.array[148] = true;
    instance.array[179] = true;
    instance.array[211] = true;
    instance.array[713] = true;
    instance.array[849] = true;
    instance.array[978] = true;
    instance.array[1118] = true;
    instance.array[1511] = true;
    instance.array[1722] = true;
    instance.array[1733] = true;
    instance.array[2002] = true;
    instance.array[2765] = true;
    instance.array[2892] = true;
    instance.array[3163] = true;
    instance.array[3371] = true;
    instance.array[3413] = true;
    instance.array[3611] = true;
    instance.array[3823] = true;
    instance.array[3856] = true;
    instance.array[3858] = true;
    instance.array[3860] = true;
    instance.array[5705] = true;
    instance.array[6071] = true;
    instance.array[6428] = true;
    instance.array[8089] = true;
    instance.array[8224] = true;
    instance.array[8238] = true;
    instance.array[8432] = true;
    instance.array[8449] = true;
    instance.array[8451] = true;
    instance.array[8453] = true;
    instance.array[8458] = true;
    instance.array[8491] = true;
    instance.array[12256] = true;
    instance.array[12284] = true;
    instance.array[12844] = true;
    instance.array[43831] = true;
    instance.array[64261] = true;
    instance.array[65086] = true;
    instance.array[65093] = true;
    instance.array[65248] = true;
    instance.array[65255] = true;
    instance.array[65306] = true;
    instance.array[65308] = true;
    instance.array[65336] = true;
    instance.array[65338] = true;
    instance.array[65916] = true;
    instance.array[68260] = true;
    instance.array[71451] = true;
    instance.array[92961] = true;
    instance.array[113784] = true;
    instance.array[119329] = true;
    instance.array[120477] = true;
    instance.array[120503] = true;
    instance.array[120535] = true;
    instance.array[120561] = true;
    instance.array[120593] = true;
    instance.array[120619] = true;
    instance.array[120651] = true;
    instance.array[120677] = true;
    instance.array[120709] = true;
    instance.array[120735] = true;
    instance.array[123179] = true;
    instance.array[123611] = true;
    instance.array[126088] = true;
    instance.array[126092] = true;
    instance.array[126218] = true;
    instance.array[129904] = true;

    var index: u21 = 0;
    index = 24;
    while (index <= 26) : (index += 1) {
        instance.array[index] = true;
    }
    index = 126;
    while (index <= 130) : (index += 1) {
        instance.array[index] = true;
    }
    index = 132;
    while (index <= 133) : (index += 1) {
        instance.array[index] = true;
    }
    index = 138;
    while (index <= 141) : (index += 1) {
        instance.array[index] = true;
    }
    index = 670;
    while (index <= 673) : (index += 1) {
        instance.array[index] = true;
    }
    index = 686;
    while (index <= 699) : (index += 1) {
        instance.array[index] = true;
    }
    index = 705;
    while (index <= 711) : (index += 1) {
        instance.array[index] = true;
    }
    index = 715;
    while (index <= 731) : (index += 1) {
        instance.array[index] = true;
    }
    index = 864;
    while (index <= 865) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1385;
    while (index <= 1387) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1506;
    while (index <= 1508) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1514;
    while (index <= 1515) : (index += 1) {
        instance.array[index] = true;
    }
    index = 1753;
    while (index <= 1754) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2010;
    while (index <= 2011) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2510;
    while (index <= 2511) : (index += 1) {
        instance.array[index] = true;
    }
    index = 2518;
    while (index <= 2519) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3023;
    while (index <= 3030) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3805;
    while (index <= 3807) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3825;
    while (index <= 3827) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3830;
    while (index <= 3835) : (index += 1) {
        instance.array[index] = true;
    }
    index = 3994;
    while (index <= 4001) : (index += 1) {
        instance.array[index] = true;
    }
    index = 4003;
    while (index <= 4008) : (index += 1) {
        instance.array[index] = true;
    }
    index = 4010;
    while (index <= 4011) : (index += 1) {
        instance.array[index] = true;
    }
    index = 4017;
    while (index <= 4020) : (index += 1) {
        instance.array[index] = true;
    }
    index = 4218;
    while (index <= 4219) : (index += 1) {
        instance.array[index] = true;
    }
    index = 4972;
    while (index <= 4981) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6586;
    while (index <= 6619) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6973;
    while (index <= 6982) : (index += 1) {
        instance.array[index] = true;
    }
    index = 6992;
    while (index <= 7000) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8091;
    while (index <= 8093) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8105;
    while (index <= 8107) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8121;
    while (index <= 8123) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8137;
    while (index <= 8139) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8153;
    while (index <= 8154) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8278;
    while (index <= 8280) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8294;
    while (index <= 8296) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8316;
    while (index <= 8347) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8412;
    while (index <= 8413) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8415;
    while (index <= 8418) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8420;
    while (index <= 8421) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8434;
    while (index <= 8436) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8442;
    while (index <= 8447) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8470;
    while (index <= 8471) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8476;
    while (index <= 8480) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8486;
    while (index <= 8489) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8550;
    while (index <= 8551) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8556;
    while (index <= 8931) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8936;
    while (index <= 8964) : (index += 1) {
        instance.array[index] = true;
    }
    index = 8967;
    while (index <= 9218) : (index += 1) {
        instance.array[index] = true;
    }
    index = 9244;
    while (index <= 9254) : (index += 1) {
        instance.array[index] = true;
    }
    index = 9336;
    while (index <= 9413) : (index += 1) {
        instance.array[index] = true;
    }
    index = 9436;
    while (index <= 10051) : (index += 1) {
        instance.array[index] = true;
    }
    index = 10096;
    while (index <= 10144) : (index += 1) {
        instance.array[index] = true;
    }
    index = 10147;
    while (index <= 10177) : (index += 1) {
        instance.array[index] = true;
    }
    index = 10188;
    while (index <= 10590) : (index += 1) {
        instance.array[index] = true;
    }
    index = 10613;
    while (index <= 10675) : (index += 1) {
        instance.array[index] = true;
    }
    index = 10680;
    while (index <= 10711) : (index += 1) {
        instance.array[index] = true;
    }
    index = 10714;
    while (index <= 11087) : (index += 1) {
        instance.array[index] = true;
    }
    index = 11090;
    while (index <= 11121) : (index += 1) {
        instance.array[index] = true;
    }
    index = 11123;
    while (index <= 11227) : (index += 1) {
        instance.array[index] = true;
    }
    index = 11457;
    while (index <= 11462) : (index += 1) {
        instance.array[index] = true;
    }
    index = 11820;
    while (index <= 11821) : (index += 1) {
        instance.array[index] = true;
    }
    index = 11868;
    while (index <= 11893) : (index += 1) {
        instance.array[index] = true;
    }
    index = 11895;
    while (index <= 11983) : (index += 1) {
        instance.array[index] = true;
    }
    index = 11996;
    while (index <= 12209) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12236;
    while (index <= 12247) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12270;
    while (index <= 12271) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12306;
    while (index <= 12307) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12314;
    while (index <= 12315) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12407;
    while (index <= 12408) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12652;
    while (index <= 12653) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12658;
    while (index <= 12667) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12700;
    while (index <= 12735) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12764;
    while (index <= 12794) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12806;
    while (index <= 12835) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12860;
    while (index <= 12891) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12902;
    while (index <= 12940) : (index += 1) {
        instance.array[index] = true;
    }
    index = 12956;
    while (index <= 13275) : (index += 1) {
        instance.array[index] = true;
    }
    index = 19868;
    while (index <= 19931) : (index += 1) {
        instance.array[index] = true;
    }
    index = 42092;
    while (index <= 42146) : (index += 1) {
        instance.array[index] = true;
    }
    index = 42716;
    while (index <= 42738) : (index += 1) {
        instance.array[index] = true;
    }
    index = 42748;
    while (index <= 42749) : (index += 1) {
        instance.array[index] = true;
    }
    index = 42853;
    while (index <= 42854) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43012;
    while (index <= 43015) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43026;
    while (index <= 43029) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43603;
    while (index <= 43605) : (index += 1) {
        instance.array[index] = true;
    }
    index = 43846;
    while (index <= 43847) : (index += 1) {
        instance.array[index] = true;
    }
    index = 64398;
    while (index <= 64413) : (index += 1) {
        instance.array[index] = true;
    }
    index = 64984;
    while (index <= 64985) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65088;
    while (index <= 65090) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65272;
    while (index <= 65274) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65468;
    while (index <= 65474) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65476;
    while (index <= 65482) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65496;
    while (index <= 65497) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65811;
    while (index <= 65819) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65877;
    while (index <= 65893) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65896;
    while (index <= 65898) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65900;
    while (index <= 65912) : (index += 1) {
        instance.array[index] = true;
    }
    index = 65964;
    while (index <= 66008) : (index += 1) {
        instance.array[index] = true;
    }
    index = 67667;
    while (index <= 67668) : (index += 1) {
        instance.array[index] = true;
    }
    index = 73649;
    while (index <= 73677) : (index += 1) {
        instance.array[index] = true;
    }
    index = 92952;
    while (index <= 92955) : (index += 1) {
        instance.array[index] = true;
    }
    index = 118748;
    while (index <= 118993) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119004;
    while (index <= 119042) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119045;
    while (index <= 119104) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119110;
    while (index <= 119112) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119135;
    while (index <= 119136) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119144;
    while (index <= 119173) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119178;
    while (index <= 119236) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119260;
    while (index <= 119325) : (index += 1) {
        instance.array[index] = true;
    }
    index = 119516;
    while (index <= 119602) : (index += 1) {
        instance.array[index] = true;
    }
    index = 120796;
    while (index <= 121307) : (index += 1) {
        instance.array[index] = true;
    }
    index = 121363;
    while (index <= 121366) : (index += 1) {
        instance.array[index] = true;
    }
    index = 121417;
    while (index <= 121424) : (index += 1) {
        instance.array[index] = true;
    }
    index = 121426;
    while (index <= 121439) : (index += 1) {
        instance.array[index] = true;
    }
    index = 121441;
    while (index <= 121442) : (index += 1) {
        instance.array[index] = true;
    }
    index = 126668;
    while (index <= 126669) : (index += 1) {
        instance.array[index] = true;
    }
    index = 126940;
    while (index <= 126983) : (index += 1) {
        instance.array[index] = true;
    }
    index = 126988;
    while (index <= 127087) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127100;
    while (index <= 127114) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127117;
    while (index <= 127131) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127133;
    while (index <= 127147) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127149;
    while (index <= 127185) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127209;
    while (index <= 127369) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127426;
    while (index <= 127454) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127468;
    while (index <= 127511) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127516;
    while (index <= 127524) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127532;
    while (index <= 127533) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127548;
    while (index <= 127553) : (index += 1) {
        instance.array[index] = true;
    }
    index = 127708;
    while (index <= 128691) : (index += 1) {
        instance.array[index] = true;
    }
    index = 128700;
    while (index <= 128712) : (index += 1) {
        instance.array[index] = true;
    }
    index = 128716;
    while (index <= 128728) : (index += 1) {
        instance.array[index] = true;
    }
    index = 128732;
    while (index <= 128847) : (index += 1) {
        instance.array[index] = true;
    }
    index = 128860;
    while (index <= 128948) : (index += 1) {
        instance.array[index] = true;
    }
    index = 128956;
    while (index <= 128967) : (index += 1) {
        instance.array[index] = true;
    }
    index = 128988;
    while (index <= 128999) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129004;
    while (index <= 129059) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129068;
    while (index <= 129077) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129084;
    while (index <= 129123) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129132;
    while (index <= 129161) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129164;
    while (index <= 129165) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129244;
    while (index <= 129364) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129366;
    while (index <= 129447) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129449;
    while (index <= 129583) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129596;
    while (index <= 129609) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129612;
    while (index <= 129616) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129620;
    while (index <= 129622) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129628;
    while (index <= 129634) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129644;
    while (index <= 129668) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129676;
    while (index <= 129682) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129692;
    while (index <= 129694) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129708;
    while (index <= 129714) : (index += 1) {
        instance.array[index] = true;
    }
    index = 129756;
    while (index <= 129902) : (index += 1) {
        instance.array[index] = true;
    }

    // Placeholder: 0. Struct name.
    return instance;
}

pub fn deinit(self: *Symbol) void {
    self.allocator.free(self.array);
}

pub fn isSymbol(self: Symbol, cp: u21) bool {
    if (cp < self.lo or cp > self.hi) return false;
    const index = cp - self.lo;
    return if (index >= self.array.len) false else self.array[index];
}