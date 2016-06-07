//
//  NSStringTests.swift
//  DKHelper
//
//  Created by kevin delord on 03/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class NSStringTests: XCTestCase {

}

// MARK: - Random Numeric String

extension NSStringTests {

	func test_ShouldCreateNumericRandomString() {
		let str = NSString.randomNumericString(10)
		XCTAssertNotNil(str)
		XCTAssert(str.length == 10)
		XCTAssert(str.isNumeric == true)
	}

	func test_ShouldCreateNumericRandomStringWithValidLength() {
		var str = NSString.randomNumericString(10)
		XCTAssert(str.length == 10)
		XCTAssert(str.isNumeric == true)

		str = NSString.randomNumericString(1457)
		XCTAssertNotNil(str)
		XCTAssert(str.length == 1457)
		XCTAssert(str.isNumeric == true)
	}

	func test_ShouldCreateEmptyNumericRandomString() {
		let str = NSString.randomNumericString(0)
		XCTAssertNotNil(str)
		XCTAssert(str.length == 0)
		XCTAssert(str == "")
		XCTAssert(str.isNumeric == false)
	}

	func test_ShouldCreateDifferentNumericRandomStrings() {
		let left = NSString.randomNumericString(10)
		XCTAssert(left.length == 10)
		XCTAssert(left.isNumeric == true)

		let right = NSString.randomNumericString(10)
		XCTAssert(right.length == 10)
		XCTAssert(right.isNumeric == true)

		XCTAssert(right != left)
	}
}

// MARK: - Random Alpha Numeric String

extension NSStringTests {

	func test_ShouldCreateRandomStringWithLength() {
		let str = NSString.randomString(10)
		XCTAssertNotNil(str)
		XCTAssert(str.length == 10)
		XCTAssert(str.isAlphaNumeric == true)
	}

	func test_ShouldCreateRandomStringWithValidLength() {
		var str = NSString.randomString(10)
		XCTAssert(str.length == 10)
		XCTAssert(str.isAlphaNumeric == true)

		str = NSString.randomString(1457)
		XCTAssertNotNil(str)
		XCTAssert(str.length == 1457)
		XCTAssert(str.isAlphaNumeric == true)
	}

	func test_ShouldCreateEmptyRandomStringWithLength() {
		let str = NSString.randomString(0)
		XCTAssertNotNil(str)
		XCTAssert(str.length == 0)
		XCTAssert(str == "")
		XCTAssert(str.isAlphaNumeric == false)
	}

	func test_ShouldCreateDifferentRandomStringsWithLength() {
		let left = NSString.randomString(10)
		XCTAssert(left.length == 10)
		XCTAssert(left.isAlphaNumeric == true)

		let right = NSString.randomString(10)
		XCTAssert(right.length == 10)
		XCTAssert(right.isAlphaNumeric == true)

		XCTAssert(right != left)
	}
}

// MARK: - Random String

extension NSStringTests {

	func test_ShouldCreateRandomString() {
		let str = NSString.randomString()
		XCTAssertNotNil(str)
		XCTAssert(str.length >= 1)
		XCTAssert(str.length <= 100)
		XCTAssert(str.isAlphaNumeric == true)
	}

	func test_ShouldCreateDifferentRandomStrings() {
		let left = NSString.randomString()
		let right = NSString.randomString(10)

		XCTAssert(right != left)
	}
}

// MARK: - Randomize String

extension NSStringTests {

	func test_ShouldRandomizeString() {
		let str = "abcdefgh"
		let randomized = str.randomizedString()

		XCTAssertNotNil(randomized)
		XCTAssert(str.characters.count == randomized.length)
		XCTAssert(str != randomized)
	}

	func test_RandomizeStringShouldHaveSameLength() {
		let str = NSString.randomString(20)
		let randomized = str.randomizedString()

		XCTAssertNotNil(randomized)
		XCTAssert(str.length == randomized.length)
		XCTAssert(randomized.length == 20)
	}
}

