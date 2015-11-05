//
//  UIImageTests.swift
//  DKHelper
//
//  Created by kevin delord on 05/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class UIImageTests: XCTestCase {

}

// MARK: - Scale Image To Size

extension UIImageTests {

	func test_ShouldCreateANewImageObjectThatFitASize() {
		if let img = UIImage(named: "TestImage") {
			XCTAssertNotNil(img)
			let newImage = UIImage.scaleImage(img, size: CGSize(width: 100, height: 200))
			XCTAssertNotNil(newImage)
			XCTAssertEqual(newImage.size.width, 100)
			XCTAssertEqual(newImage.size.height, 200)
		} else {
			XCTAssert(false)
		}
	}
}

// MARK: - Resize Image to Size

extension UIImageTests {

	func test_ShouldResizeExistingImageToNewSize() {
		let img = UIImage(named: "TestImage")
		XCTAssertNotNil(img)
		let newImage = img?.resizedImageToSize(CGSize(width: 50, height: 50))
		XCTAssertNotNil(newImage)
		XCTAssertEqual(newImage?.size.width, 35)
		XCTAssertEqual(newImage?.size.height, 50)
	}
}

// MARK: - Reisze Image to Screen Size

extension UIImageTests {

	func test_ShouldResizeExistingImageToScreenSize() {
		if let img = UIImage(named: "TestImage") {
			let finalSize = CGSizeAdjustToCGSize(img.size, UIScreen.mainScreen().bounds.size)
			XCTAssertNotNil(img)
			let newImage = img.resizedImageToScreenSize()
			XCTAssertNotNil(newImage)
			XCTAssertEqual(newImage?.size.width, finalSize.width)
			XCTAssertEqual(newImage?.size.height, finalSize.height)
		} else {
			XCTAssert(false)
		}
	}
}
