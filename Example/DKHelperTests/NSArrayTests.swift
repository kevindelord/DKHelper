//
//  NSArrayTests.swift
//  DKHelper
//
//  Created by kevin delord on 05/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class NSArrayTests: XCTestCase {

	func test_ShouldReturnImageFileExtensions() {
		let array = NSArray.imageFileExtensions()
		XCTAssertNotNil(array)
		XCTAssert(array.count == 7)
	}

	func test_ShouldReturnAudioFileExtensions() {
		let array = NSArray.audioFileExtensions()
		XCTAssertNotNil(array)
		XCTAssert(array.count == 7)
	}

	func test_ShouldReturnVideoFileExtensions() {
		let array = NSArray.videoFileExtensions()
		XCTAssertNotNil(array)
		XCTAssert(array.count == 8)
	}
}