// MARK: - NSString+NSDate With Style

extension NSStringTests {

	func test_ShouldCreateAStringFromDateWithNoStyle() {
		let date = (NSDate(fromDayString: "1991-01-19") ?? NSDate())
		let string = NSString(fromDate: date, style: NSDateFormatterStyle.NoStyle)
		XCTAssert(string == "")
	}

	func test_ShouldCreateAStringFromDateWithShortStyle() {
		let date = (NSDate(fromDayString: "1991-01-19") ?? NSDate())
		let string = NSString(fromDate: date, style: NSDateFormatterStyle.ShortStyle)
		if (NSLocale.currentLocale().localeIdentifier.hasPrefix("en_DE") == true) {
			XCTAssertEqual(string, "19/01/91")
		} else if (NSLocale.currentLocale().localeIdentifier.hasPrefix("de_DE") == true) {
			XCTAssertEqual(string, "19.01.91")
		} else {
			XCTAssertEqual(string, "1/19/91")
		}
	}

	func test_ShouldCreateAStringFromDateWithMediumStyle() {
		let date = (NSDate(fromDayString: "1991-01-19") ?? NSDate())
		let string = NSString(fromDate: date, style: NSDateFormatterStyle.MediumStyle)
		if (NSLocale.currentLocale().localeIdentifier.hasPrefix("en_DE") == true) {
			XCTAssertEqual(string, "19 Jan 1991")
		} else if (NSLocale.currentLocale().localeIdentifier.hasPrefix("de_DE") == true) {
			XCTAssertEqual(string, "19.01.1991")
		} else {
			XCTAssertEqual(string, "Jan 19, 1991")
		}
	}

	func test_ShouldCreateAStringFromDateWithLongStyle() {
		let date = (NSDate(fromDayString: "1991-01-19") ?? NSDate())
		let string = NSString(fromDate: date, style: NSDateFormatterStyle.LongStyle)
		if (NSLocale.currentLocale().localeIdentifier.hasPrefix("en_DE") == true) {
			XCTAssertEqual(string, "19 January 1991")
		} else if (NSLocale.currentLocale().localeIdentifier.hasPrefix("de_DE") == true) {
			XCTAssertEqual(string, "19. Januar 1991")
		} else {
			XCTAssertEqual(string, "January 19, 1991")
		}
	}

	func test_ShouldCreateAStringFromDateWithFullStyle() {
		let date = (NSDate(fromDayString: "1991-01-19") ?? NSDate())
		let string = NSString(fromDate: date, style: NSDateFormatterStyle.FullStyle)
		if (NSLocale.currentLocale().localeIdentifier.hasPrefix("en_DE") == true) {
			XCTAssertEqual(string, "Saturday 19 January 1991")
		} else if (NSLocale.currentLocale().localeIdentifier.hasPrefix("de_DE") == true) {
			XCTAssertEqual(string, "Samstag, 19. Januar 1991")
		} else {
			XCTAssertEqual(string, "Saturday, January 19, 1991")
		}
	}
}

// MARK: - Regex::Email

extension NSStringTests {

	func test_ShouldVerifyValidEmail() {
		let email = "sac@main.fr"
		XCTAssert(email.isEmail == true)
	}

	func test_ShouldVerifyInvalidEmail() {
		let email = "@main.fr"
		XCTAssert(email.isEmail == false)
	}

	func test_ShouldVerifyEmptyEmailString() {
		let email = ""
		XCTAssert(email.isEmail == false)
	}

	func test_ShouldVerifyComplexEmailString() {
		let email = "sac+super.test@main.domain-world.fr"
		XCTAssert(email.isEmail == true)
	}
}

// MARK: - Regex::Numeric

extension NSStringTests {

	func test_ShouldNotVerifyWrongIntegerString() {
		let email = "4356789a"
		XCTAssert(email.isNumeric == false)
	}

