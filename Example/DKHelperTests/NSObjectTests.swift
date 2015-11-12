//
//  NSObjectTests.swift
//  DKHelper
//
//  Created by kevin delord on 10/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class NSObjectTests: XCTestCase {

}

// MARK: - Perform Block After Delay

extension NSObjectTests {

	func test_ShouldPerformBlockAfterDelay() {
		let startDate = NSDate()
		let expectation = expectationWithDescription("execute block after delay")
		self.performBlockAfterDelay(2) {
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(2) == true)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(1) == true)
			XCTAssert(startDate.isOlderOrEqualThanMinuteInterval(2) == false)
			expectation.fulfill()
		}
		waitForExpectationsWithTimeout(5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldNotPerformNilBlockAfterDelay() {
		let expectation = expectationWithDescription("should not crash")
		self.performBlockAfterDelay(2, block: nil)
		expectation.fulfill()
		waitForExpectationsWithTimeout(5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerforlBlockAfterInvalidDelay() {
		let startDate = NSDate()
		let expectation = expectationWithDescription("execute block after delay")
		self.performBlockAfterDelay(-2) {
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(2) == false)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(1) == false)
			XCTAssert(startDate.isOlderOrEqualThanMinuteInterval(2) == false)
			XCTAssert(startDate.stringValue() == NSDate().stringValue())
			expectation.fulfill()
		}
		waitForExpectationsWithTimeout(5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerforlBlockAfterZeroDelay() {
		let startDate = NSDate()
		let expectation = expectationWithDescription("execute block after delay")
		self.performBlockAfterDelay(0) {
			XCTAssert(startDate.stringValue() == NSDate().stringValue())
			expectation.fulfill()
		}
		waitForExpectationsWithTimeout(5) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}

// MARK: - Perform Block In Background

extension NSObjectTests {

	func test_ShouldPerformBlockInBackground() {
		let expectation = expectationWithDescription("execute block in background")
		self.performBlockInBackground() {
			XCTAssert(NSThread.isMainThread() == false)
			expectation.fulfill()
		}
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldNotPerformNilBlockInBackground() {
		let expectation = expectationWithDescription("should not crash")
		self.performBlockInBackground(nil)
		expectation.fulfill()
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}

// MARK: - Perform Block In Background With Completion Block

extension NSObjectTests {

	func test_ShouldPerformBlockInBackgroundWithCompletion() {
		// backgroundBlock: ON
		// completionBlock: ON
		let expectation = expectationWithDescription("execute block in background")
		self.performBlockInBackground({ () -> Void in
			XCTAssert(NSThread.isMainThread() == false)

			}) { () -> Void in
				XCTAssert(NSThread.isMainThread() == true)
				expectation.fulfill()
		}
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBackroundBlockBeforeCompletionBlock() {
		// backgroundBlock: ON
		// completionBlock: ON
		let expectation = expectationWithDescription("execute block in background")
		var count = 0
		self.performBlockInBackground({ () -> Void in
			XCTAssert(NSThread.isMainThread() == false)
			XCTAssert(count == 0)
			count += 1

			}) { () -> Void in
				XCTAssert(NSThread.isMainThread() == true)
				XCTAssert(count == 1)
				expectation.fulfill()
		}
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformNilBlockInBackgroundWithCompletion() {
		// backgroundBlock: OFF
		// completionBlock: ON
		let expectation = expectationWithDescription("should not crash")
		self.performBlockInBackground(nil) { () -> Void in
			XCTAssert(NSThread.isMainThread() == true)
			expectation.fulfill()
		}
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockInBackgroundWithNilCompletion() {
		// backgroundBlock: ON
		// completionBlock: OFF
		let expectation = expectationWithDescription("should not crash")
		self.performBlockInBackground({ () -> Void in
			XCTAssert(NSThread.isMainThread() == false)
			expectation.fulfill()
			}, completion: nil)

		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldNotPerformNilBlockInBackgroundWithNilCompletion() {
		// backgroundBlock: OFF
		// completionBlock: OFF
		let expectation = expectationWithDescription("should not crash")
		self.performBlockInBackground(nil, completion: nil)
		expectation.fulfill()
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

}

// MARK: - Perform Block After Delay With Completion Block

/**
* Performs a code block after a given delay and call a completion block when it's done.
*
* @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
* @param block A block object containing the code to execute. This block takes no parameters and has no return value.
* @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed.
*/
//- (void)performBlockAfterDelay:(NSTimeInterval)delay block:(nullable void (^)(void))block completion:(nullable void (^)(void))completionBlock;

extension NSObjectTests {

}

// MARK: - Perform Block With Completion Block

/**
* Performs a code block and call a completion block when it's done.
*
* @param block A block object containing the code to execute. This block takes no parameters and has no return value.
* @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed.
*/
//- (void)performBlock:(nullable void (^)(void))block completion:(nullable void (^)(void))completionBlock;

extension NSObjectTests {

}
