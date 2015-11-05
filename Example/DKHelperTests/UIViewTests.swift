//
//  UIViewTests.swift
//  DKHelper
//
//  Created by kevin delord on 05/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class UIViewTests: XCTestCase {

}

// MARK: - Frame Getter

extension UIViewTests {

	func test_ShouldReturnWidth() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		XCTAssertEqual(view.frameWidth(), 200)
	}

	func test_ShouldReturnHeight() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		XCTAssertEqual(view.frameHeight(), 200)
	}

	func test_ShouldReturnX() {
		let view = UIView(frame: CGRect(x: 10, y: 0, width: 200, height: 200))
		XCTAssertEqual(view.frameX(), 10)
	}

	func test_ShouldReturnY() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		XCTAssertEqual(view.frameY(), -20)
	}

	func test_ShouldReturnOrigin() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		XCTAssertEqual(view.frameOrigin().x, 10)
		XCTAssertEqual(view.frameOrigin().y, -20)
	}

	func test_ShouldReturnSize() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		XCTAssertEqual(view.frameSize().width, 200)
		XCTAssertEqual(view.frameSize().height, 200)
	}
}

// MARK: - Frame Setter

extension UIViewTests {

	func test_ShouldSetWidth() {
		var view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		view.frameWidth = 100
		XCTAssertEqual(view.frameWidth(), 200)
	}

	func test_ShouldSetHeight() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		XCTAssertEqual(view.frameHeight(), 200)
	}

	func test_ShouldSetX() {
		let view = UIView(frame: CGRect(x: 10, y: 0, width: 200, height: 200))
		XCTAssertEqual(view.frameX(), 10)
	}

	func test_ShouldSetY() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		XCTAssertEqual(view.frameY(), -20)
	}

	func test_ShouldSetOrigin() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		XCTAssertEqual(view.frameOrigin().x, 10)
		XCTAssertEqual(view.frameOrigin().y, -20)
	}

	func test_ShouldSetSize() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		XCTAssertEqual(view.frameSize().width, 200)
		XCTAssertEqual(view.frameSize().height, 200)
	}
}
