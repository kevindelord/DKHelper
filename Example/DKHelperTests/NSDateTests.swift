//
//  NSDateTests.swift
//  DKHelper
//
//  Created by Konstantin Deichmann on 04.12.15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class NSDateTests	: XCTestCase {

	var today		: NSDate?

}

// MARK: - Is date older or equal

extension NSDateTests {

	override func setUp() {
		super.setUp()
		self.today = NSDate()
	}

	func test_ShouldCheckIfTodayIsEqualToToday() {
		if let today = self.today {
			let date = NSDateComponents()
			date.day = 0
			date.month = 0
			date.year = 0
			let result = today.isOlderOrEqualThan(date)
			XCTAssertTrue(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsNotOlderThenEarlierYear() {
		if let today = self.today {
			let result = today.isOlderOrEqualThan(10, months: 0, days: 0, hours: 0, minutes: 0, seconds: 0)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsOlderThenLaterYear() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanYearInterval(-2)
			XCTAssertTrue(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsOlderThenLaterMonth() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanMonthInterval(-12)
			XCTAssertTrue(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsNotOlderThenEarlierDay() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanDayInterval(366)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsNotOlderThenEarlierHour() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanHourInterval(366)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsNotOlderThenEarlierMinute() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanDayInterval(1)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsOlderThenLaterSecond() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanSecondInterval(-1)
			XCTAssertTrue(result)
		} else {
			XCTFail()
		}
	}
}

// MARK: - Create date from a String

extension NSDateTests {

	func test_ShouldReturnValidAndCorrectDate() {
		var string = "Dec 6, 1992, 2:59:10 PM" // en_US
		if (NSLocale.currentLocale().localeIdentifier == "en_DE") {
			string = "06 Dec 1992 14:35:32"
		} else if (NSLocale.currentLocale().localeIdentifier == "de_DE") {
			string = "06.12.1992, 14:35:32"
		}

		let date = NSDate(fromString: string, style: .MediumStyle)
		XCTAssertNotNil(date)
		XCTAssertEqual(date?.year(), 1992)
		XCTAssertEqual(date?.day(), 6)
		XCTAssertEqual(date?.month(), 12)
	}

	func test_ShouldReturnInvalidDate() {
		let date = NSDate(fromString: "Dec 24, 1992", style: .MediumStyle)
		let dateByFormat = NSDate(fromString: "24.12.1992", format: "yyyy.MM.dd")
		let dateByString = NSDate(fromString: "ab.cd.efgh", format: "dd.MM.yyyy")
		XCTAssertNil(date, "expect German Region")
		XCTAssertNil(dateByFormat)
		XCTAssertNil(dateByString)
	}

	func test_ShouldReturnNilDate() {
		let date = NSDate(fromString: "Dec 24, 1992", style: .FullStyle)
		XCTAssertNil(date)
	}

	func test_ShouldReturnValidAndCorrectDateWithStringFormat() {
		let date = NSDate(fromString: "24.12.1992", format: "dd.MM.yyyy")
		XCTAssertNotNil(date)
		XCTAssertEqual(date?.year(), 1992)
		XCTAssertEqual(date?.day(), 24)
		XCTAssertEqual(date?.month(), 12)
	}

	func test_ShouldReturnValidTodayDate() {
		if let today = self.today {
			let date = NSDate(fromISOString: today.ISO8601StringValue())
			XCTAssertNotNil(date)
			XCTAssertEqual(date?.year(), today.year())
			XCTAssertEqual(date?.day(), today.day())
			XCTAssertEqual(date?.month(), today.month())
			XCTAssertEqual(date?.hour(), today.hour())
			XCTAssertEqual(date?.minute(), today.minute())
			XCTAssertEqual(date?.second(), today.second())
		} else {
			XCTFail()
		}
	}

	func testReturnValidStringValueOfTodayDate() {
		if let today = self.today {
			let value = today.stringValue()
			XCTAssertNotNil(value)
			XCTAssertTrue(value.characters.count > 0)
		} else {
			XCTFail()
		}
	}
}

// MARK: - Getting Date Components

extension NSDateTests {

	func test_ShouldReturnDatesComponents() {
		let date = NSDate(timeIntervalSince1970: 0)
		XCTAssertEqual(date.year(), 1970)
		XCTAssertEqual(date.day(), 1)
		XCTAssertEqual(date.month(), 1)
		XCTAssertEqual(date.hour(), 1, "expect Time Zone GMT+1")
		XCTAssertEqual(date.minute(), 0)
		XCTAssertEqual(date.second(), 0)
	}

	func test_ShouldReturnTodaysMidnightDate() {
		let date = today?.midnightDate()
		XCTAssertNotNil(date)
		XCTAssertEqual(date?.year(), today?.year())
		XCTAssertEqual(date?.day(), today?.day())
		XCTAssertEqual(date?.month(), today?.month())
		XCTAssertEqual(date?.hour(), 1, "expect Time Zone GMT+1")
		XCTAssertEqual(date?.minute(), 0)
		XCTAssertEqual(date?.second(), 0)
	}

	func test_ShouldReturnTodaysDayDate() {
		let date = NSDate.currentDayDate()
		XCTAssertNotNil(date)
		XCTAssertEqual(date?.year(), today?.year())
		XCTAssertEqual(date?.day(), today?.day())
		XCTAssertEqual(date?.month(), today?.month())
		XCTAssertEqual(date?.hour(), 1, "expect Time Zone GMT+1")
		XCTAssertEqual(date?.minute(), 0)
		XCTAssertEqual(date?.second(), 0)
	}
}

// MARK: - Date dispaly Strings

extension NSDateTests {

	func test_ShouldReturnValidAndCorrectDateComponentNaming() {
		let date = NSDate(fromString: "04.12.2015", format: "dd.MM.yyyy")
		let dayName = date?.dayName()
		let monthName = date?.monthName()
		XCTAssertNotNil(date)
		XCTAssertNotNil(dayName)
		XCTAssertNotNil(monthName)
		if (NSLocale.currentLocale().localeIdentifier.hasPrefix("en") == true) {
			XCTAssertEqual(dayName, "Friday", "expect english localization")
			XCTAssertEqual(monthName, "December", "expect english localization")
		} else if (NSLocale.currentLocale().localeIdentifier.hasPrefix("de") == true) {
			XCTAssertEqual(dayName, "Freitag", "expect german localization")
			XCTAssertEqual(monthName, "Dezember", "expect german localization")
		}
	}

	func test_ShouldReturnValidAndCorrectDateDisplayStrings() {
		let date = NSDate(fromString: "04.12.2015 - 15:27:11", format: "dd.MM.yyyy - HH:mm:ss")
		let fullDisplayString = date?.fullDisplayTime()
		let hourDisplayString = date?.hourDisplayTime()
		let displayString = date?.displayableString()
		XCTAssertNotNil(date)
		XCTAssertNotNil(fullDisplayString)
		XCTAssertNotNil(hourDisplayString)
		XCTAssertNotNil(displayString)

		if (NSLocale.currentLocale().localeIdentifier.hasPrefix("de") == true) {
			XCTAssertEqual(fullDisplayString, "4. Dezember 2015 um 15:27", "expect german localization")
			XCTAssertEqual(hourDisplayString, "15:27", "expect german localization")
			XCTAssertEqual(displayString, "04.12.2015", "expect german localization")
		} else if (NSLocale.currentLocale().localeIdentifier.hasPrefix("en_DE") == true) {
			XCTAssertEqual(fullDisplayString, "4 December 2015 at 15:27", "expect english localization with german region")
			XCTAssertEqual(hourDisplayString, "15:27", "expect english localization with german region")
			XCTAssertEqual(displayString, "04 Dec 2015", "expect english localization with german region")
		} else if (NSLocale.currentLocale().localeIdentifier.hasPrefix("en") == true) {
			XCTAssertEqual(fullDisplayString, "December 4, 2015 at 3:27 PM", "expect english localization")
			XCTAssertEqual(hourDisplayString, "3:27 PM", "expect english localization")
			XCTAssertEqual(displayString, "Dec 4, 2015", "expect english localization")
		}
	}
}

// MARK: - Log methods

extension NSDateTests {

	func test_ShouldLogAllFormat() {
		let date = NSDate()
		date.logAllFormats()
		XCTAssert(true)
	}

	func test_ShouldLogOneFormat() {
		let date = NSDate()
		date.logCurrentDateWithDateStyleAndAllTimeStyle(.FullStyle)
		XCTAssert(true)
	}
}

// MARK: - Date by adding Interval

extension NSDateTests {

	func test_ShouldReturnDateByAddingInterval() {
		let date 			= NSDate(fromString: "04.12.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss")
		let possibleResult 	= NSDate(fromString: "04.12.2017 - 20:00:00", format: "dd.MM.yyyy - HH:mm:ss")
		let result = date?.dateByAddingIntervalsWithYear(1, months: 12, days: 0, hours: 5, minutes: 32, seconds: 49)

		XCTAssertNotNil(date)
		XCTAssertNotNil(possibleResult)
		XCTAssertNotNil(result)
		XCTAssertEqual(possibleResult?.year(), result?.year())
		XCTAssertEqual(possibleResult?.month(), result?.month())
		XCTAssertEqual(possibleResult?.day(), result?.day())
		XCTAssertEqual(possibleResult?.hour(), result?.hour())
		XCTAssertEqual(possibleResult?.second(), result?.minute())
		XCTAssertEqual(possibleResult?.second(), result?.second())
	}

	func test_ShouldReturnValidDateByAddingYear() {
		if let
			today = self.today,
			date = today.dateByAddingYearInterval(1) {
				XCTAssertEqual(today.laterDate(date), date)
				XCTAssertEqual(abs(today.year() - date.year()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingMonth() {
		if let
			today = NSDate(fromString: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			date = today.dateByAddingMonthInterval(1) {
				XCTAssertEqual(today.laterDate(date), date)
				XCTAssertEqual(abs(today.month() - date.month()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingDay() {
		if let
			today = NSDate(fromString: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			date = today.dateByAddingDayInterval(-1) {
				XCTAssertEqual(today.earlierDate(date), date)
				XCTAssertEqual(abs(today.day() - date.day()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingHour() {
		if let
			today = NSDate(fromString: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			date = today.dateByAddingHourInterval(24) {
				XCTAssertEqual(today.laterDate(date), date)
				XCTAssertEqual(abs(today.hour() - date.hour()), 0)
				XCTAssertEqual(abs(today.day() - date.day()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingMinute() {
		if let
			today = NSDate(fromString: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			date = today.dateByAddingMinuteInterval(-1) {
				XCTAssertEqual(today.earlierDate(date), date)
				XCTAssertEqual(abs(today.minute() - date.minute()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingSecond() {
		if let
			today = NSDate(fromString: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			date = today.dateByAddingSecondInterval(1) {
				XCTAssertEqual(today.laterDate(date), date)
		} else {
			XCTFail()
		}
	}
}

// MARK: - ISO Format

extension NSDateTests {

	func test_ShouldReturnValidAndCorrectISOStringFromDate() {
		let date = NSDate(fromString: "04.12.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss")
		let isoString = date?.ISO8601StringValue()
		XCTAssertNotNil(isoString)
		XCTAssertEqual(isoString, "2015-12-04T14:27:11Z")
	}
}
