//
//  UIScreenTests.swift
//  DKHelper
//
//  Created by kevin delord on 09/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class UIScreenTests: XCTestCase {

	func test_ShouldHaveAFunctionForTheCurrentScreenSize() {
		var checkScreen = false
		checkScreen = (checkScreen || UIScreen.is35InchScreen() == true)
		checkScreen = (checkScreen || UIScreen.is4InchScreen() == true)
		checkScreen = (checkScreen || UIScreen.is47InchScreen() == true)
		checkScreen = (checkScreen || UIScreen.is55InchScreen() == true)
		XCTAssert(checkScreen == true)
	}
}