	func test_ShouldVerifyValidNegativeIntegerString() {
		let email = "-4356789"
		XCTAssert(email.isNumeric == true)
	}

	func test_ShouldVerifyValidIntegerString() {
		let email = "4356789"
		XCTAssert(email.isNumeric == true)
	}

	func test_ShouldVerifyValidNegativeDecimalString() {
		let email = "-34.2476"
		XCTAssert(email.isNumeric == true)
	}

	func test_ShouldNotVerifyValidNegativeDecimalStringWithNoAfterZeroValue() {
		let email = "-34."
		XCTAssert(email.isNumeric == false)
	}

	func test_ShouldVerifyValidNegativeZero() {
		let email = "-0"
		XCTAssert(email.isNumeric == true)
	}

	func test_ShouldVerifyValidZero() {
		let email = "0"
		XCTAssert(email.isNumeric == true)
	}

	func test_ShouldNotVerifyInvalidNegativeDecimalString() {
		let email = "-34.24-76"
		XCTAssert(email.isNumeric == false)
	}

	func test_ShouldVerifyValidDecimalString() {
		let email = "34.2476"
		XCTAssert(email.isNumeric == true)
	}

	func test_ShouldNotValidWrongDecimalString() {
		let email = "34.247.316"
		XCTAssert(email.isNumeric == false)
	}

	func test_ShouldVerifyValidNumeric() {
		let email = "4356789"
		XCTAssert(email.isNumeric == true)
	}

	func test_ShouldVerifyInvalidNumeric() {
		let email = "@main.fr"
		XCTAssert(email.isNumeric == false)
	}

	func test_ShouldVerifyEmptyNumericString() {
		let email = ""
		XCTAssert(email.isNumeric == false)
	}

	func test_ShouldVerifyComplexNumericString() {
		let email = "000401004049082494925956"
		XCTAssert(email.isNumeric == true)
	}
}

// MARK: - Regex::AlphaNumeric

extension NSStringTests {

	func test_ShouldVerifyValidAlphaNumeric() {
		let email = "abcABC123"
		XCTAssert(email.isAlphaNumeric == true)
	}

	func test_ShouldVerifyInvalidAlphaNumeric() {
		let email = "44@maein.fr"
		XCTAssert(email.isAlphaNumeric == false)
	}

	func test_ShouldVerifyInvalidAlphaNumericWithUnderscore() {
		let email = "446_7"
		XCTAssert(email.isAlphaNumeric == false)
	}

	func test_ShouldVerifyEmptyAlphaNumericString() {
		let email = ""
		XCTAssert(email.isAlphaNumeric == false)
	}

	func test_ShouldVerifyComplexAlphaNumericString() {
		let email = "00040tttzeferg100vv4ggaa0490a8efferf249f4925956"
		XCTAssert(email.isAlphaNumeric == true)
	}
}

// MARK: - Regex::PhoneNumber

extension NSStringTests {

	func test_ShouldVerifyValidPhoneNumberString() {
		let email = "0015170079642"
		XCTAssert(email.isPhoneNumber == true)
	}

	func test_ShouldVerifyInvalidPhoneNumberString() {
		let email = "0044@maein.fr"
		XCTAssert(email.isPhoneNumber == false)
	}

	func test_ShouldVerifyEmptyPhoneNumberString() {
		let email = ""
		XCTAssert(email.isPhoneNumber == false)
	}

	func test_ShouldVerifyComplexPhoneNumberString() {
		let email = "0012343527384"
		XCTAssert(email.isPhoneNumber == true)
	}
}

// MARK: - Regex::First Occurence For Pattern

extension NSStringTests {

	func test_ShouldFindOccurenceForPatternInString() {
		let str = "SuperTest"
		let occurence = str.firstOccuranceForPattern("upe+.*es")
		XCTAssertNotNil(occurence)
		XCTAssertEqual(occurence, "uperTes")
	}

