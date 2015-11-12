//
//  UIDeviceTests.swift
//  DKHelper
//
//  Created by kevin delord on 12/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import Foundation

import XCTest
@testable import DKHelper

class UIDeviceTests: XCTestCase {

}

// MARK: - Current Platform

extension UIDeviceTests {

	func test_ShouldReturnCurrentPlatform() {
		let platform = UIDevice.currentPlatform()
		XCTAssert(platform.characters.count > 0)
		print(platform)
	}
}

// MARK: - Current Platform Name

extension UIDeviceTests {

	func test_ShouldReturnCurrentPlatformName() {
		let platform = UIDevice.currentPlatform()
		let platformName = UIDevice.currentPlatformName()
		XCTAssert(platformName.characters.count > 0)
		XCTAssert(platformName != platform)
		print(platformName)
	}

}

// MARK: - Platform Name From String

extension UIDeviceTests {

	func test_ShouldReturnSimulatorForCurrentPlatform() {
		let platformString = UIDevice.currentPlatform()
		let name = UIDevice.platformNameFromString(platformString)
		XCTAssert(name.characters.count > 0)
		XCTAssertEqual(name, "Simulator")
	}

	func test_ShouldCheckAllPlatform() {
		let allPairs = [("AppleTV2,1", "Apple TV 2G"), ("AppleTV3,1", "Apple TV 3G"), ("AppleTV3,2", "Apple TV 3G"), ("AppleTV5,3", "Apple TV 4G"),
			("Watch1,1", "Apple Watch"), ("Watch1,2", "Apple Watch"), ("iPhone1,1", "iPhone"), ("iPhone1,2", "iPhone 3G"), ("iPhone2,1", "iPhone 3GS"),
			("iPhone3,1", "iPhone 4"), ("iPhone3,2", "iPhone 4"), ("iPhone3,3", "iPhone 4 (CDMA)"), ("iPhone4,1", "iPhone 4S"),
			("iPhone5,1", "iPhone 5 (GSM)"), ("iPhone5,2", "iPhone 5 (GSM+CDMA)"), ("iPhone5,3", "iPhone 5C (GSM)"),
			("iPhone5,4", "iPhone 5C (GSM+CDMA)"), ("iPhone6,1", "iPhone 5S (GSM)"), ("iPhone6,2", "iPhone 5S (GSM+CDMA)"),
			("iPhone7,1", "iPhone 6 Plus"), ("iPhone7,2", "iPhone 6"), ("iPhone8,1", "iPhone 6s"), ("iPhone8,2", "iPhone 6s Plus"),
			("iPod1,1", "iPod Touch"), ("iPod2,1", "iPod Touch 2G"), ("iPod3,1", "iPod Touch 3G"), ("iPod4,1", "iPod Touch 4G"),
			("iPod5,1", "iPod Touch 5G"), ("iPod7,1", "iPod Touch 6G"), ("iPad1,1", "iPad"), ("iPad2,1", "iPad 2 (WiFi)"),
			("iPad2,2", "iPad 2 (GSM)"), ("iPad2,3", "iPad 2 (CDMA)"), ("iPad2,4", "iPad 2 (WiFi)"), ("iPad3,1", "iPad 3 (WiFi)"),
			("iPad3,2", "iPad 3 (GSM+CDMA)"), ("iPad3,3", "iPad 3 (GSM)"), ("iPad3,4", "iPad 4 (WiFi)"), ("iPad3,5", "iPad 4 (GSM)"),
			("iPad3,6", "iPad 4 (GSM+CDMA)"), ("iPad4,1", "iPad Air (WiFi)"), ("iPad4,2", "iPad Air (Cellular)"), ("iPad4,3", "iPad Air"),
			("iPad5,3", "iPad Air 2 (WiFi)"), ("iPad5,4", "iPad Air 2 (Cellular)"), ("iPad6,7", "iPad Pro (WiFi)"),
			("iPad6,8", "iPad Pro (Cellular)"), ("iPad2,5", "iPad Mini (WiFi)"), ("iPad2,6", "iPad Mini (GSM)"), ("iPad2,7", "iPad Mini (GSM+CDMA)"),
			("iPad4,4", "iPad Mini 2 (WiFi)"), ("iPad4,5", "iPad Mini 2 (Cellular)"), ("iPad4,6", "iPad Mini 2"), ("iPad4,7", "iPad mini 3 (WiFi)"),
			("iPad4,8", "iPad mini 3 (Cellular)"), ("iPad4,9", "iPad mini 3 (China Model)"), ("iPad5,1", "iPad mini 4 (WiFi)"),
			("iPad5,2", "iPad mini 4 (Cellular)"), ("i386", "Simulator"), ("x86_64", "Simulator")]

		for (key, value) in allPairs {
			let name = UIDevice.platformNameFromString(key)
			XCTAssertEqual(name, value)
		}
	}

	func test_ShouldReturnParamOnUnknownPlatform() {
		let name = UIDevice.platformNameFromString("fake_platform")
		XCTAssertEqual(name, "fake_platform")
	}
}

// MARK: - is Slow Device For Platform

extension UIDeviceTests {

	func test_ShouldRecognizeASlowDevice() {
		XCTAssert(UIDevice.isSlowDeviceForPlatform("iPod1,1") == true)
	}

	func test_ShouldNotRecognizeAFastDevice() {
		XCTAssert(UIDevice.isSlowDeviceForPlatform("iPhone7,1") == false)
	}

	func test_ShouldNotRecognizeAnUnkownDevice() {
		XCTAssert(UIDevice.isSlowDeviceForPlatform("SuperIphone") == false)
	}
}

// MARK: - isSlowDevice

extension UIDeviceTests {

	func test_ShouldRecognizeCurrentSimulatorAsFastDeviceDevice() {
		XCTAssert(UIDevice.currentDevice().isSlowDevice == false)
	}
}

// MARK: - isIPad

extension UIDeviceTests {

	func test_ShouldRecognizeCurrentSimulatorAsNoIPad() {
		XCTAssert(UIDevice.currentDevice().isIPad == false)
	}
}

// MARK: -

extension UIDeviceTests {

}

// MARK: -

extension UIDeviceTests {

}
