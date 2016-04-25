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

	private var currentBundle : NSBundle {
		return NSBundle(forClass: NSBundleTests.self)
	}
}

// MARK: - Static entryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnNilFromMainBundle() {
		NSBundle.entryInPListForKey("CFBundleDevelopmentRegion")
		NSBundle.booleanEntryInPListForKey("UIRequiresFullScreen")
		NSBundle.stringEntryInPListForKey("CFBundleVersion")
		NSBundle.numberEntryInPListForKey("CFBundleInfoDictionaryVersion")
		XCTAssert(true) // did not crash
	}
}

// MARK: - entryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidValue() {
		let value = self.currentBundle.entryInPListForKey("CFBundleDevelopmentRegion")
		XCTAssertNotNil(value)
		XCTAssert(value is String)
		XCTAssert((value as? String) == "en")
	}
}

// MARK: - stringEntryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidStringValue() {
		let value = self.currentBundle.stringEntryInPListForKey("CFBundleDevelopmentRegion")
		XCTAssertNotNil(value)
		XCTAssert(value != "")
		XCTAssert(value.characters.count > 0)
	}
}

// MARK: - booleanEntryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidTrueBooleanValue() {
		let value = self.currentBundle.booleanEntryInPListForKey("UIRequiresFullScreen")
		XCTAssertNotNil(value)
		XCTAssert(value == false)
		XCTAssert(value != true)
	}

	func test_ShouldReturnValidFalseBooleanValue() {
		let value = self.currentBundle.booleanEntryInPListForKey("UnitTestTrue")
		XCTAssertNotNil(value)
		XCTAssert(value == true)
		XCTAssert(value != false)
	}
}

// MARK: - numberEntryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidNumberValue() {
		let value = self.currentBundle.numberEntryInPListForKey("CFBundleVersion")
		XCTAssertNotNil(value)
		XCTAssert(value.integerValue > 0 && value.integerValue < Int.max)
	}

	func test_ShouldReturnValidNumberValueFromString() {
		let value = self.currentBundle.numberEntryInPListForKey("CFBundleInfoDictionaryVersion")
		XCTAssertNotNil(value)
		XCTAssert(value.integerValue == 6)
	}
}
