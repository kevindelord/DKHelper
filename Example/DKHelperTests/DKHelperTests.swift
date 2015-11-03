//
//  DKHelperTests.swift
//  DKHelperTests
//
//  Created by kevin delord on 03/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class DKHelperTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		let fonts = ["Arial-ItalicMT", "ArialMT"]
		let expected = ["ArialMT", "Arial-ItalicMT"]
		let sorted = fonts.sort {  $0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedDescending }
		XCTAssertEqual(expected[0], sorted[0], "the array should be sorted properly")
		XCTAssertEqual(expected[1], sorted[1], "the array should be sorted properly")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
    }
}
