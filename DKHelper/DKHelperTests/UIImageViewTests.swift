//
//  UIImageViewTests.swift
//  DKHelper
//
//  Created by kevin delord on 09/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class UIImageViewTests: XCTestCase {

	private var currentBundle : NSBundle {
		return NSBundle(forClass: UIImageTests.self)
	}

	func test_ShouldCreateImageViewWithImageNamed() {
		let imgView = UIImageView(imageNamed: "TestImage")
		XCTAssertNotNil(imgView)
	}

	func test_ShouldCreateImageViewWithImageNamedAndFrame() {
		let frame = CGRect(x: 10, y: 10, width: 100, height: 100)
		let imgView = UIImageView(frame:frame, imageNamed: "TestImage")
		XCTAssertNotNil(imgView)
		XCTAssertEqual(imgView.frame, frame)
	}

	func test_ShouldCreateImageViewWithImageAndFrame() {
		let frame = CGRect(x: 10, y: 10, width: 100, height: 100)
		if let img = UIImage(named: "TestImage", inBundle: self.currentBundle, compatibleWithTraitCollection: nil) {
			let imgView = UIImageView(frame:frame, image: img)
			XCTAssertNotNil(imgView)
			XCTAssertEqual(imgView.frame, frame)
			XCTAssertEqual(imgView.image, img)
		} else {
			XCTFail("couldn't create image")
		}
	}
}
