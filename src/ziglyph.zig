//! Ziglyph provides Unicode processing in Zig.
//! To minimize memory requirements and binary size, this library is divided into component structs
//! that provide specific pieces of functionality. For a consolidated struct with the most frequently
//! used functionality, see the Ziglyph struct below.

const std = @import("std");
const mem = std.mem;
const ascii = @import("ascii.zig");

/// Alphabeticbetic code points.
pub const Alphabetic = @import("components/autogen/DerivedCoreProperties/Alphabetic.zig");
/// Control code points like form feed.
pub const Control = @import("components/autogen/DerivedGeneralCategory/Control.zig");
/// Decimal number code points.
pub const Decimal = @import("components/autogen/DerivedGeneralCategory/DecimalNumber.zig");
/// Unicode digit code points, which do not include ASCII digits.
pub const Digit = @import("components/autogen/DerivedNumericType/Digit.zig");
/// Hexadecimal digits.
pub const HexDigit = @import("components/autogen/PropList/HexDigit.zig");
/// Unicode letters.
pub const Letter = @import("components/aggregate/Letter.zig");
// Marks.
const SpacingMark = @import("components/autogen/DerivedGeneralCategory/SpacingMark.zig");
const NonSpacingMark = @import("components/autogen/DerivedGeneralCategory/NonspacingMark.zig");
const EnclosingMark = @import("components/autogen/DerivedGeneralCategory/EnclosingMark.zig");
// Numbers.
const LetterNumber = @import("components/autogen/DerivedGeneralCategory/LetterNumber.zig");
const OtherNumber = @import("components/autogen/DerivedGeneralCategory/OtherNumber.zig");
// Punctuation.
const ClosePunct = @import("components/autogen/DerivedGeneralCategory/ClosePunctuation.zig");
const ConnectPunct = @import("components/autogen/DerivedGeneralCategory/ConnectorPunctuation.zig");
const DashPunct = @import("components/autogen/DerivedGeneralCategory/DashPunctuation.zig");
const FinalPunct = @import("components/autogen/UnicodeData/FinalPunctuation.zig");
const InitialPunct = @import("components/autogen/DerivedGeneralCategory/InitialPunctuation.zig");
const OpenPunct = @import("components/autogen/DerivedGeneralCategory/OpenPunctuation.zig");
const OtherPunct = @import("components/autogen/DerivedGeneralCategory/OtherPunctuation.zig");
// Symbols
/// Mathematical symbols.
pub const MathSymbol = @import("components/autogen/DerivedGeneralCategory/MathSymbol.zig");
const ModSymbol = @import("components/autogen/DerivedGeneralCategory/ModifierSymbol.zig");
/// Currency symbols.
pub const CurrencySymbol = @import("components/autogen/DerivedGeneralCategory/CurrencySymbol.zig");
const OtherSymbol = @import("components/autogen/DerivedGeneralCategory/OtherSymbol.zig");
/// WhiteSpace.
pub const WhiteSpace = @import("components/autogen/PropList/WhiteSpace.zig");
pub const Space = @import("components/autogen/DerivedGeneralCategory/SpaceSeparator.zig");

/// Case fold mappings.
pub const CaseFoldMap = @import("components/autogen/CaseFolding/CaseFoldMap.zig");
/// Code point decomposition.
pub const DecomposeMap = @import("components/autogen/UnicodeData/DecomposeMap.zig");

