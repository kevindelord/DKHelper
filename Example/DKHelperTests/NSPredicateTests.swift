//
//  NSPredicateTests.swift
//  DKHelper
//
//  Created by kevin delord on 02/12/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class NSPredicateTests: XCTestCase {

}

// MARK: - OR

extension NSPredicateTests {

	func test_ShouldReturnSelfPredicateIfORParameterIsNil() {
		var predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == false)
		XCTAssert(predicate.evaluateWithObject(")-") == false)

		predicate = predicate.OR(nil)

		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == false)
		XCTAssert(predicate.evaluateWithObject(")-") == false)
	}

	func test_ShouldReturnNewORPredicate() {
		var predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == false)
		XCTAssert(predicate.evaluateWithObject(")-") == false)

		predicate = predicate.OR(NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z()-_]+"))

		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == true)
		XCTAssert(predicate.evaluateWithObject(")-") == true)
	}
}

// MARK: - OR FUNCTION

extension NSPredicateTests {

	func test_ShouldReturnNilORFunctionhasTwoNilParameters() {
		XCTAssertNil(OR_PREDICATE(nil, nil))
	}

	func test_ShouldReturnORPredicateIfFirstParameterIsNil() {
		let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == false)
		XCTAssert(predicate.evaluateWithObject(")-") == false)

		if let orPredicate = OR_PREDICATE(nil, predicate) {
			XCTAssert(orPredicate.evaluateWithObject("YTFU") == true)
			XCTAssert(orPredicate.evaluateWithObject("YTFU)-") == false)
			XCTAssert(orPredicate.evaluateWithObject(")-") == false)
		} else {
			XCTFail("valid predicate should have been returned")
		}
	}

	func test_ShouldReturnORPredicateIfSecondParameterIsNil() {
		let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == false)
		XCTAssert(predicate.evaluateWithObject(")-") == false)

		if let orPredicate = OR_PREDICATE(predicate, nil) {
			XCTAssert(orPredicate.evaluateWithObject("YTFU") == true)
			XCTAssert(orPredicate.evaluateWithObject("YTFU)-") == false)
			XCTAssert(orPredicate.evaluateWithObject(")-") == false)
		} else {
			XCTFail("valid predicate should have been returned")
		}
	}
}

// MARK: - AND FUNCTION

extension NSPredicateTests {

	func test_ShouldReturnNilANDFunctionhasTwoNilParameters() {
		XCTAssertNil(AND_PREDICATE(nil, nil))
	}

	func test_ShouldReturnANDPredicateIfFirstParameterIsNil() {
		let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == false)
		XCTAssert(predicate.evaluateWithObject(")-") == false)

		if let andPredicate = AND_PREDICATE(nil, predicate) {
			XCTAssert(andPredicate.evaluateWithObject("YTFU") == true)
			XCTAssert(andPredicate.evaluateWithObject("YTFU)-") == false)
			XCTAssert(andPredicate.evaluateWithObject(")-") == false)
		} else {
			XCTFail("valid predicate should have been returned")
		}
	}

	func test_ShouldReturnANDPredicateIfSecondParameterIsNil() {
		let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == false)
		XCTAssert(predicate.evaluateWithObject(")-") == false)

		if let andPredicate = AND_PREDICATE(predicate, nil) {
			XCTAssert(andPredicate.evaluateWithObject("YTFU") == true)
			XCTAssert(andPredicate.evaluateWithObject("YTFU)-") == false)
			XCTAssert(andPredicate.evaluateWithObject(")-") == false)
		} else {
			XCTFail("valid predicate should have been returned")
		}
	}
}

// MARK: - AND

extension NSPredicateTests {

	func test_ShouldReturnSelfPredicateIfANDParameterIsNil() {
		var predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == false)
		XCTAssert(predicate.evaluateWithObject(")-") == false)

		predicate = predicate.AND(nil)

		XCTAssert(predicate.evaluateWithObject("YTFU") == true)
		XCTAssert(predicate.evaluateWithObject("YTFU)-") == false)
		XCTAssert(predicate.evaluateWithObject(")-") == false)
	}

	func test_ShouldValidateNewANDPredicate() {
		let dict = ["attributeName": 4]
		var a = NSPredicate(format: "attributeName in %@", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
		let b = NSPredicate(format: "attributeName > 3")
		XCTAssert(a.evaluateWithObject(dict) == true)
		XCTAssert(b.evaluateWithObject(dict) == true)
		a = a.AND(b)
		XCTAssert(a.evaluateWithObject(dict) == true)
	}

	func test_ShouldNotValidateNewANDPredicate() {
		let dict = ["attributeName": 2]
		var a = NSPredicate(format: "attributeName in %@", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
		let b = NSPredicate(format: "attributeName > 3")
		XCTAssert(a.evaluateWithObject(dict) == true)
		XCTAssert(b.evaluateWithObject(dict) == false)
		a = a.AND(b)
		XCTAssert(a.evaluateWithObject(dict) == false)
	}
}
