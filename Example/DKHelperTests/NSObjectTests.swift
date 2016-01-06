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
			XCTAssert(NSThread.isMainThread() == true)
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

	func test_ShouldPerformBlockAfterInvalidDelay() {
		let startDate = NSDate()
		let expectation = expectationWithDescription("execute block after delay")
		self.performBlockAfterDelay(-2) {
			XCTAssert(NSThread.isMainThread() == true)
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

	func test_ShouldPerformBlockAfterZeroDelay() {
		let startDate = NSDate()
		let expectation = expectationWithDescription("execute block after delay")
		self.performBlockAfterDelay(0) {
			XCTAssert(NSThread.isMainThread() == true)
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

// MARK: - Perform Block In Main Thread

extension NSObjectTests {
	
	func test_ShouldPerformBlockInMainThread() {
		let expectation = expectationWithDescription("execute block in main thread")
		self.performBlockInMainThread { () -> Void in
			XCTAssert(NSThread.isMainThread() == true)
			expectation.fulfill()
		}
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}
	func test_ShouldNotPerformNilBlockInMainThread() {
		let expectation = expectationWithDescription("should not crash")
		self.performBlockInMainThread(nil)
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


extension NSObjectTests {

	func test_ShouldPerformBlockAfterDelayWithCompletion() {
		// mainBlock: ON
		// completionBlock: ON

		let startDate = NSDate()
		let expectation = expectationWithDescription("execute block after delay")
		self.performBlockAfterDelay(2, block: { () -> Void in
			XCTAssert(NSThread.isMainThread() == true)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(2) == true)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(1) == true)
			XCTAssert(startDate.isOlderOrEqualThanMinuteInterval(2) == false)

			}) { () -> Void in
				XCTAssert(NSThread.isMainThread() == true)
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

	// TODO HERE.

	func test_ShouldNotPerformNilBlockAfterDelayWithCompletion() {
		// mainBlock: OFF
		// completionBlock: ON
		let startDate = NSDate()
		let expectation = expectationWithDescription("execute block after delay")
		self.performBlockAfterDelay(2, block: nil) { () -> Void in

			XCTAssert(NSThread.isMainThread() == true)
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

	func test_ShouldPerformBlockAfterInvalidDelayWithCompletion() {
		// mainBlock: ON
		// completionBlock: ON
		let startDate = NSDate()
		let expectation = expectationWithDescription("execute block after delay")
		self.performBlockAfterDelay(-2, block: { () -> Void in

			XCTAssert(NSThread.isMainThread() == true)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(2) == false)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(1) == false)
			XCTAssert(startDate.isOlderOrEqualThanMinuteInterval(2) == false)
			XCTAssert(startDate.stringValue() == NSDate().stringValue())

			}) { () -> Void in

				XCTAssert(NSThread.isMainThread() == true)
				XCTAssert(startDate.isOlderOrEqualThanSecondInterval(3) == false)
				XCTAssert(startDate.isOlderOrEqualThanSecondInterval(2) == false)
				XCTAssert(startDate.isOlderOrEqualThanSecondInterval(1) == false)
				XCTAssert(startDate.isOlderOrEqualThanMinuteInterval(2) == false)

				expectation.fulfill()
		}

		waitForExpectationsWithTimeout(5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockAfterDelayWithNilCompletion() {
		// mainBlock: ON
		// completionBlock: OFF
		let startDate = NSDate()
		let expectation = expectationWithDescription("should not crash")
		self.performBlockAfterDelay(2, block: { () -> Void in
			XCTAssert(NSThread.isMainThread() == true)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(2) == true)
			XCTAssert(startDate.isOlderOrEqualThanSecondInterval(1) == true)
			XCTAssert(startDate.isOlderOrEqualThanMinuteInterval(2) == false)

			expectation.fulfill()
			}, completion: nil)

		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockAfterZeroDelayWithCompletion() {
		// mainBlock: ON
		// completionBlock: ON
		let startDate = NSDate()
		let expectation = expectationWithDescription("execute block after delay")
		self.performBlockAfterDelay(0, block: { () -> Void in

			XCTAssert(NSThread.isMainThread() == true)
			XCTAssert(startDate.stringValue() == NSDate().stringValue())

			}) { () -> Void in

				XCTAssert(NSThread.isMainThread() == true)
				XCTAssert(startDate.stringValue() == NSDate().stringValue())
				expectation.fulfill()

		}
		waitForExpectationsWithTimeout(5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockAfterDelayAndBeforeCompletionBlock() {
		// mainBlock: ON
		// completionBlock: ON
		let expectation = expectationWithDescription("execute block in background")
		var count = 0
		self.performBlockAfterDelay(2, block: { () -> Void in
			XCTAssert(NSThread.isMainThread() == true)
			XCTAssert(count == 0)
			count += 1

			}) { () -> Void in
				XCTAssert(NSThread.isMainThread() == true)
				XCTAssert(count == 1)
				expectation.fulfill()
		}
		waitForExpectationsWithTimeout(3) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}

// MARK: - Perform Block With Completion Block

extension NSObjectTests {

	func test_ShouldPerformBlockWithCompletion() {
		// mainBlock: ON
		// completionBlock: ON
		let expectation = expectationWithDescription("execute block in background")
		self.performBlock({ () -> Void in
			XCTAssert(NSThread.isMainThread() == true)

			}) { () -> Void in
				XCTAssert(NSThread.isMainThread() == true)
				expectation.fulfill()
		}
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockBeforeCompletionBlock() {
		// mainBlock: ON
		// completionBlock: ON
		let expectation = expectationWithDescription("execute block in background")
		var count = 0
		self.performBlock({ () -> Void in
			XCTAssert(NSThread.isMainThread() == true)
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

	func test_ShouldPerformNilBlockWithCompletion() {
		// mainBlock: OFF
		// completionBlock: ON
		let expectation = expectationWithDescription("should not crash")
		self.performBlock(nil) { () -> Void in
			XCTAssert(NSThread.isMainThread() == true)
			expectation.fulfill()
		}
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockWithNilCompletion() {
		// mainBlock: ON
		// completionBlock: OFF
		let expectation = expectationWithDescription("should not crash")
		self.performBlock({ () -> Void in
			XCTAssert(NSThread.isMainThread() == true)
			expectation.fulfill()
			}, completion: nil)

		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldNotPerformNilBlockWithNilCompletion() {
		// mainBlock: OFF
		// completionBlock: OFF
		let expectation = expectationWithDescription("should not crash")
		self.performBlock(nil, completion: nil)
		expectation.fulfill()
		waitForExpectationsWithTimeout(2) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}
