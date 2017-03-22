//
//  UIColorTests.swift
//  DKHelper
//
//  Created by kevin delord on 03/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class UIColorTests: XCTestCase {

	fileprivate struct RGBResults {
		var red : CGFloat = -1
		var green : CGFloat = -1
		var blue : CGFloat = -1
		var alpha : CGFloat = -1
		var wrongRed : CGFloat = -1
		var wrongGreen : CGFloat = -1
		var wrongBlue : CGFloat = -1
		var wrongAlpha : CGFloat = -1
	}

	fileprivate func testRGBColor(_ color: UIColor?, expectedResults: RGBResults) {
		var red : CGFloat = -1
		var green : CGFloat = -1
		var blue : CGFloat = -1
		var alpha : CGFloat = -1

		// Check optional
		XCTAssertNotNil(color)

		color?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

		// expected
		XCTAssertEqual(red, expectedResults.red)
		XCTAssertEqual(green, expectedResults.green)
		XCTAssertEqual(blue, expectedResults.blue)
		XCTAssertEqual(alpha, expectedResults.alpha)
		XCTAssertNotEqual(red, -1)
		XCTAssertNotEqual(green, -1)
		XCTAssertNotEqual(blue, -1)
		XCTAssertNotEqual(alpha, -1)

		// not expected
		XCTAssertNotEqual(red, expectedResults.wrongRed)
		XCTAssertNotEqual(green, expectedResults.wrongGreen)
		XCTAssertNotEqual(blue, expectedResults.wrongBlue)
		XCTAssertNotEqual(alpha, expectedResults.wrongAlpha)
	}
}

// MARK: - Basic Colors With Alpha

extension UIColorTests {

	func test_ShouldCreateRedColorWithAlpha() {

		// red
		let color = UIColor.redColor(withAlpha: 0.5)
		let results = UIColorTests.RGBResults(red: 1, green: 0, blue: 0, alpha: 0.5, wrongRed: 23, wrongGreen: 0.467, wrongBlue: 0.453, wrongAlpha: 0.1)
		self.testRGBColor(color, expectedResults: results)
	}

	func test_ShouldCreateGreenColorWithAlpha() {
		// green
		let color = UIColor.greenColor(withAlpha: 0.01)
		let results = UIColorTests.RGBResults(red: 0, green: 1, blue: 0, alpha: 0.01, wrongRed: 23, wrongGreen: 0.467, wrongBlue: 0.453, wrongAlpha: 0.1)
		self.testRGBColor(color, expectedResults: results)
	}

	func test_ShouldCreateBlueColorWithAlpha() {
		// blue
		let color = UIColor.blueColor(withAlpha: 1)
		let results = UIColorTests.RGBResults(red: 0, green: 0, blue: 1, alpha: 1, wrongRed: 23, wrongGreen: 1, wrongBlue: 0.3, wrongAlpha: 0.5)
		self.testRGBColor(color, expectedResults: results)
	}

	func test_ShouldCreateYellowColorWithAlpha() {
		// yellow
		let color = UIColor.yellowColor(withAlpha: 0.3)
		let results = UIColorTests.RGBResults(red: 1, green: 1, blue: 0, alpha: 0.3, wrongRed: 23, wrongGreen: 0.8, wrongBlue: 0.3, wrongAlpha: 1)
		self.testRGBColor(color, expectedResults: results)
	}
}

// MARK: - Random Color

extension UIColorTests {

	func test_ShouldCreateRandomColor() {

		var red : CGFloat = -1
		var green : CGFloat = -1
		var blue : CGFloat = -1
		var alpha : CGFloat = -1

		let color = UIColor.random()
		color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

		// check random value with generated alpha
		let results = UIColorTests.RGBResults(red: red, green: green, blue: blue, alpha: alpha, wrongRed: -1, wrongGreen: -1, wrongBlue: -1, wrongAlpha: -1)
		self.testRGBColor(color, expectedResults: results)
	}

