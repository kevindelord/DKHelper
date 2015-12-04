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
