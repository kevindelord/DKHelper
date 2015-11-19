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

}

// MARK: - add Operation With Block Timeout Timeout Block

extension NSOperationQueueTests {

	func test_addOperationWithBlock() {

		let operationQueue = NSOperationQueue()

		operationQueue.addOperationWithBlock({ (operation) in
			XCTAssertNotNil(operation)
			}, timeout: 1.0, timeoutBlock: {
				XCTFail()
		})

		operationQueue.addOperationWithBlock({ (operation) in
			NSThread.sleepForTimeInterval(2.0)
			XCTFail()
			}, timeout: 1.0, timeoutBlock: {
				XCTAssert(true)
		})
	}
}