	func test_RandomColorNotWhite() {
		var red : CGFloat = -1
		var green : CGFloat = -1
		var blue : CGFloat = -1
		var alpha : CGFloat = -1

		let color = UIColor.random()
		color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		XCTAssert(red != 1 && green != 1 && blue != 1)
	}

	func test_RandomColorNotBlack() {
		var red : CGFloat = -1
		var green : CGFloat = -1
		var blue : CGFloat = -1
		var alpha : CGFloat = -1

		let color = UIColor.random()
		color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		XCTAssert((red == 0 && green == 0 && blue == 0) == false)
	}

	func test_ShouldCreateDifferentRandomColors() {

		var red : CGFloat = -1
		var green : CGFloat = -1
		var blue : CGFloat = -1
		var alpha : CGFloat = -1

		// generate first color
		let color = UIColor.random()
		color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

		// try to generate a new random color
		var newRed : CGFloat = -1
		var newGreen : CGFloat = -1
		var newBlue : CGFloat = -1
		var newAlpha : CGFloat = -1

		let newColor = UIColor.random()
		newColor.getRed(&newRed, green: &newGreen, blue: &newBlue, alpha: &newAlpha)

		// check alpha equals to 1 and color not black
		let results = UIColorTests.RGBResults(red: newRed, green: newGreen, blue: newBlue, alpha: newAlpha, wrongRed: red, wrongGreen: green, wrongBlue: blue, wrongAlpha: 0.4)
		self.testRGBColor(newColor, expectedResults: results)

		// make sure both alpha are not identical (except for the alpha)
		XCTAssertNotEqual(color, newColor)
		XCTAssertEqual(alpha, newAlpha)
	}
}

// MARK: - Color From RGB

extension UIColorTests {

	func test_ShouldCreateColorFromRGB() {

		// check valid color
		let results = UIColorTests.RGBResults(red: 1, green: 0.5, blue: 1, alpha: 1, wrongRed: 23, wrongGreen: 0.8, wrongBlue: 0.3, wrongAlpha: 0.4)
		self.testRGBColor(UIColor.r(255, g: 127.5, b: 255), expectedResults: results)
	}

	func test_ShouldCreateColorFromRGBWithNoRed() {

		// check valid color with no red
		let results = UIColorTests.RGBResults(red: 0, green: 0.5, blue: 0.25, alpha: 1, wrongRed: 3, wrongGreen: 8684, wrongBlue: 133, wrongAlpha: 0.4)
		self.testRGBColor(UIColor.r(0, g: 127.5, b: 63.75), expectedResults: results)
	}

	func test_ShouldCreateColorFromInvalidRGB() {
		// check invalid color
		let results = UIColorTests.RGBResults(red: 1, green: 1, blue: 0, alpha: 1, wrongRed: 3, wrongGreen: 8684, wrongBlue: 133, wrongAlpha: 0.4)
		self.testRGBColor(UIColor.r(396, g: 7654, b: -833), expectedResults: results)
	}
}

// MARK: - Color From RGBA

extension UIColorTests {

	func test_ShouldCreateColorFromRGBA() {

		// check valid color without alpha
		let results = UIColorTests.RGBResults(red: 1, green: 0.5, blue: 1, alpha: 1, wrongRed: 23, wrongGreen: 0.8, wrongBlue: 0.3, wrongAlpha: 0.4)
		self.testRGBColor(UIColor.r(255, g: 127.5, b: 255, a: 1), expectedResults: results)
	}

	func test_ShouldCreateColorFromRGBAWithNoRed() {
		// check valid color with no red with alpha
		let results = UIColorTests.RGBResults(red: 0, green: 0.5, blue: 0.25, alpha: 0.45, wrongRed: 3, wrongGreen: 8684, wrongBlue: 133, wrongAlpha: 0.4)
		self.testRGBColor(UIColor.r(0, g: 127.5, b: 63.75, a: 0.45), expectedResults: results)
	}

