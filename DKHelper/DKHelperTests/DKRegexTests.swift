//
//  DKRegexTests.swift
//  DKHelper
//
//  Created by kevin delord on 05/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class DKRegexTests: XCTestCase {

}

// MARK: - File Extension

extension DKRegexTests {

	func test_ShouldReturnFileExtensionRegex() {
		let regex = DKRegex.fileExtension()
		XCTAssertNotNil(regex)
		XCTAssert(regex.characters.count > 0)
	}

	func test_ShouldVerifyFileExtensionRegex() {
		let str : NSString = "drferG.gt"
		XCTAssert(str.lastOccurance(forPattern: DKRegex.fileExtension()) == ".gt")
	}

	func test_ShouldNotVerifyInvalidString() {
		let str : NSString = "drferG"
		XCTAssert(str.lastOccurance(forPattern: DKRegex.fileExtension()) == nil)
	}

	func test_ShouldNotVerifyEmptyString() {
		let str : NSString = ""
		XCTAssert(str.lastOccurance(forPattern: DKRegex.fileExtension()) == nil)
	}
}

// MARK: - Filename and Extension

extension DKRegexTests {

	func test_ShouldReturnFilenameAndExtensionRegex() {
		let regex = DKRegex.filenameAndExtension();
		XCTAssertNotNil(regex)
		XCTAssert(regex.characters.count > 0)
	}

	func test_ShouldVerifyFilenameAndExtensionRegex() {
		let str : NSString = "drferG.gt"
		XCTAssert(str.lastOccurance(forPattern: DKRegex.filenameAndExtension()) == "drferG.gt")
	}

	func test_ShouldNotVerifyInvalidFilenameString() {
		let str : NSString = "drferG"
		XCTAssert(str.lastOccurance(forPattern: DKRegex.filenameAndExtension()) == nil)
	}

	func test_ShouldNotVerifyEmptyFilenameString() {
		let str : NSString = ""
		XCTAssert(str.lastOccurance(forPattern: DKRegex.filenameAndExtension()) == nil)
	}

	func test_ShouldVerifyOnlyExtensionString() {
		let str : NSString = ".zip"
		XCTAssert(str.lastOccurance(forPattern: DKRegex.filenameAndExtension()) == nil)
	}

	func test_ShouldOnlyReturnOneOccurenceString() {
		let str : NSString = "test.super.zip"
		XCTAssert(str.lastOccurance(forPattern: DKRegex.filenameAndExtension()) == "super.zip")
	}
}
