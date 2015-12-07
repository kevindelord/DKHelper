//
//  NSBundleTests.swift
//  DKHelper
//
//  Created by kevin delord on 05/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class NSBundleTests: XCTestCase {

}

// MARK: - entryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidValue() {
		let value = NSBundle.entryInPListForKey("CFBundleDevelopmentRegion")
		XCTAssertNotNil(value)
		XCTAssert(value is String)
		XCTAssert((value as? String) == "en")
	}
}

// MARK: - stringEntryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidStringValue() {
		let value = NSBundle.stringEntryInPListForKey("CFBundleDevelopmentRegion")
		XCTAssertNotNil(value)
		XCTAssert(value != "")
		XCTAssert(value.characters.count > 0)
	}
}

// MARK: - booleanEntryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidTrueBooleanValue() {
		let value = NSBundle.booleanEntryInPListForKey("UIRequiresFullScreen")
		XCTAssertNotNil(value)
		XCTAssert(value == true)
		XCTAssert(value != false)
	}

	func test_ShouldReturnValidFalseBooleanValue() {
		let value = NSBundle.booleanEntryInPListForKey("UnitTestFalse")
		XCTAssertNotNil(value)
		XCTAssert(value == false)
		XCTAssert(value != true)
	}
}

// MARK: - numberEntryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidNumberValue() {
		let value = NSBundle.numberEntryInPListForKey("CFBundleVersion")
		XCTAssertNotNil(value)
		XCTAssert(value.integerValue > 0 && value.integerValue < Int.max)
	}

	func test_ShouldReturnValidNumberValueFromString() {
		let value = NSBundle.numberEntryInPListForKey("CFBundleInfoDictionaryVersion")
		XCTAssertNotNil(value)
		XCTAssert(value.integerValue == 6)
	}
}
