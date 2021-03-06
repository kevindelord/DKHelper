//
//  NSNumberTests.swift
//  DKHelper
//
//  Created by kevin delord on 05/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class NSNumberTests: XCTestCase {

	func test_ShouldAddCurrencyToNumber() {
		let nbr : NSNumber = 400
		if (Locale.current.identifier == "en_US") {
			XCTAssertEqual(nbr.currencyStringValue(), "$400.00")
		} else if (Locale.current.identifier.hasPrefix("en") == true) {
			XCTAssertEqual(nbr.currencyStringValue(), "€400,00")
		} else {
			XCTAssertEqual(nbr.currencyStringValue(), "400,00 €")
		}
	}
}