/// Ziglyph consolidates all the major Unicode utility functions in one place. Because these functions
/// each consume memory for their respective code point data, this struct performs lazy initialization
/// to only consume memory when needed.
pub const Ziglyph = struct {
    allocator: *mem.Allocator,
    alpha: ?Alphabetic = null,
    control: ?Control = null,
    decimal: ?Decimal = null,
    digit: ?Digit = null,
    hex: ?HexDigit = null,
    letter: ?Letter = null,
    spacing_mark: ?SpacingMark = null,
    nonspacing_mark: ?NonSpacingMark = null,
    enclosing_mark: ?EnclosingMark = null,
    letter_number: ?LetterNumber = null,
    other_number: ?OtherNumber = null,
    close_punct: ?ClosePunct = null,
    connect_punct: ?ConnectPunct = null,
    dash_punct: ?DashPunct = null,
    final_punct: ?FinalPunct = null,
    initial_punct: ?InitialPunct = null,
    open_punct: ?OpenPunct = null,
    other_punct: ?OtherPunct = null,
    math_symbol: ?MathSymbol = null,
    mod_symbol: ?ModSymbol = null,
    currency_symbol: ?CurrencySymbol = null,
    other_symbol: ?OtherSymbol = null,
    space: ?Space = null,
    whitespace: ?WhiteSpace = null,

    pub fn init(allocator: *mem.Allocator) !Ziglyph {
        return Ziglyph{ .allocator = allocator };
    }

    const Self = @This();

    pub fn deinit(self: *Self) void {
        if (self.alpha) |*alpha| alpha.deinit();
        if (self.control) |*control| control.deinit();
        if (self.decimal) |*decimal| decimal.deinit();
        if (self.digit) |*digit| digit.deinit();
        if (self.letter) |*letter| letter.deinit();
        if (self.hex) |*hex| hex.deinit();
        if (self.spacing_mark) |*spacing_mark| spacing_mark.deinit();
        if (self.nonspacing_mark) |*nonspacing_mark| nonspacing_mark.deinit();
        if (self.enclosing_mark) |*enclosing_mark| enclosing_mark.deinit();
        if (self.letter_number) |*letter_number| letter_number.deinit();
        if (self.other_number) |*other_number| other_number.deinit();
        if (self.close_punct) |*close_punct| close_punct.deinit();
        if (self.connect_punct) |*connect_punct| connect_punct.deinit();
        if (self.dash_punct) |*dash_punct| dash_punct.deinit();
        if (self.final_punct) |*final_punct| final_punct.deinit();
        if (self.initial_punct) |*initial_punct| initial_punct.deinit();
        if (self.open_punct) |*open_punct| open_punct.deinit();
        if (self.other_punct) |*other_punct| other_punct.deinit();
        if (self.space) |*space| space.deinit();
        if (self.whitespace) |*whitespace| whitespace.deinit();
        if (self.math_symbol) |*math_symbol| math_symbol.deinit();
        if (self.mod_symbol) |*mod_symbol| mod_symbol.deinit();
        if (self.currency_symbol) |*currency_symbol| currency_symbol.deinit();
        if (self.other_symbol) |*other_symbol| other_symbol.deinit();
    }

    /// isAlphabetic detects if a code point is alphabetic.
    pub fn isAlphabetic(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.alpha == null) self.alpha = try Alphabetic.init(self.allocator);
        return self.alpha.?.isAlphabetic(cp);
    }

    /// isAsciiAlphabetic detects ASCII only letters.
    pub fn isAsciiAlphabetic(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isAlpha(@intCast(u8, cp)) else false;
    }

    /// isAlphaNum covers all the Unicode alphabetic and number space, not just ASCII.
    pub fn isAlphaNum(self: *Self, cp: u21) !bool {
        return (try self.isAlphabetic(cp)) or (try self.isNumber(cp));
    }

    /// isAsciiAlphaNum detects ASCII only letters or numbers.
    pub fn isAsciiAlphaNum(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isAlNum(@intCast(u8, cp)) else false;
    }

    /// isBase detects Unicode base code points.
    pub fn isBase(self: *Self, cp: u21) !bool {
        return (try self.isLetter(cp)) or (try self.isNumber(cp)) or (try self.isPunct(cp)) or
            (try self.isSymbol(cp)) or (try self.isSpace(cp));
    }

    /// isCombining detects Unicode base characters.
    pub fn isCombining(self: *Self, cp: u21) !bool {
        return self.isMark(cp);
    }

    /// isCased detects cased letters.
    pub fn isCased(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.letter == null) self.letter = try Letter.init(self.allocator);
        return self.letter.?.isCased(cp);
    }

    // isDecimal detects all Unicode digits.
    pub fn isDecimal(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.decimal == null) self.decimal = try Decimal.init(self.allocator);
        return self.decimal.?.isDecimalNumber(cp);
    }

    // isDigit detects all Unicode digits, which don't include the ASCII digits..
    pub fn isDigit(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.digit == null) self.digit = try Digit.init(self.allocator);
        return self.digit.?.isDigit(cp) or (try self.isDecimal(cp));
    }

    /// isAsciiAlphabetic detects ASCII only letters.
    pub fn isAsciiDigit(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isDigit(@intCast(u8, cp)) else false;
    }

    /// isGraphic detects any code point that can be represented graphically, including spaces.
    pub fn isGraphic(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.space == null) self.space = try Space.init(self.allocator);
        return (try self.isPrint(cp)) or self.space.?.isSpaceSeparator(cp);
    }

    /// isAsciiGraphic detects ASCII only graphic code points.
    pub fn isAsciiGraphic(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isGraph(@intCast(u8, cp)) else false;
    }

    // isHex detects the 16 ASCII characters 0-9 A-F, and a-f.
    pub fn isHexDigit(self: *Self, cp: u21) !bool {
        if (self.hex == null) self.hex = try HexDigit.init(self.allocator);
        return self.hex.?.isHexDigit(cp);
    }

    /// isAsciiHexDigit detects ASCII only hexadecimal digits.
    pub fn isAsciiHexDigit(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isXDigit(@intCast(u8, cp)) else false;
    }

    /// isPrint detects any code point that can be printed, but not spaces.
    pub fn isPrint(self: *Self, cp: u21) !bool {
        return (try self.isAlphaNum(cp)) or (try self.isMark(cp)) or (try self.isPunct(cp)) or
            (try self.isSymbol(cp)) or (try self.isWhiteSpace(cp));
    }

    /// isAsciiPrint detects ASCII printable code points.
    pub fn isAsciiPrint(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isPrint(@intCast(u8, cp)) else false;
    }

    /// isControl detects control code points such as form feeds.
    pub fn isControl(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.control == null) self.control = try Control.init(self.allocator);
        return self.control.?.isControl(cp);
    }

    /// isAsciiControl detects ASCII only control code points.
    pub fn isAsciiControl(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isCntrl(@intCast(u8, cp)) else false;
    }

    /// isLetter covers all letters in Unicode, not just ASCII.
    pub fn isLetter(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.letter == null) self.letter = try Letter.init(self.allocator);
        return (try self.letter.?.isLetter(cp));
    }

    /// isAsciiLetter detects ASCII only letters.
    pub fn isAsciiLetter(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isAlpha(@intCast(u8, cp)) else false;
    }

    /// isLower detects code points that are lowercase.
    pub fn isLower(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.letter == null) self.letter = try Letter.init(self.allocator);
        return (try self.letter.?.isLower(cp));
    }

    /// isAsciiLower detects ASCII only lowercase letters.
    pub fn isAsciiLower(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isLower(@intCast(u8, cp)) else false;
    }

    /// isMark detects special code points that serve as marks in different alphabets.
    pub fn isMark(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.spacing_mark == null) self.spacing_mark = try SpacingMark.init(self.allocator);
        if (self.nonspacing_mark == null) self.nonspacing_mark = try NonSpacingMark.init(self.allocator);
        if (self.enclosing_mark == null) self.enclosing_mark = try EnclosingMark.init(self.allocator);

        return self.spacing_mark.?.isSpacingMark(cp) or self.nonspacing_mark.?.isNonspacingMark(cp) or
            self.enclosing_mark.?.isEnclosingMark(cp);
    }

    /// isNumber covers all Unicode numbers, not just ASII.
    pub fn isNumber(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.decimal == null) self.decimal = try Decimal.init(self.allocator);
        if (self.letter_number == null) self.letter_number = try LetterNumber.init(self.allocator);
        if (self.other_number == null) self.other_number = try OtherNumber.init(self.allocator);

        return self.decimal.?.isDecimalNumber(cp) or self.letter_number.?.isLetterNumber(cp) or
            self.other_number.?.isOtherNumber(cp);
    }

    /// isAsciiNumber detects ASCII only numbers.
    pub fn isAsciiNumber(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isDigit(@intCast(u8, cp)) else false;
    }

    /// isPunct detects punctuation characters. Note some punctuation maybe considered symbols by Unicode.
    pub fn isPunct(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.close_punct == null) self.close_punct = try ClosePunct.init(self.allocator);
        if (self.connect_punct == null) self.connect_punct = try ConnectPunct.init(self.allocator);
        if (self.dash_punct == null) self.dash_punct = try DashPunct.init(self.allocator);
        if (self.final_punct == null) self.final_punct = try FinalPunct.init(self.allocator);
        if (self.initial_punct == null) self.initial_punct = try InitialPunct.init(self.allocator);
        if (self.open_punct == null) self.open_punct = try OpenPunct.init(self.allocator);
        if (self.other_punct == null) self.other_punct = try OtherPunct.init(self.allocator);

        return self.close_punct.?.isClosePunctuation(cp) or self.connect_punct.?.isConnectorPunctuation(cp) or
            self.dash_punct.?.isDashPunctuation(cp) or self.final_punct.?.isFinalPunctuation(cp) or
            self.initial_punct.?.isInitialPunctuation(cp) or self.open_punct.?.isOpenPunctuation(cp) or
            self.other_punct.?.isOtherPunctuation(cp);
    }

    /// isAsciiPunct detects ASCII only punctuation.
    pub fn isAsciiPunct(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isPunct(@intCast(u8, cp)) else false;
    }

    /// isSpace detects code points that are Unicode space separators.
    pub fn isSpace(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.space == null) self.space = try Space.init(self.allocator);
        return self.space.?.isSpaceSeparator(cp);
    }

    /// isWhiteSpace checks for spaces.
    pub fn isWhiteSpace(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.whitespace == null) self.whitespace = try WhiteSpace.init(self.allocator);
        return self.whitespace.?.isWhiteSpace(cp);
    }

    /// isAsciiWhiteSpace detects ASCII only whitespace.
    pub fn isAsciiWhiteSpace(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isSpace(@intCast(u8, cp)) else false;
    }

    // isSymbol detects symbols which curiosly may include some code points commonly thought of as
    // punctuation.
    pub fn isSymbol(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.math_symbol == null) self.math_symbol = try MathSymbol.init(self.allocator);
        if (self.mod_symbol == null) self.mod_symbol = try ModSymbol.init(self.allocator);
        if (self.currency_symbol == null) self.currency_symbol = try CurrencySymbol.init(self.allocator);
        if (self.other_symbol == null) self.other_symbol = try OtherSymbol.init(self.allocator);

        return self.math_symbol.?.isMathSymbol(cp) or self.mod_symbol.?.isModifierSymbol(cp) or
            self.currency_symbol.?.isCurrencySymbol(cp) or self.other_symbol.?.isOtherSymbol(cp);
    }

    /// isAsciiSymbol detects ASCII only symbols.
    pub fn isAsciiSymbol(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isSymbol(@intCast(u8, cp)) else false;
    }

    /// isTitle detects code points in titlecase.
    pub fn isTitle(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.letter == null) self.letter = try Letter.init(self.allocator);
        return (try self.letter.?.isTitle(cp));
    }

    /// isUpper detects code points in uppercase.
    pub fn isUpper(self: *Self, cp: u21) !bool {
        // Lazy init.
        if (self.letter == null) self.letter = try Letter.init(self.allocator);
        return (try self.letter.?.isUpper(cp));
    }

    /// isAsciiUpper detects ASCII only uppercase letters.
    pub fn isAsciiUpper(self: Self, cp: u21) bool {
        return if (cp < 128) ascii.isUpper(@intCast(u8, cp)) else false;
    }

    /// toLower returns the lowercase code point for the given code point. It returns the same 
    /// code point given if no mapping exists.
    pub fn toLower(self: *Self, cp: u21) !u21 {
        // Lazy init.
        if (self.letter == null) self.letter = try Letter.init(self.allocator);
        return (try self.letter.?.toLower(cp));
    }

    /// toAsciiLower converts an ASCII letter to lowercase.
    pub fn toAsciiLower(self: Self, cp: u21) u21 {
        return if (cp < 128) ascii.toLower(@intCast(u8, cp)) else cp;
    }

    /// toTitle returns the titlecase code point for the given code point. It returns the same 
    /// code point given if no mapping exists.
    pub fn toTitle(self: *Self, cp: u21) !u21 {
        // Lazy init.
        if (self.letter == null) self.letter = try Letter.init(self.allocator);
        return (try self.letter.?.toTitle(cp));
    }

    /// toUpper returns the uppercase code point for the given code point. It returns the same 
    /// code point given if no mapping exists.
    pub fn toUpper(self: *Self, cp: u21) !u21 {
        // Lazy init.
        if (self.letter == null) self.letter = try Letter.init(self.allocator);
        return (try self.letter.?.toUpper(cp));
    }

    /// toAsciiUpper converts an ASCII letter to uppercase.
    pub fn toAsciiUpper(self: Self, cp: u21) u21 {
        return if (cp < 128) ascii.toUpper(@intCast(u8, cp)) else false;
    }
};
