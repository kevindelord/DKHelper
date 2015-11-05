//
//  CGSizeTests.swift
//  DKHelper
//
//  Created by kevin delord on 05/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class CGSizeTests: XCTestCase {

	private func checkSizeValues(size: CGSize, width: CGFloat, height: CGFloat) {
		XCTAssertEqual(size.height, height)
		XCTAssertEqual(size.width, width)
	}
}

// MARK: - CGSizeFitToCGRect

extension CGSizeTests {

	func test_ShouldFitToRectSquare() {
		let size = CGSize(width: 200, height: 200)
		let container = CGSize(width: 100, height: 100)
		self.checkSizeValues(CGSizeFitToCGSize(size, container), width: 100, height: 100)
	}

	func test_ShouldFitToRectWidth() {
		let size = CGSize(width: 100, height: 200)
		let container = CGSize(width: 60, height: 80)
		self.checkSizeValues(CGSizeFitToCGSize(size, container), width:  40, height: 80)
	}

	func test_ShouldFitToRectSameWidth() {
		let size = CGSize(width: 60, height: 200)
		let container = CGSize(width: 60, height: 80)
		self.checkSizeValues(CGSizeFitToCGSize(size, container), width: 24, height: 80)
	}

	func test_ShouldFitToRectHeight() {
		let size = CGSize(width: 200, height: 200)
		let container = CGSize(width: 100, height: 80)
		self.checkSizeValues(CGSizeFitToCGSize(size, container), width: 80, height: 80)
	}

	func test_ShouldFitToRectSameHeight() {
		let size = CGSize(width: 200, height: 80)
		let container = CGSize(width: 100, height: 80)
		self.checkSizeValues(CGSizeFitToCGSize(size, container), width: 100, height: 40)
	}

	func test_ShouldNotFitToRectSmallerSize() {
		let size = CGSize(width: 20, height: 20)
		let container = CGSize(width: 100, height: 100)
		self.checkSizeValues(CGSizeFitToCGSize(size, container), width: 20, height: 20)
	}

	func test_ShouldFitToDifferentRatio() {
		let size = CGSize(width: 20, height: 200)
		let container = CGSize(width: 100, height: 80)
		self.checkSizeValues(CGSizeFitToCGSize(size, container), width: 8, height: 80)
	}
}

// MARK: - CGSizeAdjustToCGSize

extension CGSizeTests {

	func test_ShouldAdjustToSmallerRectSquare() {
		let size = CGSize(width: 200, height: 200)
		let container = CGSize(width: 100, height: 100)
		let fitSize = CGSizeAdjustToCGSize(size, container)
		XCTAssertEqual(fitSize.width, 100)
		XCTAssertEqual(fitSize.height, 100)
	}

	func test_ShouldAdjustToBiggerRectSquare() {
		let size = CGSize(width: 200, height: 200)
		let container = CGSize(width: 1000, height: 1000)
		let fitSize = CGSizeAdjustToCGSize(size, container)
		XCTAssertEqual(fitSize.width, 1000)
		XCTAssertEqual(fitSize.height, 1000)
	}

	func test_ShouldAdjustToSameRatio() {
		let size = CGSize(width: 100, height: 200)
		let container = CGSize(width: 400, height: 800)
		let fitSize = CGSizeAdjustToCGSize(size, container)
		XCTAssertEqual(fitSize.width, 400)
		XCTAssertEqual(fitSize.height, 800)
	}

	func test_ShouldAdjustToDifferentRatio() {
		let size = CGSize(width: 20, height: 200)
		let container = CGSize(width: 100, height: 80)
		let fitSize = CGSizeAdjustToCGSize(size, container)
		XCTAssertEqual(fitSize.width, 8)
		XCTAssertEqual(fitSize.height, 80)
	}

	func test_ShouldAdjustToRectSmallerRatio() {
		let size = CGSize(width: 200, height: 200)
		let container = CGSize(width: 210, height: 10)
		let fitSize = CGSizeAdjustToCGSize(size, container)
		XCTAssertEqual(fitSize.width, 10)
		XCTAssertEqual(fitSize.height, 10)
	}
}
