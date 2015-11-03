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
		XCTAssert(str.characters.count == 10)
		XCTAssert(str.isNumeric() == true)
	}

	func test_ShouldCreateNumericRandomStringWithValidLength() {
		var str = NSString.randomNumericString(10)
		XCTAssert(str.characters.count == 10)
		XCTAssert(str.isNumeric() == true)

		str = NSString.randomNumericString(1457)
		XCTAssertNotNil(str)
		XCTAssert(str.characters.count == 1457)
		XCTAssert(str.isNumeric() == true)
	}

	func test_ShouldCreateEmptyNumericRandomString() {
		let str = NSString.randomNumericString(0)
		XCTAssertNotNil(str)
		XCTAssert(str.characters.count == 0)
		XCTAssert(str == "")
		XCTAssert(str.isNumeric() == false)
	}
}

// MARK: - Random Alpha Numeric String

extension NSStringTests {

	func test_ShouldCreateRandomString() {
		let str = NSString.randomString(10)
		XCTAssertNotNil(str)
		XCTAssert(str.characters.count == 10)
		XCTAssert(str.isAlphaNumeric() == true)
	}

	func test_ShouldCreateRandomStringWithValidLength() {
		var str = NSString.randomString(10)
		XCTAssert(str.characters.count == 10)
		XCTAssert(str.isAlphaNumeric() == true)

		str = NSString.randomString(1457)
		XCTAssertNotNil(str)
		XCTAssert(str.characters.count == 1457)
		XCTAssert(str.isAlphaNumeric() == true)
	}

	func test_ShouldCreateEmptyRandomString() {
		let str = NSString.randomString(0)
		XCTAssertNotNil(str)
		XCTAssert(str.characters.count == 0)
		XCTAssert(str == "")
		XCTAssert(str.isAlphaNumeric() == false)
	}
}
