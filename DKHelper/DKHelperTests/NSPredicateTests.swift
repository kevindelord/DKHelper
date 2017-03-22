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
		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == false)
		XCTAssert(predicate.evaluate(with: ")-") == false)

		predicate = predicate.or(nil)

		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == false)
		XCTAssert(predicate.evaluate(with: ")-") == false)
	}

	func test_ShouldReturnNewORPredicate() {
		var predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == false)
		XCTAssert(predicate.evaluate(with: ")-") == false)

		predicate = predicate.or(NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z()-_]+"))

		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == true)
		XCTAssert(predicate.evaluate(with: ")-") == true)
	}
}

// MARK: - OR FUNCTION

extension NSPredicateTests {

	func test_ShouldReturnNilORFunctionhasTwoNilParameters() {
		XCTAssertNil(OR_PREDICATE(nil, nil))
	}

	func test_ShouldReturnORPredicateIfFirstParameterIsNil() {
		let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == false)
		XCTAssert(predicate.evaluate(with: ")-") == false)

		if let orPredicate = OR_PREDICATE(nil, predicate) {
			XCTAssert(orPredicate.evaluate(with: "YTFU") == true)
			XCTAssert(orPredicate.evaluate(with: "YTFU)-") == false)
			XCTAssert(orPredicate.evaluate(with: ")-") == false)
		} else {
			XCTFail("valid predicate should have been returned")
		}
	}

	func test_ShouldReturnORPredicateIfSecondParameterIsNil() {
		let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == false)
		XCTAssert(predicate.evaluate(with: ")-") == false)

		if let orPredicate = OR_PREDICATE(predicate, nil) {
			XCTAssert(orPredicate.evaluate(with: "YTFU") == true)
			XCTAssert(orPredicate.evaluate(with: "YTFU)-") == false)
			XCTAssert(orPredicate.evaluate(with: ")-") == false)
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
		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == false)
		XCTAssert(predicate.evaluate(with: ")-") == false)

		if let andPredicate = AND_PREDICATE(nil, predicate) {
			XCTAssert(andPredicate.evaluate(with: "YTFU") == true)
			XCTAssert(andPredicate.evaluate(with: "YTFU)-") == false)
			XCTAssert(andPredicate.evaluate(with: ")-") == false)
		} else {
			XCTFail("valid predicate should have been returned")
		}
	}

	func test_ShouldReturnANDPredicateIfSecondParameterIsNil() {
		let predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == false)
		XCTAssert(predicate.evaluate(with: ")-") == false)

		if let andPredicate = AND_PREDICATE(predicate, nil) {
			XCTAssert(andPredicate.evaluate(with: "YTFU") == true)
			XCTAssert(andPredicate.evaluate(with: "YTFU)-") == false)
			XCTAssert(andPredicate.evaluate(with: ")-") == false)
		} else {
			XCTFail("valid predicate should have been returned")
		}
	}
}

// MARK: - AND

extension NSPredicateTests {

	func test_ShouldReturnSelfPredicateIfANDParameterIsNil() {
		var predicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z]+")
		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == false)
		XCTAssert(predicate.evaluate(with: ")-") == false)

		predicate = predicate.and(nil)

		XCTAssert(predicate.evaluate(with: "YTFU") == true)
		XCTAssert(predicate.evaluate(with: "YTFU)-") == false)
		XCTAssert(predicate.evaluate(with: ")-") == false)
	}

	func test_ShouldValidateNewANDPredicate() {
		let dict = ["attributeName": 4]
		var a = NSPredicate(format: "attributeName in %@", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
		let b = NSPredicate(format: "attributeName > 3")
		XCTAssert(a.evaluate(with: dict) == true)
		XCTAssert(b.evaluate(with: dict) == true)
		a = a.and(b)
		XCTAssert(a.evaluate(with: dict) == true)
	}

	func test_ShouldNotValidateNewANDPredicate() {
		let dict = ["attributeName": 2]
		var a = NSPredicate(format: "attributeName in %@", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
		let b = NSPredicate(format: "attributeName > 3")
		XCTAssert(a.evaluate(with: dict) == true)
		XCTAssert(b.evaluate(with: dict) == false)
		a = a.and(b)
		XCTAssert(a.evaluate(with: dict) == false)
	}
}
