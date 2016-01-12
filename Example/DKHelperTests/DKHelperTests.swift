//
//  DKHelperTests.swift
//  DKHelperTests
//
//  Created by kevin delord on 03/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class DKHelperTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		let fonts = ["Arial-ItalicMT", "ArialMT"]
		let expected = ["ArialMT", "Arial-ItalicMT"]
		let sorted = fonts.sort {  $0.localizedCaseInsensitiveCompare($1) == NSComparisonResult.OrderedDescending }
		XCTAssertEqual(expected[0], sorted[0], "the array should be sorted properly")
		XCTAssertEqual(expected[1], sorted[1], "the array should be sorted properly")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measureBlock {
//            // Put the code you want to measure the time of here.
//        }
    }

	func test_ShouldGetAnAppVersion() {
		let version = appVersion()
		XCTAssertNotNil(version)
		XCTAssert(version.characters.count > 0)
	}
}

// MARK: - Localization

extension DKHelperTests {

	func test_ShouldReturnLocalizedText() {
		let txt = L("WELCOME_TEXT")
		XCTAssertNotNil(txt)
		XCTAssertEqual(txt, "Awesome Text For Unit Testing")
	}

	func test_ShouldReturnKeyWhenValueNotFound() {
		let txt = L("WELCOME_TEXT_WRONG")
		XCTAssertNotNil(txt)
		XCTAssertEqual(txt, "WELCOME_TEXT_WRONG")
	}
}

// MARK: - Maths

extension DKHelperTests {

	func test_ShouldConvertDegreesToRadian() {
		XCTAssertEqual(Double(round(100000 * degreesToRadians(20)) / 100000), 0.34907)
		XCTAssertEqual(Double(round(100000 * degreesToRadians(-400)) / 100000), -6.98132)
		XCTAssertEqual(Double(round(100000 * degreesToRadians(360)) / 100000), 6.28319)
	}

	func test_ShouldConvertRadianToDegrees() {
		XCTAssertEqual(Double(round(100 * radiansToDegrees(20)) / 100), 1145.92)
		XCTAssertEqual(Double(round(10 * radiansToDegrees(-400)) / 10), -22918.3)
		XCTAssertEqual(Double(round(10 * radiansToDegrees(360)) / 10), 20626.5)
	}

	func test_ShouldTestBothMathFunctionTogether() {
		XCTAssertEqual(radiansToDegrees(degreesToRadians(20)), 20)
		XCTAssertEqual(radiansToDegrees(degreesToRadians(100)), 100)
	}
}

// MARK: - Numbers

extension DKHelperTests {

	func test_ShouldReturnCorrectMinValue() {
		XCTAssertEqual(MINMAX(20, 30, 100), 30)
	}

	func test_ShouldReturnCorrectEqualMinValue() {
		XCTAssertEqual(MINMAX(20, 20, 100), 20)
	}

	func test_ShouldReturnCorrectMaxValue() {
		XCTAssertEqual(MINMAX(200, 30, 100), 100)
	}

	func test_ShouldReturnCorrectEqualMaxValue() {
		XCTAssertEqual(MINMAX(100, 30, 100), 100)
	}

	func test_ShouldReturnCorrectOriginalValue() {
		XCTAssertEqual(MINMAX(20, 10, 100), 20)
	}

	func test_LongCast() {
		XCTAssertEqual(cL(4), 4)
	}

	func test_UnsignedLongCast() {
		XCTAssertEqual(cUL(4), 4)
	}
}

// MARK: - Object verification

extension DKHelperTests {

	// MARK: VALID

	func test_ShouldVerifyValidValue() {
		let dict = ["test":4]
		XCTAssert(VALID(dict, "test"))
	}

	func test_ShouldVerifyNilOnInvalidDict() {
		XCTAssertFalse(VALID(nil, "test"))
	}

	func test_ShouldVerifyNilOnInvalidKey() {
		let dict = ["test":4]
		XCTAssertFalse(VALID(dict, nil))
	}

	func test_ShouldVerifyNilOnNSNullKey() {
		let dict = ["test":4]
		XCTAssertFalse(VALID(dict, NSNull()))
	}

	func test_ShouldVerifyNilOnNSNullValue() {
		let dict = ["test":NSNull()]
		XCTAssertFalse(VALID(dict, "test"))
	}

	// MARK: OBJECT

