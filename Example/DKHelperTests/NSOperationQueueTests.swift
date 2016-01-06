//
//  NSOperationQueueTests.swift
//  DKHelper
//
//  Created by Pierre Rothmaler on 19/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class NSOperationQueueTests: XCTestCase {

	var operationQueue : NSOperationQueue?

}

// MARK: - add Operation With Block Timeout Timeout Block

extension NSOperationQueueTests {

	override func setUp() {
		self.operationQueue = NSOperationQueue()
	}

	func test_objectCreation() {

		XCTAssertNil(self.operationQueue?.addOperationWithBlock(nil, timeout: 0.1, timeoutBlock: {}))
		XCTAssertNil(self.operationQueue?.addOperationWithBlock({ (operation) in }, timeout: 0.1, timeoutBlock: nil))
		XCTAssertNotNil(self.operationQueue?.addOperationWithBlock({ (operation) in }, timeout: 0.1, timeoutBlock: {}))
	}

	func test_addOperationWithBlockTimeoutTimeoutBlock() {

		self.operationQueue?.addOperationWithBlock({ (operation) in
			XCTAssertNotNil(operation)
			}, timeout: 1.0, timeoutBlock: {
				XCTFail()
		})

		weak var failExpectation = self.expectationWithDescription("timeout")

		self.operationQueue?.addOperationWithBlock({ (operation) in
			NSThread.sleepForTimeInterval(2.0)
			XCTFail()
			failExpectation?.fulfill()
			}, timeout: 0.1, timeoutBlock: {
				XCTAssert(true)
				failExpectation?.fulfill()
		})

		self.waitForExpectationsWithTimeout(0.5) { (error) -> Void in }
	}
}