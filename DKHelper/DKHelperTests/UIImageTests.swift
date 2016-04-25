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

	private var currentBundle : NSBundle {
		return NSBundle(forClass: UIImageTests.self)
	}
}

// MARK: - Scale Image To Size

extension UIImageTests {

	func test_ShouldCreateANewImageObjectThatFitASize() {
		if let img = UIImage(named: "TestImage", inBundle: self.currentBundle, compatibleWithTraitCollection: nil) {
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
		let img = UIImage(named: "TestImage", inBundle: self.currentBundle, compatibleWithTraitCollection: nil)
		XCTAssertNotNil(img)
		let newImage = img?.resizedImageToSize(CGSize(width: 50, height: 50))
		XCTAssertNotNil(newImage)
		XCTAssertEqual(newImage?.size.width, 35)
		XCTAssertEqual(newImage?.size.height, 50)
	}
}

// MARK: - Resize Image to Screen Size

extension UIImageTests {

	func test_ShouldResizeExistingImageToScreenSize() {
		if let img = UIImage(named: "TestImage", inBundle: self.currentBundle, compatibleWithTraitCollection: nil) {
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

// MARK: - Calculate Image Size In Pixels

extension UIImageTests {

	private static func imageWithSize(size: CGSize, scale: CGFloat) -> UIImage {
		UIGraphicsBeginImageContextWithOptions(size, true, scale)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}

	func test_ShouldCalculateImageSizeInPixels() {

		enum ImageSizeInPixelsTestData {
			case OneX
			case TwoX
			case ThreeX

			static func imageSize() -> CGSize {
				return CGSize(width: 320, height: 240)
			}

			func image() -> UIImage {
				let imageSize = ImageSizeInPixelsTestData.imageSize()
				return UIImageTests.imageWithSize(imageSize, scale: self.scaleFactor())
			}

			func scaleFactor() -> CGFloat {
				switch self {
				case OneX:		return 1.0
				case TwoX:		return 2.0
				case ThreeX:	return 3.0
				}
			}

			static func allValues() -> [ImageSizeInPixelsTestData] {
				return [OneX, TwoX, ThreeX]
			}
		}

		for testData in ImageSizeInPixelsTestData.allValues() {
			let expectedSize = CGSizeMultiply(ImageSizeInPixelsTestData.imageSize(), testData.scaleFactor())
			XCTAssertEqual(testData.image().sizeInPixel(), expectedSize)
		}
	}
}
