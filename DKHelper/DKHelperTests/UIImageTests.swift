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

	fileprivate var currentBundle : Bundle {
		return Bundle(for: UIImageTests.self)
	}
}

// MARK: - Scale Image To Size

extension UIImageTests {

	func test_ShouldCreateANewImageObjectThatFitASize() {
		if let img = UIImage(named: "TestImage", in: self.currentBundle, compatibleWith: nil) {
			XCTAssertNotNil(img)
			let newImage = UIImage.scale(img, size: CGSize(width: 100, height: 200))
			XCTAssertNotNil(newImage)
			XCTAssertEqual(newImage?.size.width, 100)
			XCTAssertEqual(newImage?.size.height, 200)
		} else {
			XCTAssert(false)
		}
	}
}

// MARK: - Resize Image to Size

extension UIImageTests {

	func test_ShouldResizeExistingImageToNewSize() {
		let img = UIImage(named: "TestImage", in: self.currentBundle, compatibleWith: nil)
		XCTAssertNotNil(img)
		let newImage = img?.resizedImage(to: CGSize(width: 50, height: 50))
		XCTAssertNotNil(newImage)
		XCTAssertEqual(newImage?.size.width, 35)
		XCTAssertEqual(newImage?.size.height, 50)
	}
}

// MARK: - Resize Image to Screen Size

extension UIImageTests {

	func test_ShouldResizeExistingImageToScreenSize() {
		if let img = UIImage(named: "TestImage", in: self.currentBundle, compatibleWith: nil) {
			let finalSize = CGSizeAdjustToCGSize(img.size, UIScreen.main.bounds.size)
			XCTAssertNotNil(img)
			let newImage = img.resizedImageToScreenSize()
			XCTAssertNotNil(newImage)
			XCTAssertEqual(round(newImage?.size.width ?? 0), round(finalSize.width))
			XCTAssertEqual(round(newImage?.size.height ?? 0), round(finalSize.height))
		} else {
			XCTAssert(false)
		}
	}
}

// MARK: - Calculate Image Size In Pixels

extension UIImageTests {

	fileprivate static func imageWithSize(_ size: CGSize, scale: CGFloat) -> UIImage {
		UIGraphicsBeginImageContextWithOptions(size, true, scale)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image!
	}

	func test_ShouldCalculateImageSizeInPixels() {

		enum ImageSizeInPixelsTestData {
			case oneX
			case twoX
			case threeX

			static func imageSize() -> CGSize {
				return CGSize(width: 320, height: 240)
			}

			func image() -> UIImage {
				let imageSize = ImageSizeInPixelsTestData.imageSize()
				return UIImageTests.imageWithSize(imageSize, scale: self.scaleFactor())
			}

			func scaleFactor() -> CGFloat {
				switch self {
				case .oneX:		return 1.0
				case .twoX:		return 2.0
				case .threeX:	return 3.0
				}
			}

			static func allValues() -> [ImageSizeInPixelsTestData] {
				return [oneX, twoX, threeX]
			}
		}

		for testData in ImageSizeInPixelsTestData.allValues() {
			let expectedSize = CGSizeMultiply(ImageSizeInPixelsTestData.imageSize(), testData.scaleFactor())
			XCTAssertEqual(testData.image().sizeInPixel(), expectedSize)
		}
	}
}
