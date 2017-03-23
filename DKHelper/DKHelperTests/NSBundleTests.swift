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

	fileprivate var currentBundle : Bundle {
		return Bundle(for: NSBundleTests.self)
	}
}

// MARK: - Static entryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnNilFromMainBundle() {
		Bundle.entryInPList(forKey: "CFBundleDevelopmentRegion")
		Bundle.booleanEntryInPList(forKey: "UIRequiresFullScreen")
		Bundle.stringEntryInPList(forKey: "CFBundleVersion")
		Bundle.numberEntryInPList(forKey: "CFBundleInfoDictionaryVersion")
		XCTAssert(true) // did not crash
	}
}

// MARK: - entryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidValue() {
		let value = self.currentBundle.entryInPList(forKey: "CFBundleDevelopmentRegion")
		XCTAssertNotNil(value)
		XCTAssert(value is String)
		XCTAssert((value as? String) == "en")
	}
}

// MARK: - stringEntryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidStringValue() {
		let value = self.currentBundle.stringEntryInPList(forKey: "CFBundleDevelopmentRegion")
		XCTAssertNotNil(value)
		XCTAssert(value != "")
		XCTAssert(value.characters.count > 0)
	}
}

// MARK: - booleanEntryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidTrueBooleanValue() {
		let value = self.currentBundle.booleanEntryInPList(forKey: "UIRequiresFullScreen")
		XCTAssertNotNil(value)
		XCTAssert(value == false)
		XCTAssert(value != true)
	}

	func test_ShouldReturnValidFalseBooleanValue() {
		let value = self.currentBundle.booleanEntryInPList(forKey: "UnitTestTrue")
		XCTAssertNotNil(value)
		XCTAssert(value == true)
		XCTAssert(value != false)
	}
}

// MARK: - numberEntryInPListForKey

extension NSBundleTests {

	func test_ShouldReturnValidNumberValue() {
		let value = self.currentBundle.numberEntryInPList(forKey: "CFBundleVersion")
		XCTAssertNotNil(value)
		XCTAssert(value.intValue > 0 && value.intValue < Int.max)
	}

	func test_ShouldReturnValidNumberValueFromString() {
		let value = self.currentBundle.numberEntryInPList(forKey: "CFBundleInfoDictionaryVersion")
		XCTAssertNotNil(value)
		XCTAssert(value.intValue == 6)
	}
}
