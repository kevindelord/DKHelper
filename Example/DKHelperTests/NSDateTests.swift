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

	func testShouldCheckIfTodayIsEqualToToday() {
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

	func testShouldCheckIfTodayIsNotOlderThenEarlierYear() {
		if let today = self.today {
			let result = today.isOlderOrEqualThan(10, months: 0, days: 0, hours: 0, minutes: 0, seconds: 0)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func testShouldCheckIfTodayIsOlderThenLaterYear() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanYearInterval(-2)
			XCTAssertTrue(result)
		} else {
			XCTFail()
		}
	}

	func testShouldCheckIfTodayIsOlderThenLaterMonth() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanMonthInterval(-12)
			XCTAssertTrue(result)
		} else {
			XCTFail()
		}
	}

	func testShouldCheckIfTodayIsNotOlderThenEarlierDay() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanDayInterval(366)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func testShouldCheckIfTodayIsNotOlderThenEarlierHour() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanHourInterval(366)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func testShouldCheckIfTodayIsNotOlderThenEarlierMinute() {
		if let today = self.today {
			let result = today.isOlderOrEqualThanDayInterval(1)
			XCTAssertFalse(result)
		} else {
			XCTFail()
		}
	}

	func testShouldCheckIfTodayIsOlderThenLaterSecond() {
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

	func testShouldReturnValidAndCorrectDate() {
		let date = NSDate(fromString: "24.12.1992", style: .MediumStyle)
		XCTAssertNotNil(date)
		XCTAssertEqual(date?.year(), 1992)
		XCTAssertEqual(date?.day(), 24)
		XCTAssertEqual(date?.month(), 12)
	}

	func testShouldReturnNilDate() {
		let date = NSDate(fromString: "Dec 24, 1992", style: .FullStyle)
		XCTAssertNil(date)
	}

	func testShouldReturnValidAndCorrectDateWithStringFormat() {
		let date = NSDate(fromString: "24.12.1992", format: "dd.MM.yyyy")
		XCTAssertNotNil(date)
		XCTAssertEqual(date?.year(), 1992)
		XCTAssertEqual(date?.day(), 24)
		XCTAssertEqual(date?.month(), 12)
	}

	func testShouldReturnValidTodayDate() {
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

	func testShouldReturnDatesComponents() {
		let date = NSDate(timeIntervalSince1970: 0)
		XCTAssertEqual(date.year(), 1970)
		XCTAssertEqual(date.day(), 1)
		XCTAssertEqual(date.month(), 1)
		XCTAssertEqual(date.hour(), 1, "expect Time Zone GMT+1")
		XCTAssertEqual(date.minute(), 0)
		XCTAssertEqual(date.second(), 0)
	}

	func testShouldReturnTodaysMidnightDate() {
		let date = today?.midnightDate()
		XCTAssertNotNil(date)
		XCTAssertEqual(date?.year(), today?.year())
		XCTAssertEqual(date?.day(), today?.day())
		XCTAssertEqual(date?.month(), today?.month())
		XCTAssertEqual(date?.hour(), 1, "expect Time Zone GMT+1")
		XCTAssertEqual(date?.minute(), 0)
		XCTAssertEqual(date?.second(), 0)
	}

	func testShouldReturnTodaysDayDate() {
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

	func testShouldReturnValidAndCorrectDateComponentNaming() {
		let date = NSDate(fromString: "04.12.2015", format: "dd.MM.yyyy")
		let dayName = date?.dayName()
		let monthName = date?.monthName()
		XCTAssertNotNil(date)
		XCTAssertNotNil(dayName)
		XCTAssertNotNil(monthName)
		XCTAssertEqual(dayName, "Freitag", "expect german localization")
		XCTAssertEqual(monthName, "Dezember", "expect german localization")
	}

	func testShouldReturnValidAndCorrectDateDisplayStrings() {
		let date = NSDate(fromString: "04.12.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss")
		let fullDisplayString = date?.fullDisplayTime()
		let hourDisplayString = date?.hourDisplayTime()
		let displayString = date?.displayableString()
		XCTAssertNotNil(date)
		XCTAssertNotNil(fullDisplayString)
		XCTAssertNotNil(hourDisplayString)
		XCTAssertNotNil(displayString)
		XCTAssertEqual(fullDisplayString, "4. Dezember 2015 um 15:27", "expect german localization")
		XCTAssertEqual(hourDisplayString, "15:27", "expect german localization")
		XCTAssertEqual(displayString, "04.12.2015", "expect german localization")
	}
}

// MARK: - Date by adding Interval

extension NSDateTests {

	func testShouldReturnDateByAddingInterval() {
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

	func testShouldReturnValidDateByAddingYear() {
		if let date = today?.dateByAddingYearInterval(1) {
			XCTAssertEqual(today?.laterDate(date), date)
		} else {
			XCTFail()
		}
	}

	func testShouldReturnValidDateByAddingMonth() {
		if let date = today?.dateByAddingMonthInterval(1) {
			XCTAssertEqual(today?.laterDate(date), date)
		} else {
			XCTFail()
		}
	}

	func testShouldReturnValidDateByAddingDay() {
		if let date = today?.dateByAddingDayInterval(1) {
			XCTAssertEqual(today?.laterDate(date), date)
		} else {
			XCTFail()
		}
	}

	func testShouldReturnValidDateByAddingHour() {
		if let date = today?.dateByAddingHourInterval(1) {
			XCTAssertEqual(today?.laterDate(date), date)
		} else {
			XCTFail()
		}
	}

	func testShouldReturnValidDateByAddingMinute() {
		if let date = today?.dateByAddingMinuteInterval(1) {
			XCTAssertEqual(today?.laterDate(date), date)
		} else {
			XCTFail()
		}
	}

	func testShouldReturnValidDateByAddingSecond() {
		if let date = today?.dateByAddingSecondInterval(1) {
			XCTAssertEqual(today?.laterDate(date), date)
		} else {
			XCTFail()
		}
	}
}

// MARK: - ISO Format

extension NSDateTests {

	func testShouldReturnValidAndCorrectISOStringFromDate() {
		let date = NSDate(fromString: "04.12.2015 - 14:27:11", format: "dd.MM.yyyy - HH:mm:ss")
		let isoString = date?.ISO8601StringValue()
		XCTAssertNotNil(isoString)
		XCTAssertEqual(isoString, "2015-12-04T14:27:11Z")
	}
}