	func test_ShouldReturnValidValue() {
		let dict = ["test":4]
		XCTAssertEqual(OBJECT(dict, "test") as? Int, 4)
	}

	func test_ShouldReturnNilOnInvalidDict() {
		XCTAssertNil(OBJECT(nil, "test"))
	}

	func test_ShouldReturnNilOnNilKey() {
		let dict = ["test":4]
		XCTAssertNil(OBJECT(dict, nil))
	}

	func test_ShouldReturnNilOnInvalidKey() {
		let dict = ["test":4]
		XCTAssert(OBJECT(dict, 3) == nil)
	}

	func test_ShouldReturnNilOnNSNullKey() {
		let dict = ["test":4]
		XCTAssertNil(OBJECT(dict, NSNull()))
	}

	func test_ShouldReturnNilOnNSNullValue() {
		let dict = ["test":NSNull()]
		XCTAssert(OBJECT(dict, "test") == nil)
	}

	// MARK: OBJECT_FOR_KEYS

	func test_ShouldReturnSecondValidValue() {
		let dict = ["first":["second":4]]
		XCTAssertEqual(OBJECT_FOR_KEYS(dict, "first", "second") as? Int, 4)
	}

	func test_ShouldReturnNilOnInvalidDictForKeys() {
		XCTAssertNil(OBJECT_FOR_KEYS(nil, "first", "second"))
	}

	func test_ShouldReturnNilOnFirstNilKey() {
		let dict = ["first":["second":4]]
		XCTAssertNil(OBJECT_FOR_KEYS(dict, nil, "second"))
	}

	func test_ShouldReturnNilOnSecondNilKey() {
		let dict = ["first":["second":4]]
		XCTAssert(OBJECT_FOR_KEYS(dict, "first", nil) == nil)
	}

	func test_ShouldReturnNilOnSecondInvalidKey() {
		let dict = ["first":["second":4]]
		XCTAssert(OBJECT_FOR_KEYS(dict, "first", "third") == nil)
	}

	func test_ShouldReturnNilOnFirstInvalidKey() {
		let dict = ["first":["second":4]]
		XCTAssert(OBJECT_FOR_KEYS(dict, "third", "first") == nil)
	}

	func test_ShouldReturnNilOnSecondNSNullKey() {
		let dict = ["first":["second":4]]
		XCTAssert(OBJECT_FOR_KEYS(dict, "first", NSNull()) == nil)
	}

	func test_ShouldReturnNilOnSecondNSNullValue() {
		let dict = ["first":["second":NSNull()]]
		XCTAssert(OBJECT_FOR_KEYS(dict, "first", "second") == nil)
	}

	func test_ShouldReturnNilOnFirstNSNullValue() {
		let dict = ["first":NSNull()]
		XCTAssert(OBJECT_FOR_KEYS(dict, "first", "second") == nil)
	}
}

// MARK: - Getters

extension DKHelperTests {

	// MARK: FLOAT

	func test_ShouldReturnFloatValue() {
		let dict = ["test":4.0]
		XCTAssert(GET_FLOAT(dict, "test") == 4.0)
	}

	func test_ShouldReturnFloatZeroOnInvalidDict() {
		XCTAssert(GET_FLOAT(nil, "test") == 0.0)
	}

	func test_ShouldReturnFloatZeroOnInvalidKey() {
		let dict = ["test":4.0]
		XCTAssert(GET_FLOAT(dict, nil) == 0.0)
	}

	// MARK: INT

	func test_ShouldReturnIntValue() {
		let dict = ["test":4.0]
		XCTAssert(GET_INTEGER(dict, "test") == 4)
	}

	func test_ShouldReturnIntZeroOnInvalidDict() {
		XCTAssert(GET_INTEGER(nil, "test") == 0)
	}

	func test_ShouldReturnIntZeroOnInvalidKey() {
		let dict = ["test":4.0]
		XCTAssert(GET_INTEGER(dict, nil) == 0)
	}

	// MARK: NSNUMBER

	func test_ShouldReturnNumberFromDict() {
		let dict = ["test":4.0]
		XCTAssert(GET_NUMBER(dict, "test") == 4)
	}

	func test_ShouldReturnNumberFromStringDict() {
		let dict = ["test":"4"]
		XCTAssert(GET_NUMBER(dict, "test") == 4)
	}

	func test_ShouldReturnNumberFromStringWithCommaDict() {
		let dict = ["test":"4,0"]
		XCTAssert(GET_NUMBER(dict, "test") == nil)
	}

