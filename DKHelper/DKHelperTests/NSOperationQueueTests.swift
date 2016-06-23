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

	/**
	Verifies the operation gets executed
	*/
	func test_addOperationWithBlockTimeoutTimeoutBlockShouldSucceed() {

		weak var expectation = self.expectationWithDescription("addOperationWithBlock")

		self.operationQueue?.addOperationWithBlock({ (operation: NSOperation?) in
			XCTAssertNotNil(operation)
			expectation?.fulfill()
		}, timeout: 1.0, timeoutBlock: {
			XCTFail()
			expectation?.fulfill()
		})

		self.waitForExpectationsWithTimeout(0.5, handler: nil)
	}

	/**
	Verifies the timeout block gets called when an operation exceeds the desired timeout
	*/
	func test_addOperationWithBlockTimeoutTimeoutBlockShouldFail() {

		weak var expectation = self.expectationWithDescription("addOperationWithBlock timeout")

		self.operationQueue?.addOperationWithBlock({ (operation: NSOperation?) in
			// simulate an operation that takes 2 seconds
			sleep(2)

			// fail since the timeout for the operation is set to 0.1 seconds
			XCTFail()
			expectation?.fulfill()
		}, timeout: 0.1, timeoutBlock: {
			XCTAssert(true)
			expectation?.fulfill()
		})

		self.waitForExpectationsWithTimeout(0.5, handler: nil)
	}
}