	func test_ShouldFindOnlyOneOccurenceForPatternInString() {
		let str = "SuperTestSuper_est"
		let occurence = str.firstOccuranceForPattern("upe+.*es")
		XCTAssertNotNil(occurence)
		XCTAssertEqual(occurence, "uperTestSuper_es")
	}

	func test_ShouldFindOnlyFirstOccurenceForPatternInString() {
		let str = "SuperTestSuper_est"
		let occurence = str.firstOccuranceForPattern("er[_A-Z]*es")
		XCTAssertNotNil(occurence)
		XCTAssertEqual(occurence, "erTes")
	}

	func test_ShouldReturnNilIfNoOccurenceFound() {
		let str = "SuperTestSuper_est"
		let occurence = str.firstOccuranceForPattern("[0-9]")
		XCTAssertNil(occurence)
	}
}

// MARK: - Regex::Last Occurence For Pattern

extension NSStringTests {

	func test_ShouldFindLastOccurenceForPatternInString() {
		let str = "SuperTest"
		let occurence = str.lastOccuranceForPattern("upe+.*es")
		XCTAssertNotNil(occurence)
		XCTAssertEqual(occurence, "uperTes")
	}

	func test_ShouldFindOnlyOneLastOccurenceForPatternInString() {
		let str = "SuperTestSuper_est"
		let occurence = str.lastOccuranceForPattern("upe+.*es")
		XCTAssertNotNil(occurence)
		XCTAssertEqual(occurence, "uperTestSuper_es")
	}

	func test_ShouldFindOnlyLastOccurenceForPatternInString() {
		let str = "SuperTestSuper_est"
		let occurence = str.lastOccuranceForPattern("er[_A-Z]*es")
		XCTAssertNotNil(occurence)
		XCTAssertEqual(occurence, "er_es")
	}

	func test_ShouldReturnNilIfNoLastOccurenceFound() {
		let str = "SuperTestSuper_est"
		let occurence = str.lastOccuranceForPattern("[0-9]")
		XCTAssertNil(occurence)
	}
}

// MARK: - Remove Duplicated Characters

extension NSStringTests {

	func test_ShouldRemoveDuplicatedCharacters() {

		let str = "aa bbccd  d "
		let clearedStr = str.removeDuplicatedCharacters()
		XCTAssertNotNil(clearedStr)
		XCTAssert(clearedStr == "a bcd")
	}

	func test_ShouldNoCrashWhenNoDuplicatedCharacters() {
		let str = "abcd"
		let clearedStr = str.removeDuplicatedCharacters()
		XCTAssertNotNil(clearedStr)
		XCTAssert(clearedStr == str)
	}

	func test_RemoveDuplicatedCharactersShouldReturnSameInvalidString() {
		let str = ""
		let clearedStr = str.removeDuplicatedCharacters()
		XCTAssertNotNil(clearedStr)
		XCTAssert(clearedStr == str)
	}
}

// MARK: - Remove Trim Whitespaces

extension NSStringTests {

	func test_ShouldRemoveTrimWhitespaces() {
		let str = "  super test \n • \t   "
		let trimmed = str.trimWhitespaces()
		XCTAssertNotNil(trimmed)
		XCTAssert(str != trimmed)
		XCTAssertEqual(trimmed, "super test \n •")
	}

	func test_ShouldOnlyTrimmSpacesAndReturnSameString() {
		let str = "super test  \t  hello world"
		let trimmed = str.trimWhitespaces()
		XCTAssertNotNil(trimmed)
		XCTAssert(str == trimmed)
		XCTAssertEqual(trimmed, "super test  \t  hello world")
	}
}

// MARK: - Remove All Illegal Characters

extension NSStringTests {

	func test_ShouldRemoveAllIllegalCharacters() {
		let str = "  super\r test \n • \t   \n"
		let trimmed = str.removeAllNewlinesAndIllegalChars()
		XCTAssertNotNil(trimmed)
		XCTAssert(str != trimmed)
		XCTAssertEqual(trimmed, "super\r test \n •")
	}
}