	func test_ShouldCreateColorFromInvalidRGBA() {
		// check invalid color with invalid alpha
		var results = UIColorTests.RGBResults(red: 1, green: 1, blue: 0, alpha: 0, wrongRed: 3, wrongGreen: 8684, wrongBlue: 133, wrongAlpha: 0.4)
		self.testRGBColor(UIColor.r(396, g: 7654, b: -833, a: -875), expectedResults: results)

		// check invalid color with invalid alpha
		results = UIColorTests.RGBResults(red: 1, green: 1, blue: 0, alpha: 1, wrongRed: 3, wrongGreen: 8684, wrongBlue: 133, wrongAlpha: 0.4)
		self.testRGBColor(UIColor.r(396, g: 7654, b: -833, a: 2), expectedResults: results)
	}
}

// MARK: - Color From HEX String

extension UIColorTests {

	func test_ShouldCreateColorFromHEXString() {

		let results = UIColorTests.RGBResults(red: 1, green: 0, blue: 1, alpha: 1, wrongRed: 3, wrongGreen: 25, wrongBlue: 133, wrongAlpha: 0.4)
		self.testRGBColor(UIColor(fromHexString: "#FF00FF"), expectedResults: results)
	}

	func test_ShouldCreateColorFromHEXStringWithNoSharp() {

		let results = UIColorTests.RGBResults(red: 0, green: 1, blue: 0, alpha: 1, wrongRed: 3, wrongGreen: 25, wrongBlue: 133, wrongAlpha: 0.4)
		self.testRGBColor(UIColor(fromHexString: "00FF00"), expectedResults: results)

	}

	func test_ShouldCreateColorFromEmptyHEXString() {

		XCTAssertNil(UIColor(fromHexString: ""))
	}

	func test_ShouldCreateColorFromInvalidHEXString() {

		XCTAssertNil(UIColor(fromHexString: "zrtyzrty"))
	}
}

// MARK: - Color From HEX String With Alpha

extension UIColorTests {

	func test_ShouldCreateColorFromHEXStringWithAlpha() {

		let results = UIColorTests.RGBResults(red: 1, green: 0, blue: 1, alpha: 0.3, wrongRed: 3, wrongGreen: 25, wrongBlue: 133, wrongAlpha: 0.4)
		self.testRGBColor(UIColor(fromHexString: "#FF00FF", alpha: 0.3), expectedResults: results)
	}

	func test_ShouldCreateColorFromHEXStringWithNoSharpWithAlpha() {

		let results = UIColorTests.RGBResults(red: 0, green: 1, blue: 0, alpha: 1, wrongRed: 3, wrongGreen: 25, wrongBlue: 133, wrongAlpha: 0.4)
		self.testRGBColor(UIColor(fromHexString: "00FF00", alpha: 1), expectedResults: results)
	}

	func test_ShouldCreateColorFromEmptyHEXStringWithinvalidAlpha() {

		XCTAssertNil(UIColor(fromHexString: "", alpha: -1))
	}

	func test_ShouldCreateColorFromInvalidHEXStringWithinvalidAlpha() {

		XCTAssertNil(UIColor(fromHexString: "zrtyzrty", alpha: 124))
	}
}

// MARK: - Fade Color With percentage

extension UIColorTests {

	func test_ShouldCreateFadeColor() {
		let percentage : CGFloat = 0.4
		let fadeColor = UIColor.fade(fromBaseColor: UIColor.black, to: UIColor.white, withPercentage: 0.4)

		var red : CGFloat = -1
		var green : CGFloat = -1
		var blue : CGFloat = -1
		var alpha : CGFloat = -1

		fadeColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

		var results = UIColorTests.RGBResults(red: red, green: green, blue: blue, alpha: alpha, wrongRed: 0, wrongGreen: 0, wrongBlue: 0, wrongAlpha: -1)
		self.testRGBColor(fadeColor, expectedResults: results)

		results = UIColorTests.RGBResults(red: red, green: green, blue: blue, alpha: alpha, wrongRed: 1, wrongGreen: 1, wrongBlue: 1, wrongAlpha: 0.5)
		self.testRGBColor(fadeColor, expectedResults: results)

		// Logic taken from the maths inside the function
		XCTAssertEqual(percentage, red)
		XCTAssertEqual(percentage, green)
		XCTAssertEqual(percentage, blue)
	}
}