	func test_ShouldReturnNumberFromStringWithPointDict() {
		let dict = ["test":"4.0"]
		XCTAssert(GET_NUMBER(dict, "test") == 4)
	}

	func test_ShouldReturnDecimalNumberFromStringWithPointDict() {
		let dict = ["test":"4.4"]
		XCTAssert(GET_NUMBER(dict, "test") == 4.4)
	}

	func test_ShouldReturnBigDecimalNumberFromStringWithPointDict() {
		let dict = ["test":"1234567.4678"]
		XCTAssert(GET_NUMBER(dict, "test") == 1234567.4678)
	}

	func test_ShouldReturnNilFromInvalidString() {
		let dict = ["test":"abdc"]
		XCTAssert(GET_NUMBER(dict, "test") == nil)
	}

	func test_ShouldReturnNilNumberFromNilDict() {
		XCTAssertNil(GET_NUMBER(nil, "test"))
	}

	// MARK: NSDATE

	func test_ShouldReturnValidDate() {
		let date = NSDate()
		let dict = ["test":date]
		XCTAssert(GET_DATE(dict, "test") === date)
		XCTAssert(GET_DATE(dict, "test") == date)
	}

	func test_ShouldReturnDateFromString() {
		let date = NSDate()
		let dict = ["test":NSString(fromDate: date, format: NSDate.ISO8601StringFormat())]
		XCTAssertEqual(GET_DATE(dict, "test")?.stringValue(), date.stringValue())
	}

	func test_ShouldReturnNilFromInvalidDict() {
		XCTAssert(GET_DATE(nil, "test") == nil)
	}

	func test_ShouldReturnNilFromInvalidKey() {
		let dict = ["test":NSDate()]
		XCTAssert(GET_DATE(dict, nil) == nil)
	}

	func test_ShouldReturnNilFromWrongKey() {
		let date = NSDate()
		let dict = ["test":date]
		XCTAssert(GET_DATE(dict, "second") == nil)
	}

	//MARK: DateFormat

	func test_ShouldReturnValidDateWithFormat() {
		let date = NSDate()
		let dict = ["test":date]
		XCTAssert(GET_DATE_FORMAT(dict, "test", "xyz") === date)
		XCTAssert(GET_DATE_FORMAT(dict, "test", "xyz") == date)
	}

	func test_ShouldReturnDateFromStringWithFormat() {
		let date = NSDate()
		let dict = ["test":NSString(fromDate: date, format: NSDate.ISO8601StringFormat())]
		XCTAssertEqual(GET_DATE_FORMAT(dict, "test", NSDate.ISO8601StringFormat())?.stringValue(), date.stringValue())
	}

	func test_ShouldReturnNilFromInvalidDictWithFormat() {
		XCTAssert(GET_DATE_FORMAT(nil, "test", NSDate.ISO8601StringFormat()) == nil)
	}

	func test_ShouldReturnNilFromInvalidKeyWithFormat() {
		let dict = ["test":NSDate()]
		XCTAssert(GET_DATE_FORMAT(dict, nil, NSDate.ISO8601StringFormat()) == nil)
	}

	func test_ShouldReturnNilFromWrongKeyWithFormat() {
		let date = NSDate()
		let dict = ["test":date]
		XCTAssert(GET_DATE_FORMAT(dict, "second", NSDate.ISO8601StringFormat()) == nil)
	}

	// MARK: NSSTRING

	func test_ShouldReturnValidString() {
		let dict = ["test":"value"]
		XCTAssert(GET_STRING(dict, "test") == "value")
	}

	func test_ShouldReturnNilOnEmptyStringObject() {
		let dict = ["test":""]
		XCTAssert(GET_STRING(dict, "test") == nil)
	}

	func test_ShouldReturnNilStringFromInvalidDict() {
		XCTAssert(GET_STRING(nil, "test") == nil)
	}

	func test_ShouldReturnNilStringFromInvalidKey() {
		let dict = ["test":NSDate()]
		XCTAssert(GET_STRING(dict, nil) == nil)
	}

	func test_ShouldReturnNilStringFromWrongKey() {
		let dict = ["test":NSDate()]
		XCTAssert(GET_STRING(dict, "second") == nil)
	}
}

// TODO:
//
//void DKLog(BOOL verbose, NSString * _Nonnull format, ...);