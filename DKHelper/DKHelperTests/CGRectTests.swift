//
//  CGRectTests.swift
//  DKHelper
//
//  Created by kevin delord on 04/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class CGRectTests: XCTestCase {

	fileprivate func checkFrameValues(frame: CGRect, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
		XCTAssertEqual(frame.height, height)
		XCTAssertEqual(frame.width, width)
		XCTAssertEqual(frame.minY, y)
		XCTAssertEqual(frame.minX, x)
	}
}

// MARK: - CGRectInsideContainer

extension CGRectTests {

	func test_ShouldVerifyRectInsideContainer() {
		let frame = CGRect(x: 10, y: 100, width: 30, height: 30)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		XCTAssert(CGRectInsideContainer(frame, container))
	}

	func test_ShouldVerifyRectInsideSameContainer() {
		let frame = CGRect(x: 0, y: 100, width: 30, height: 30)
		let container = CGRect(x: 0, y: 100, width: 30, height: 30)
		XCTAssert(CGRectInsideContainer(frame, container))
	}

	func test_ShouldNotVerifyRectInsideSmallerContainer() {
		let frame = CGRect(x: 0, y: 0, width: 30, height: 30)
		let container = CGRect(x: 0, y: 0, width: 20, height: 20)
		XCTAssert(CGRectInsideContainer(frame, container) == false)
	}

	func test_ShouldNotVerifyOutsideRectInsideContainer() {
		let frame = CGRect(x: -20, y: 100, width: 30, height: 30)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		XCTAssert(CGRectInsideContainer(frame, container) == false)
	}
}

// MARK: - CGRectSetInsideContainer

extension CGRectTests {

	func test_ShouldSetFrameInsideContainerLeft() {
		var frame = CGRect(x: -20, y: 50, width: 50, height: 50)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: 0, y: 50, width: 50, height: 50)
	}

	func test_ShouldSetFrameInsideContainerRight() {
		var frame = CGRect(x: 190, y: 50, width: 50, height: 50)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: 150, y: 50, width: 50, height: 50)
	}

	func test_ShouldSetFrameInsideContainerBottom() {
		var frame = CGRect(x: 10, y: 180, width: 50, height: 50)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: 10, y: 150, width: 50, height: 50)
	}

	func test_ShouldSetFrameInsideContainerTop() {
		var frame = CGRect(x: 150, y: -50, width: 50, height: 50)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: 150, y: 0, width: 50, height: 50)
	}

	func test_ShouldSetFrameInsideContainerLeftTop() {
		var frame = CGRect(x: -20, y: -20, width: 50, height: 50)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: 0, y: 0, width: 50, height: 50)
	}

	func test_ShouldSetFrameInsideContainerRightBottom() {
		var frame = CGRect(x: 220, y: 220, width: 50, height: 50)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: 150, y: 150, width: 50, height: 50)
	}

	func test_ShouldSetFrameInsideContainerLeftBottom() {
		var frame = CGRect(x: -20, y: 210, width: 50, height: 50)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: 0, y: 150, width: 50, height: 50)
	}

	func test_ShouldSetFrameInsideContainerRightTop() {
		var frame = CGRect(x: 201, y: -100, width: 50, height: 50)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: 150, y: 0, width: 50, height: 50)
	}

	func test_ShouldNotSetFrameInsideContainerAlreadyInside() {
		var frame = CGRect(x: 50, y: 50, width: 50, height: 50)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: 50, y: 50, width: 50, height: 50)
	}

	func test_ShouldSetBiggerFrameInsideContainerBottomLeft() {
		var frame = CGRect(x: 20, y: 20, width: 500, height: 500)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: -300, y: -300, width: 500, height: 500)
	}

	func test_ShouldSetBiggerFrameInsideContainerBottom() {
		var frame = CGRect(x: -50, y: -50, width: 500, height: 500)
		let container = CGRect(x: 0, y: 0, width: 200, height: 200)
		frame = CGRectSetInsideContainer(frame, container)
		self.checkFrameValues(frame: frame, x: -300, y: -300, width: 500, height: 500)
	}
}

// MARK: - CGRect Set

extension CGRectTests {

	func test_ShouldSetWidth() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let newFrame = CGRectSetWidth(frame, 200)
		self.checkFrameValues(frame: newFrame, x: 0, y: 0, width: 200, height: 100)
	}

	func test_ShouldSetHeight() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let newFrame = CGRectSetHeight(frame, 200)
		self.checkFrameValues(frame: newFrame, x: 0, y: 0, width: 100, height: 200)
	}

	func test_ShouldSetX() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let newFrame = CGRectSetX(frame, 200)
		self.checkFrameValues(frame: newFrame, x: 200, y: 0, width: 100, height: 100)
	}

	func test_ShouldSetY() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let newFrame = CGRectSetY(frame, 200)
		self.checkFrameValues(frame: newFrame, x: 0, y: 200, width: 100, height: 100)
	}

	func test_ShouldSetOrigin() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let newFrame = CGRectSetOrigin(frame, CGPoint(x: 10, y: 10))
		self.checkFrameValues(frame: newFrame, x: 10, y: 10, width: 100, height: 100)
	}

	func test_ShouldSetSize() {
		let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
		let newFrame = CGRectSetSize(frame, CGSize(width: 200, height: 200))
		self.checkFrameValues(frame: newFrame, x: 0, y: 0, width: 200, height: 200)
	}
}
