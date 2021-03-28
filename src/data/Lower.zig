// Autogenerated from http://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt by running ucd_gen.
// Placeholders:
//    1. Struct name
//    2. Array length
//    3. Ranges length
//! Unicode Lower category code points data.

const std = @import("std");
const Range = @import("../Range.zig");

const Lower = @This();

array: [125219]bool = [_]bool{false} ** 125219,
ranges: [103]Range = undefined, // Should this be optional?

pub fn new() Lower {
    var instance: Lower = Lower{};

    instance.array[181] = true;
    instance.array[257] = true;
    instance.array[259] = true;
    instance.array[261] = true;
    instance.array[263] = true;
    instance.array[265] = true;
    instance.array[267] = true;
    instance.array[269] = true;
    instance.array[271] = true;
    instance.array[273] = true;
    instance.array[275] = true;
    instance.array[277] = true;
    instance.array[279] = true;
    instance.array[281] = true;
    instance.array[283] = true;
    instance.array[285] = true;
    instance.array[287] = true;
    instance.array[289] = true;
    instance.array[291] = true;
    instance.array[293] = true;
    instance.array[295] = true;
    instance.array[297] = true;
    instance.array[299] = true;
    instance.array[301] = true;
    instance.array[303] = true;
    instance.array[305] = true;
    instance.array[307] = true;
    instance.array[309] = true;
    instance.array[314] = true;
    instance.array[316] = true;
    instance.array[318] = true;
    instance.array[320] = true;
    instance.array[322] = true;
    instance.array[324] = true;
    instance.array[326] = true;
    instance.array[331] = true;
    instance.array[333] = true;
    instance.array[335] = true;
    instance.array[337] = true;
    instance.array[339] = true;
    instance.array[341] = true;
    instance.array[343] = true;
    instance.array[345] = true;
    instance.array[347] = true;
    instance.array[349] = true;
    instance.array[351] = true;
    instance.array[353] = true;
    instance.array[355] = true;
    instance.array[357] = true;
    instance.array[359] = true;
    instance.array[361] = true;
    instance.array[363] = true;
    instance.array[365] = true;
    instance.array[367] = true;
    instance.array[369] = true;
    instance.array[371] = true;
    instance.array[373] = true;
    instance.array[375] = true;
    instance.array[378] = true;
    instance.array[380] = true;
    instance.array[387] = true;
    instance.array[389] = true;
    instance.array[392] = true;
    instance.array[402] = true;
    instance.array[405] = true;
    instance.array[414] = true;
    instance.array[417] = true;
    instance.array[419] = true;
    instance.array[421] = true;
    instance.array[424] = true;
    instance.array[429] = true;
    instance.array[432] = true;
    instance.array[436] = true;
    instance.array[438] = true;
    instance.array[454] = true;
    instance.array[457] = true;
    instance.array[460] = true;
    instance.array[462] = true;
    instance.array[464] = true;
    instance.array[466] = true;
    instance.array[468] = true;
    instance.array[470] = true;
    instance.array[472] = true;
    instance.array[474] = true;
    instance.array[479] = true;
    instance.array[481] = true;
    instance.array[483] = true;
    instance.array[485] = true;
    instance.array[487] = true;
    instance.array[489] = true;
    instance.array[491] = true;
    instance.array[493] = true;
    instance.array[499] = true;
    instance.array[501] = true;
    instance.array[505] = true;
    instance.array[507] = true;
    instance.array[509] = true;
    instance.array[511] = true;
    instance.array[513] = true;
    instance.array[515] = true;
    instance.array[517] = true;
    instance.array[519] = true;
    instance.array[521] = true;
    instance.array[523] = true;
    instance.array[525] = true;
    instance.array[527] = true;
    instance.array[529] = true;
    instance.array[531] = true;
    instance.array[533] = true;
    instance.array[535] = true;
    instance.array[537] = true;
    instance.array[539] = true;
    instance.array[541] = true;
    instance.array[543] = true;
    instance.array[545] = true;
    instance.array[547] = true;
    instance.array[549] = true;
    instance.array[551] = true;
    instance.array[553] = true;
    instance.array[555] = true;
    instance.array[557] = true;
    instance.array[559] = true;
    instance.array[561] = true;
    instance.array[572] = true;
    instance.array[578] = true;
    instance.array[583] = true;
    instance.array[585] = true;
    instance.array[587] = true;
    instance.array[589] = true;
    instance.array[881] = true;
    instance.array[883] = true;
    instance.array[887] = true;
    instance.array[912] = true;
    instance.array[985] = true;
    instance.array[987] = true;
    instance.array[989] = true;
    instance.array[991] = true;
    instance.array[993] = true;
    instance.array[995] = true;
    instance.array[997] = true;
    instance.array[999] = true;
    instance.array[1001] = true;
    instance.array[1003] = true;
    instance.array[1005] = true;
    instance.array[1013] = true;
    instance.array[1016] = true;
    instance.array[1121] = true;
    instance.array[1123] = true;
    instance.array[1125] = true;
    instance.array[1127] = true;
    instance.array[1129] = true;
    instance.array[1131] = true;
    instance.array[1133] = true;
    instance.array[1135] = true;
    instance.array[1137] = true;
    instance.array[1139] = true;
    instance.array[1141] = true;
    instance.array[1143] = true;
    instance.array[1145] = true;
    instance.array[1147] = true;
    instance.array[1149] = true;
    instance.array[1151] = true;
    instance.array[1153] = true;
    instance.array[1163] = true;
    instance.array[1165] = true;
    instance.array[1167] = true;
    instance.array[1169] = true;
    instance.array[1171] = true;
    instance.array[1173] = true;
    instance.array[1175] = true;
    instance.array[1177] = true;
    instance.array[1179] = true;
    instance.array[1181] = true;
    instance.array[1183] = true;
    instance.array[1185] = true;
    instance.array[1187] = true;
    instance.array[1189] = true;
    instance.array[1191] = true;
    instance.array[1193] = true;
    instance.array[1195] = true;
    instance.array[1197] = true;
    instance.array[1199] = true;
    instance.array[1201] = true;
    instance.array[1203] = true;
    instance.array[1205] = true;
    instance.array[1207] = true;
    instance.array[1209] = true;
    instance.array[1211] = true;
    instance.array[1213] = true;
    instance.array[1215] = true;
    instance.array[1218] = true;
    instance.array[1220] = true;
    instance.array[1222] = true;
    instance.array[1224] = true;
    instance.array[1226] = true;
    instance.array[1228] = true;
    instance.array[1233] = true;
    instance.array[1235] = true;
    instance.array[1237] = true;
    instance.array[1239] = true;
    instance.array[1241] = true;
    instance.array[1243] = true;
    instance.array[1245] = true;
    instance.array[1247] = true;
    instance.array[1249] = true;
    instance.array[1251] = true;
    instance.array[1253] = true;
    instance.array[1255] = true;
    instance.array[1257] = true;
    instance.array[1259] = true;
    instance.array[1261] = true;
    instance.array[1263] = true;
    instance.array[1265] = true;
    instance.array[1267] = true;
    instance.array[1269] = true;
    instance.array[1271] = true;
    instance.array[1273] = true;
    instance.array[1275] = true;
    instance.array[1277] = true;
    instance.array[1279] = true;
    instance.array[1281] = true;
    instance.array[1283] = true;
    instance.array[1285] = true;
    instance.array[1287] = true;
    instance.array[1289] = true;
    instance.array[1291] = true;
    instance.array[1293] = true;
    instance.array[1295] = true;
    instance.array[1297] = true;
    instance.array[1299] = true;
    instance.array[1301] = true;
    instance.array[1303] = true;
    instance.array[1305] = true;
    instance.array[1307] = true;
    instance.array[1309] = true;
    instance.array[1311] = true;
    instance.array[1313] = true;
    instance.array[1315] = true;
    instance.array[1317] = true;
    instance.array[1319] = true;
    instance.array[1321] = true;
    instance.array[1323] = true;
    instance.array[1325] = true;
    instance.array[1327] = true;
    instance.array[7681] = true;
    instance.array[7683] = true;
    instance.array[7685] = true;
    instance.array[7687] = true;
    instance.array[7689] = true;
    instance.array[7691] = true;
    instance.array[7693] = true;
    instance.array[7695] = true;
    instance.array[7697] = true;
    instance.array[7699] = true;
    instance.array[7701] = true;
    instance.array[7703] = true;
    instance.array[7705] = true;
    instance.array[7707] = true;
    instance.array[7709] = true;
    instance.array[7711] = true;
    instance.array[7713] = true;
    instance.array[7715] = true;
    instance.array[7717] = true;
    instance.array[7719] = true;
    instance.array[7721] = true;
    instance.array[7723] = true;
    instance.array[7725] = true;
    instance.array[7727] = true;
    instance.array[7729] = true;
    instance.array[7731] = true;
    instance.array[7733] = true;
    instance.array[7735] = true;
    instance.array[7737] = true;
    instance.array[7739] = true;
    instance.array[7741] = true;
    instance.array[7743] = true;
    instance.array[7745] = true;
    instance.array[7747] = true;
    instance.array[7749] = true;
    instance.array[7751] = true;
    instance.array[7753] = true;
    instance.array[7755] = true;
    instance.array[7757] = true;
    instance.array[7759] = true;
    instance.array[7761] = true;
    instance.array[7763] = true;
    instance.array[7765] = true;
    instance.array[7767] = true;
    instance.array[7769] = true;
    instance.array[7771] = true;
    instance.array[7773] = true;
    instance.array[7775] = true;
    instance.array[7777] = true;
    instance.array[7779] = true;
    instance.array[7781] = true;
    instance.array[7783] = true;
    instance.array[7785] = true;
    instance.array[7787] = true;
    instance.array[7789] = true;
    instance.array[7791] = true;
    instance.array[7793] = true;
    instance.array[7795] = true;
    instance.array[7797] = true;
    instance.array[7799] = true;
    instance.array[7801] = true;
    instance.array[7803] = true;
    instance.array[7805] = true;
    instance.array[7807] = true;
    instance.array[7809] = true;
    instance.array[7811] = true;
    instance.array[7813] = true;
    instance.array[7815] = true;
    instance.array[7817] = true;
    instance.array[7819] = true;
    instance.array[7821] = true;
    instance.array[7823] = true;
    instance.array[7825] = true;
    instance.array[7827] = true;
    instance.array[7839] = true;
    instance.array[7841] = true;
    instance.array[7843] = true;
    instance.array[7845] = true;
    instance.array[7847] = true;
    instance.array[7849] = true;
    instance.array[7851] = true;
    instance.array[7853] = true;
    instance.array[7855] = true;
    instance.array[7857] = true;
    instance.array[7859] = true;
    instance.array[7861] = true;
    instance.array[7863] = true;
    instance.array[7865] = true;
    instance.array[7867] = true;
    instance.array[7869] = true;
    instance.array[7871] = true;
    instance.array[7873] = true;
    instance.array[7875] = true;
    instance.array[7877] = true;
    instance.array[7879] = true;
    instance.array[7881] = true;
    instance.array[7883] = true;
    instance.array[7885] = true;
    instance.array[7887] = true;
    instance.array[7889] = true;
    instance.array[7891] = true;
    instance.array[7893] = true;
    instance.array[7895] = true;
    instance.array[7897] = true;
    instance.array[7899] = true;
    instance.array[7901] = true;
    instance.array[7903] = true;
    instance.array[7905] = true;
    instance.array[7907] = true;
    instance.array[7909] = true;
    instance.array[7911] = true;
    instance.array[7913] = true;
    instance.array[7915] = true;
    instance.array[7917] = true;
    instance.array[7919] = true;
    instance.array[7921] = true;
    instance.array[7923] = true;
    instance.array[7925] = true;
    instance.array[7927] = true;
    instance.array[7929] = true;
    instance.array[7931] = true;
    instance.array[7933] = true;
    instance.array[8126] = true;
    instance.array[8458] = true;
    instance.array[8467] = true;
    instance.array[8495] = true;
    instance.array[8500] = true;
    instance.array[8505] = true;
    instance.array[8526] = true;
    instance.array[8580] = true;
    instance.array[11361] = true;
    instance.array[11368] = true;
    instance.array[11370] = true;
    instance.array[11372] = true;
    instance.array[11377] = true;
    instance.array[11393] = true;
    instance.array[11395] = true;
    instance.array[11397] = true;
    instance.array[11399] = true;
    instance.array[11401] = true;
    instance.array[11403] = true;
    instance.array[11405] = true;
    instance.array[11407] = true;
    instance.array[11409] = true;
    instance.array[11411] = true;
    instance.array[11413] = true;
    instance.array[11415] = true;
    instance.array[11417] = true;
    instance.array[11419] = true;
    instance.array[11421] = true;
    instance.array[11423] = true;
    instance.array[11425] = true;
    instance.array[11427] = true;
    instance.array[11429] = true;
    instance.array[11431] = true;
    instance.array[11433] = true;
    instance.array[11435] = true;
    instance.array[11437] = true;
    instance.array[11439] = true;
    instance.array[11441] = true;
    instance.array[11443] = true;
    instance.array[11445] = true;
    instance.array[11447] = true;
    instance.array[11449] = true;
    instance.array[11451] = true;
    instance.array[11453] = true;
    instance.array[11455] = true;
    instance.array[11457] = true;
    instance.array[11459] = true;
    instance.array[11461] = true;
    instance.array[11463] = true;
    instance.array[11465] = true;
    instance.array[11467] = true;
    instance.array[11469] = true;
    instance.array[11471] = true;
    instance.array[11473] = true;
    instance.array[11475] = true;
    instance.array[11477] = true;
    instance.array[11479] = true;
    instance.array[11481] = true;
    instance.array[11483] = true;
    instance.array[11485] = true;
    instance.array[11487] = true;
    instance.array[11489] = true;
    instance.array[11500] = true;
    instance.array[11502] = true;
    instance.array[11507] = true;
    instance.array[11559] = true;
    instance.array[11565] = true;
    instance.array[42561] = true;
    instance.array[42563] = true;
    instance.array[42565] = true;
    instance.array[42567] = true;
    instance.array[42569] = true;
    instance.array[42571] = true;
    instance.array[42573] = true;
    instance.array[42575] = true;
    instance.array[42577] = true;
    instance.array[42579] = true;
    instance.array[42581] = true;
    instance.array[42583] = true;
    instance.array[42585] = true;
    instance.array[42587] = true;
    instance.array[42589] = true;
    instance.array[42591] = true;
    instance.array[42593] = true;
    instance.array[42595] = true;
    instance.array[42597] = true;
    instance.array[42599] = true;
    instance.array[42601] = true;
    instance.array[42603] = true;
    instance.array[42605] = true;
    instance.array[42625] = true;
    instance.array[42627] = true;
    instance.array[42629] = true;
    instance.array[42631] = true;
    instance.array[42633] = true;
    instance.array[42635] = true;
    instance.array[42637] = true;
    instance.array[42639] = true;
    instance.array[42641] = true;
    instance.array[42643] = true;
    instance.array[42645] = true;
    instance.array[42647] = true;
    instance.array[42649] = true;
    instance.array[42651] = true;
    instance.array[42787] = true;
    instance.array[42789] = true;
    instance.array[42791] = true;
    instance.array[42793] = true;
    instance.array[42795] = true;
    instance.array[42797] = true;
    instance.array[42803] = true;
    instance.array[42805] = true;
    instance.array[42807] = true;
    instance.array[42809] = true;
    instance.array[42811] = true;
    instance.array[42813] = true;
    instance.array[42815] = true;
    instance.array[42817] = true;
    instance.array[42819] = true;
    instance.array[42821] = true;
    instance.array[42823] = true;
    instance.array[42825] = true;
    instance.array[42827] = true;
    instance.array[42829] = true;
    instance.array[42831] = true;
    instance.array[42833] = true;
    instance.array[42835] = true;
    instance.array[42837] = true;
    instance.array[42839] = true;
    instance.array[42841] = true;
    instance.array[42843] = true;
    instance.array[42845] = true;
    instance.array[42847] = true;
    instance.array[42849] = true;
    instance.array[42851] = true;
    instance.array[42853] = true;
    instance.array[42855] = true;
    instance.array[42857] = true;
    instance.array[42859] = true;
    instance.array[42861] = true;
    instance.array[42863] = true;
    instance.array[42874] = true;
    instance.array[42876] = true;
    instance.array[42879] = true;
    instance.array[42881] = true;
    instance.array[42883] = true;
    instance.array[42885] = true;
    instance.array[42887] = true;
    instance.array[42892] = true;
    instance.array[42894] = true;
    instance.array[42897] = true;
    instance.array[42903] = true;
    instance.array[42905] = true;
    instance.array[42907] = true;
    instance.array[42909] = true;
    instance.array[42911] = true;
    instance.array[42913] = true;
    instance.array[42915] = true;
    instance.array[42917] = true;
    instance.array[42919] = true;
    instance.array[42921] = true;
    instance.array[42927] = true;
    instance.array[42933] = true;
    instance.array[42935] = true;
    instance.array[42937] = true;
    instance.array[42939] = true;
    instance.array[42941] = true;
    instance.array[42943] = true;
    instance.array[42947] = true;
    instance.array[42952] = true;
    instance.array[42954] = true;
    instance.array[42998] = true;
    instance.array[43002] = true;
    instance.array[119995] = true;
    instance.array[120779] = true;
    instance.array[125218] = true;
    instance.ranges[0] = Range.new(0x61, 0x7A);
    instance.ranges[1] = Range.new(0xDF, 0xF6);
    instance.ranges[2] = Range.new(0xF8, 0xFF);
    instance.ranges[3] = Range.new(0x137, 0x138);
    instance.ranges[4] = Range.new(0x148, 0x149);
    instance.ranges[5] = Range.new(0x17E, 0x180);
    instance.ranges[6] = Range.new(0x18C, 0x18D);
    instance.ranges[7] = Range.new(0x199, 0x19B);
    instance.ranges[8] = Range.new(0x1AA, 0x1AB);
    instance.ranges[9] = Range.new(0x1B9, 0x1BA);
    instance.ranges[10] = Range.new(0x1BD, 0x1BF);
    instance.ranges[11] = Range.new(0x1DC, 0x1DD);
    instance.ranges[12] = Range.new(0x1EF, 0x1F0);
    instance.ranges[13] = Range.new(0x233, 0x239);
    instance.ranges[14] = Range.new(0x23F, 0x240);
    instance.ranges[15] = Range.new(0x24F, 0x293);
    instance.ranges[16] = Range.new(0x295, 0x2AF);
    instance.ranges[17] = Range.new(0x37B, 0x37D);
    instance.ranges[18] = Range.new(0x3AC, 0x3CE);
    instance.ranges[19] = Range.new(0x3D0, 0x3D1);
    instance.ranges[20] = Range.new(0x3D5, 0x3D7);
    instance.ranges[21] = Range.new(0x3EF, 0x3F3);
    instance.ranges[22] = Range.new(0x3FB, 0x3FC);
    instance.ranges[23] = Range.new(0x430, 0x45F);
    instance.ranges[24] = Range.new(0x4CE, 0x4CF);
    instance.ranges[25] = Range.new(0x560, 0x588);
    instance.ranges[26] = Range.new(0x10D0, 0x10FA);
    instance.ranges[27] = Range.new(0x10FD, 0x10FF);
    instance.ranges[28] = Range.new(0x13F8, 0x13FD);
    instance.ranges[29] = Range.new(0x1C80, 0x1C88);
    instance.ranges[30] = Range.new(0x1D00, 0x1D2B);
    instance.ranges[31] = Range.new(0x1D6B, 0x1D77);
    instance.ranges[32] = Range.new(0x1D79, 0x1D9A);
    instance.ranges[33] = Range.new(0x1E95, 0x1E9D);
    instance.ranges[34] = Range.new(0x1EFF, 0x1F07);
    instance.ranges[35] = Range.new(0x1F10, 0x1F15);
    instance.ranges[36] = Range.new(0x1F20, 0x1F27);
    instance.ranges[37] = Range.new(0x1F30, 0x1F37);
    instance.ranges[38] = Range.new(0x1F40, 0x1F45);
    instance.ranges[39] = Range.new(0x1F50, 0x1F57);
    instance.ranges[40] = Range.new(0x1F60, 0x1F67);
    instance.ranges[41] = Range.new(0x1F70, 0x1F7D);
    instance.ranges[42] = Range.new(0x1F80, 0x1F87);
    instance.ranges[43] = Range.new(0x1F90, 0x1F97);
    instance.ranges[44] = Range.new(0x1FA0, 0x1FA7);
    instance.ranges[45] = Range.new(0x1FB0, 0x1FB4);
    instance.ranges[46] = Range.new(0x1FB6, 0x1FB7);
    instance.ranges[47] = Range.new(0x1FC2, 0x1FC4);
    instance.ranges[48] = Range.new(0x1FC6, 0x1FC7);
    instance.ranges[49] = Range.new(0x1FD0, 0x1FD3);
    instance.ranges[50] = Range.new(0x1FD6, 0x1FD7);
    instance.ranges[51] = Range.new(0x1FE0, 0x1FE7);
    instance.ranges[52] = Range.new(0x1FF2, 0x1FF4);
    instance.ranges[53] = Range.new(0x1FF6, 0x1FF7);
    instance.ranges[54] = Range.new(0x210E, 0x210F);
    instance.ranges[55] = Range.new(0x213C, 0x213D);
    instance.ranges[56] = Range.new(0x2146, 0x2149);
    instance.ranges[57] = Range.new(0x2C30, 0x2C5E);
    instance.ranges[58] = Range.new(0x2C65, 0x2C66);
    instance.ranges[59] = Range.new(0x2C73, 0x2C74);
    instance.ranges[60] = Range.new(0x2C76, 0x2C7B);
    instance.ranges[61] = Range.new(0x2CE3, 0x2CE4);
    instance.ranges[62] = Range.new(0x2D00, 0x2D25);
    instance.ranges[63] = Range.new(0xA72F, 0xA731);
    instance.ranges[64] = Range.new(0xA771, 0xA778);
    instance.ranges[65] = Range.new(0xA793, 0xA795);
    instance.ranges[66] = Range.new(0xAB30, 0xAB5A);
    instance.ranges[67] = Range.new(0xAB60, 0xAB68);
    instance.ranges[68] = Range.new(0xAB70, 0xABBF);
    instance.ranges[69] = Range.new(0xFB00, 0xFB06);
    instance.ranges[70] = Range.new(0xFB13, 0xFB17);
    instance.ranges[71] = Range.new(0xFF41, 0xFF5A);
    instance.ranges[72] = Range.new(0x10428, 0x1044F);
    instance.ranges[73] = Range.new(0x104D8, 0x104FB);
    instance.ranges[74] = Range.new(0x10CC0, 0x10CF2);
    instance.ranges[75] = Range.new(0x118C0, 0x118DF);
    instance.ranges[76] = Range.new(0x16E60, 0x16E7F);
    instance.ranges[77] = Range.new(0x1D41A, 0x1D433);
    instance.ranges[78] = Range.new(0x1D44E, 0x1D454);
    instance.ranges[79] = Range.new(0x1D456, 0x1D467);
    instance.ranges[80] = Range.new(0x1D482, 0x1D49B);
    instance.ranges[81] = Range.new(0x1D4B6, 0x1D4B9);
    instance.ranges[82] = Range.new(0x1D4BD, 0x1D4C3);
    instance.ranges[83] = Range.new(0x1D4C5, 0x1D4CF);
    instance.ranges[84] = Range.new(0x1D4EA, 0x1D503);
    instance.ranges[85] = Range.new(0x1D51E, 0x1D537);
    instance.ranges[86] = Range.new(0x1D552, 0x1D56B);
    instance.ranges[87] = Range.new(0x1D586, 0x1D59F);
    instance.ranges[88] = Range.new(0x1D5BA, 0x1D5D3);
    instance.ranges[89] = Range.new(0x1D5EE, 0x1D607);
    instance.ranges[90] = Range.new(0x1D622, 0x1D63B);
    instance.ranges[91] = Range.new(0x1D656, 0x1D66F);
    instance.ranges[92] = Range.new(0x1D68A, 0x1D6A5);
    instance.ranges[93] = Range.new(0x1D6C2, 0x1D6DA);
    instance.ranges[94] = Range.new(0x1D6DC, 0x1D6E1);
    instance.ranges[95] = Range.new(0x1D6FC, 0x1D714);
    instance.ranges[96] = Range.new(0x1D716, 0x1D71B);
    instance.ranges[97] = Range.new(0x1D736, 0x1D74E);
    instance.ranges[98] = Range.new(0x1D750, 0x1D755);
    instance.ranges[99] = Range.new(0x1D770, 0x1D788);
    instance.ranges[100] = Range.new(0x1D78A, 0x1D78F);
    instance.ranges[101] = Range.new(0x1D7AA, 0x1D7C2);
    instance.ranges[102] = Range.new(0x1D7C4, 0x1D7C9);

    // Placeholder: Struct name.
    return instance;
}

pub fn isLower(self: Lower, cp: u21) bool {
    if (cp < self.array.len and self.array[cp]) return true;

    //for (self.ranges) |range| {
    //    if (cp >= range.start and cp <= range.end) return true;
    //}

    return false;
}
