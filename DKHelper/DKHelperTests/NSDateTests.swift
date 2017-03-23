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

	var today		: Date?

}

// MARK: - Is date older or equal

extension NSDateTests {

	override func setUp() {
		super.setUp()
		self.today = Date()
	}

	func test_ShouldCheckIfTodayIsEqualToToday() {
		if let today = self.today {
			var date = DateComponents()
			date.day = 0
			date.month = 0
			date.year = 0
			let result = (today as NSDate).isOlderOrEqualThan(date)
			XCTAssertTrue(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsNotOlderThenEarlierYear() {
		if let today = self.today {
			let result = (today as NSDate).isOlderOrEqualThan(10, months: 0, days: 0, hours: 0, minutes: 0, seconds: 0)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsOlderThenLaterYear() {
		if let today = self.today {
			let result = (today as NSDate).isOlderOrEqualThanYearInterval(-2)
			XCTAssertTrue(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsOlderThenLaterMonth() {
		if let today = self.today {
			let result = (today as NSDate).isOlderOrEqualThanMonthInterval(-12)
			XCTAssertTrue(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsNotOlderThenEarlierDay() {
		if let today = self.today {
			let result = (today as NSDate).isOlderOrEqualThanDayInterval(366)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsNotOlderThenEarlierHour() {
		if let today = self.today {
			let result = (today as NSDate).isOlderOrEqualThanHourInterval(366)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsNotOlderThenEarlierMinute() {
		if let today = self.today {
			let result = (today as NSDate).isOlderOrEqualThanDayInterval(1)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func test_ShouldCheckIfTodayIsOlderThenLaterSecond() {
		if let today = self.today {
			let result = (today as NSDate).isOlderOrEqualThanSecondInterval(-1)
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
		if (Locale.current.identifier == "en_DE") {
			string = "06 Dec 1992 14:35:32"
		} else if (Locale.current.identifier == "de_DE") {
			string = "06.12.1992, 14:35:32"
		}

		let date = NSDate(from: string, style: .medium)
		XCTAssertNotNil(date)
		XCTAssertEqual((date as NSDate?)?.year(), 1992)
		XCTAssertEqual((date as NSDate?)?.day(), 6)
		XCTAssertEqual((date as NSDate?)?.month(), 12)
	}

	func test_ShouldReturnInvalidDate() {
		let date = NSDate(from: "Dec 24, 1992", style: .medium)
		let dateByFormat = NSDate(from: "24.12.1992", format: "yyyy.MM.dd")
		let dateByString = NSDate(from: "ab.cd.efgh", format: "dd.MM.yyyy")
		XCTAssertNil(date, "expect German Region")
		XCTAssertNil(dateByFormat)
		XCTAssertNil(dateByString)
	}

	func test_ShouldReturnNilDate() {
		let date = NSDate(from: "Dec 24, 1992", style: .full)
		XCTAssertNil(date)
	}

	func test_ShouldReturnValidAndCorrectDateWithStringFormat() {
		let date = NSDate(from: "24.12.1992", format: "dd.MM.yyyy")
		XCTAssertNotNil(date)
		XCTAssertEqual((date as NSDate?)?.year(), 1992)
		XCTAssertEqual((date as NSDate?)?.day(), 24)
		XCTAssertEqual((date as NSDate?)?.month(), 12)
	}

	func test_ShouldReturnValidTodayDate() {
		if let today = self.today {
			let date = NSDate(fromISOString: (today as NSDate).iso8601StringValue())
			XCTAssertNotNil(date)
			XCTAssertEqual((date as NSDate?)?.year(), (today as NSDate).year())
			XCTAssertEqual((date as NSDate?)?.day(), (today as NSDate).day())
			XCTAssertEqual((date as NSDate?)?.month(), (today as NSDate).month())
			XCTAssertEqual((date as NSDate?)?.hour(), (today as NSDate).hour())
			XCTAssertEqual((date as NSDate?)?.minute(), (today as NSDate).minute())
			XCTAssertEqual((date as NSDate?)?.second(), (today as NSDate).second())
		} else {
			XCTFail()
		}
	}

	func testReturnValidStringValueOfTodayDate() {
		if let today = self.today {
			let value = (today as NSDate).stringValue()
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
		let date = Date(timeIntervalSince1970: 0)
		XCTAssertEqual((date as NSDate).year(), 1970)
		XCTAssertEqual((date as NSDate).day(), 1)
		XCTAssertEqual((date as NSDate).month(), 1)
		let offset = TimeInterval(NSTimeZone.default.secondsFromGMT())
		let daylightHour = Int(offset / 3600)
		XCTAssertEqual((date as NSDate).hour(), daylightHour)
		XCTAssertEqual((date as NSDate).minute(), 0)
		XCTAssertEqual((date as NSDate).second(), 0)
	}

	func test_ShouldReturnTodaysMidnightDate() {
		let date = (self.today as NSDate?)?.midnight()
		XCTAssertNotNil(date)
		XCTAssertEqual((date as NSDate?)?.year(), (self.today as NSDate?)?.year())
		XCTAssertEqual((date as NSDate?)?.day(), (self.today as NSDate?)?.day())
		XCTAssertEqual((date as NSDate?)?.month(), (self.today as NSDate?)?.month())
		XCTAssertEqual((date as NSDate?)?.hour(), 0)
		XCTAssertEqual((date as NSDate?)?.minute(), 0)
		XCTAssertEqual((date as NSDate?)?.second(), 0)
	}

	func test_ShouldReturnTodaysDayDate() {
		let date = NSDate.currentDay()
		XCTAssertNotNil(date)
		XCTAssertEqual((date as NSDate?)?.year(), (self.today as NSDate?)?.year())
		XCTAssertEqual((date as NSDate?)?.day(), (self.today as NSDate?)?.day())
		XCTAssertEqual((date as NSDate?)?.month(), (self.today as NSDate?)?.month())
		XCTAssertEqual((date as NSDate?)?.hour(), 0)
		XCTAssertEqual((date as NSDate?)?.minute(), 0)
		XCTAssertEqual((date as NSDate?)?.second(), 0)
	}
}

// MARK: - Date dispaly Strings

extension NSDateTests {

	func test_ShouldReturnValidAndCorrectDateComponentNaming() {
		let date = NSDate(from: "04.12.2015", format: "dd.MM.yyyy")
		let dayName = (date as NSDate?)?.dayName()
		let monthName = (date as NSDate?)?.monthName()
		XCTAssertNotNil(date)
		XCTAssertNotNil(dayName)
		XCTAssertNotNil(monthName)
		if (Locale.current.identifier.hasPrefix("en") == true) {
			XCTAssertEqual(dayName, "Friday", "expect english localization")
			XCTAssertEqual(monthName, "December", "expect english localization")
		} else if (Locale.current.identifier.hasPrefix("de") == true) {
			XCTAssertEqual(dayName, "Freitag", "expect german localization")
			XCTAssertEqual(monthName, "Dezember", "expect german localization")
		}
	}

	func test_ShouldReturnValidAndCorrectDateDisplayStrings() {
		let date = NSDate(from: "04.12.2015 - 15:27:11", format: "dd.MM.yyyy - HH:mm:ss")
		let fullDisplayString = (date as NSDate?)?.fullDisplayTime()
		let hourDisplayString = (date as NSDate?)?.hourDisplayTime()
		let displayString = (date as NSDate?)?.displayableString()
		XCTAssertNotNil(date)
		XCTAssertNotNil(fullDisplayString)
		XCTAssertNotNil(hourDisplayString)
		XCTAssertNotNil(displayString)

		if (Locale.current.identifier.hasPrefix("de") == true) {
			XCTAssertEqual(fullDisplayString, "4. Dezember 2015 um 15:27", "expect german localization")
			XCTAssertEqual(hourDisplayString, "15:27", "expect german localization")
			XCTAssertEqual(displayString, "04.12.2015", "expect german localization")
		} else if (Locale.current.identifier.hasPrefix("en_DE") == true) {
			XCTAssertEqual(fullDisplayString, "4 December 2015 at 15:27", "expect english localization with german region")
			XCTAssertEqual(hourDisplayString, "15:27", "expect english localization with german region")
			XCTAssertEqual(displayString, "04 Dec 2015", "expect english localization with german region")
		} else if (Locale.current.identifier.hasPrefix("en") == true) {
			XCTAssertEqual(fullDisplayString, "December 4, 2015 at 3:27 PM", "expect english localization")
			XCTAssertEqual(hourDisplayString, "3:27 PM", "expect english localization")
			XCTAssertEqual(displayString, "Dec 4, 2015", "expect english localization")
		}
	}
}

// MARK: - Log methods

extension NSDateTests {

	func test_ShouldLogAllFormat() {
		let date = Date()
		(date as NSDate).logAllFormats()
		XCTAssert(true)
	}

	func test_ShouldLogOneFormat() {
		let date = Date()
		(date as NSDate).logCurrentDate(withDateStyleAndAllTime: .full)
		XCTAssert(true)
	}
}

// MARK: - Date by adding Interval

extension NSDateTests {

	func test_ShouldReturnDateByAddingInterval() {
		let date 			= NSDate(from: "04.12.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss")
		let possibleResult 	= NSDate(from: "04.12.2017 - 20:00:00", format: "dd.MM.yyyy - HH:mm:ss")
		let result = (date as NSDate?)?.addingIntervals(withYear: 1, months: 12, days: 0, hours: 5, minutes: 32, seconds: 49)

		XCTAssertNotNil(date)
		XCTAssertNotNil(possibleResult)
		XCTAssertNotNil(result)
		XCTAssertEqual((possibleResult as NSDate?)?.year(), (result as NSDate?)?.year())
		XCTAssertEqual((possibleResult as NSDate?)?.month(), (result as NSDate?)?.month())
		XCTAssertEqual((possibleResult as NSDate?)?.day(), (result as NSDate?)?.day())
		XCTAssertEqual((possibleResult as NSDate?)?.hour(), (result as NSDate?)?.hour())
		XCTAssertEqual((possibleResult as NSDate?)?.second(), (result as NSDate?)?.minute())
		XCTAssertEqual((possibleResult as NSDate?)?.second(), (result as NSDate?)?.second())
	}

	func test_ShouldReturnValidDateByAddingYear() {
		if let
			today = self.today,
			let date = (today as NSDate).addingYearInterval(1) {
				XCTAssertEqual((today as NSDate).laterDate(date as Date), date as Date)
				XCTAssertEqual(abs((today as NSDate).year() - (date as NSDate).year()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingMonth() {
		if let
			today = NSDate(from: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			let date = (today as NSDate).addingMonthInterval(1) {
				XCTAssertEqual((today as NSDate).laterDate(date as Date), date as Date)
				XCTAssertEqual(abs((today as NSDate).month() - (date as NSDate).month()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingDay() {
		if let
			today = NSDate(from: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			let date = (today as NSDate).addingDayInterval(-1) {
				XCTAssertEqual((today as NSDate).earlierDate(date as Date), date as Date)
				XCTAssertEqual(abs((today as NSDate).day() - (date as NSDate).day()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingHour() {
		if let
			today = NSDate(from: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			let date = (today as NSDate).addingHourInterval(24) {
				XCTAssertEqual((today as NSDate).laterDate(date as Date), date as Date)
				XCTAssertEqual(abs((today as NSDate).hour() - (date as NSDate).hour()), 0)
				XCTAssertEqual(abs((today as NSDate).day() - (date as NSDate).day()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingMinute() {
		if let
			today = NSDate(from: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			let date = (today as NSDate).addingMinuteInterval(-1) {
				XCTAssertEqual((today as NSDate).earlierDate(date as Date), date as Date)
				XCTAssertEqual(abs((today as NSDate).minute() - (date as NSDate).minute()), 1)
		} else {
			XCTFail()
		}
	}

	func test_ShouldReturnValidDateByAddingSecond() {
		if let
			today = NSDate(from: "04.11.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss"),
			let date = (today as NSDate).addingSecondInterval(1) {
				XCTAssertEqual((today as NSDate).laterDate(date as Date), date as Date)
		} else {
			XCTFail()
		}
	}
}

// MARK: - ISO Format

extension NSDateTests {

	func test_ShouldReturnValidAndCorrectISOStringFromDate() {
		let date = NSDate(from: "04.12.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss")
		let isoString = (date as NSDate?)?.iso8601StringValue()
		XCTAssertNotNil(isoString)
		XCTAssertEqual(isoString, "2015-12-04T14:27:11Z")
	}
}
