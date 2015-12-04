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
		let date = NSDate(fromString: "Dec 24, 1992", style: .MediumStyle)
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
