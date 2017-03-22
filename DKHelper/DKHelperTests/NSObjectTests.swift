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
		let startDate = Date()
		let expectation = self.expectation(description: "execute block after delay")
		self.performBlock(afterDelay: 2) {
			XCTAssert(Thread.isMainThread == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(2) == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(1) == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanMinuteInterval(2) == false)
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldNotPerformNilBlockAfterDelay() {
		let expectation = self.expectation(description: "should not crash")
		self.performBlock(afterDelay: 2, block: nil)
		expectation.fulfill()
		waitForExpectations(timeout: 5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockAfterInvalidDelay() {
		let startDate = Date()
		let expectation = self.expectation(description: "execute block after delay")
		self.performBlock(afterDelay: -2) {
			XCTAssert(Thread.isMainThread == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(2) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(1) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanMinuteInterval(2) == false)
			XCTAssert((startDate as NSDate).stringValue() == (Date() as NSDate).stringValue())
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockAfterZeroDelay() {
		let startDate = Date()
		let expectation = self.expectation(description: "execute block after delay")
		self.performBlock(afterDelay: 0) {
			XCTAssert(Thread.isMainThread == true)
			XCTAssert((startDate as NSDate).stringValue() == (Date() as NSDate).stringValue())
			expectation.fulfill()
		}
		waitForExpectations(timeout: 5) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}

// MARK: - Perform Block In Background

extension NSObjectTests {

	func test_ShouldPerformBlockInBackground() {
		let expectation = self.expectation(description: "execute block in background")
		self.performBlock(inBackground: {
			XCTAssert(Thread.isMainThread == false)
			expectation.fulfill()
		})
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldNotPerformNilBlockInBackground() {
		let expectation = self.expectation(description: "should not crash")
		self.performBlock(inBackground: nil)
		expectation.fulfill()
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}

// MARK: - Perform Block In Main Thread

extension NSObjectTests {
	
	func test_ShouldPerformBlockInMainThread() {
		let expectation = self.expectation(description: "execute block in main thread")
		self.performBlock(inMainThread: {
			XCTAssert(Thread.isMainThread == true)
			expectation.fulfill()
		})
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}
	func test_ShouldNotPerformNilBlockInMainThread() {
		let expectation = self.expectation(description: "should not crash")
		self.performBlock(inMainThread: nil)
		expectation.fulfill()
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}

// MARK: - Perform Block In Background With Completion Block

extension NSObjectTests {

	func test_ShouldPerformBlockInBackgroundWithCompletion() {
		// backgroundBlock: ON
		// completionBlock: ON
		let expectation = self.expectation(description: "execute block in background")
		self.performBlock(inBackground: { () -> Void in
			XCTAssert(Thread.isMainThread == false)

			}) { () -> Void in
				XCTAssert(Thread.isMainThread == true)
				expectation.fulfill()
		}
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBackroundBlockBeforeCompletionBlock() {
		// backgroundBlock: ON
		// completionBlock: ON
		let expectation = self.expectation(description: "execute block in background")
		var count = 0
		self.performBlock(inBackground: { () -> Void in
			XCTAssert(Thread.isMainThread == false)
			XCTAssert(count == 0)
			count += 1

			}) { () -> Void in
				XCTAssert(Thread.isMainThread == true)
				XCTAssert(count == 1)
				expectation.fulfill()
		}
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformNilBlockInBackgroundWithCompletion() {
		// backgroundBlock: OFF
		// completionBlock: ON
		let expectation = self.expectation(description: "should not crash")
		self.performBlock(inBackground: nil) { () -> Void in
			XCTAssert(Thread.isMainThread == true)
			expectation.fulfill()
		}
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockInBackgroundWithNilCompletion() {
		// backgroundBlock: ON
		// completionBlock: OFF
		let expectation = self.expectation(description: "should not crash")
		self.performBlock(inBackground: { () -> Void in
			XCTAssert(Thread.isMainThread == false)
			expectation.fulfill()
			}, completion: nil)

		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldNotPerformNilBlockInBackgroundWithNilCompletion() {
		// backgroundBlock: OFF
		// completionBlock: OFF
		let expectation = self.expectation(description: "should not crash")
		self.performBlock(inBackground: nil, completion: nil)
		expectation.fulfill()
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}

// MARK: - Perform Block After Delay With Completion Block


extension NSObjectTests {

	func test_ShouldPerformBlockAfterDelayWithCompletion() {
		// mainBlock: ON
		// completionBlock: ON

		let startDate = Date()
		let expectation = self.expectation(description: "execute block after delay")
		self.performBlock(afterDelay: 2, block: { () -> Void in
			XCTAssert(Thread.isMainThread == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(2) == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(1) == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanMinuteInterval(2) == false)

			}) { () -> Void in
				XCTAssert(Thread.isMainThread == true)
				XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(3) == false)
				XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(2) == true)
				XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(1) == true)
				XCTAssert((startDate as NSDate).isOlderOrEqualThanMinuteInterval(2) == false)

				expectation.fulfill()
		}

		waitForExpectations(timeout: 5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	// TODO HERE.

	func test_ShouldNotPerformNilBlockAfterDelayWithCompletion() {
		// mainBlock: OFF
		// completionBlock: ON
		let startDate = Date()
		let expectation = self.expectation(description: "execute block after delay")
		self.performBlock(afterDelay: 2, block: nil) { () -> Void in

			XCTAssert(Thread.isMainThread == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(2) == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(1) == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanMinuteInterval(2) == false)

			expectation.fulfill()
		}

		waitForExpectations(timeout: 5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockAfterInvalidDelayWithCompletion() {
		// mainBlock: ON
		// completionBlock: ON
		let startDate = Date()
		let expectation = self.expectation(description: "execute block after delay")
		self.performBlock(afterDelay: -2, block: { () -> Void in

			XCTAssert(Thread.isMainThread == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(2) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(1) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanMinuteInterval(2) == false)
			XCTAssert((startDate as NSDate).stringValue() == (Date() as NSDate).stringValue())

			}) { () -> Void in

				XCTAssert(Thread.isMainThread == true)
				XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(3) == false)
				XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(2) == false)
				XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(1) == false)
				XCTAssert((startDate as NSDate).isOlderOrEqualThanMinuteInterval(2) == false)

				expectation.fulfill()
		}

		waitForExpectations(timeout: 5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockAfterDelayWithNilCompletion() {
		// mainBlock: ON
		// completionBlock: OFF
		let startDate = Date()
		let expectation = self.expectation(description: "should not crash")
		self.performBlock(afterDelay: 2, block: { () -> Void in
			XCTAssert(Thread.isMainThread == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(3) == false)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(2) == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanSecondInterval(1) == true)
			XCTAssert((startDate as NSDate).isOlderOrEqualThanMinuteInterval(2) == false)

			expectation.fulfill()
			}, completion: nil)

		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockAfterZeroDelayWithCompletion() {
		// mainBlock: ON
		// completionBlock: ON
		let startDate = Date()
		let expectation = self.expectation(description: "execute block after delay")
		self.performBlock(afterDelay: 0, block: { () -> Void in

			XCTAssert(Thread.isMainThread == true)
			XCTAssert((startDate as NSDate).stringValue() == (Date() as NSDate).stringValue())

			}) { () -> Void in

				XCTAssert(Thread.isMainThread == true)
				XCTAssert((startDate as NSDate).stringValue() == (Date() as NSDate).stringValue())
				expectation.fulfill()

		}
		waitForExpectations(timeout: 5) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockAfterDelayAndBeforeCompletionBlock() {
		// mainBlock: ON
		// completionBlock: ON
		let expectation = self.expectation(description: "execute block in background")
		var count = 0
		self.performBlock(afterDelay: 2, block: { () -> Void in
			XCTAssert(Thread.isMainThread == true)
			XCTAssert(count == 0)
			count += 1

			}) { () -> Void in
				XCTAssert(Thread.isMainThread == true)
				XCTAssert(count == 1)
				expectation.fulfill()
		}
		waitForExpectations(timeout: 3) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}

// MARK: - Perform Block With Completion Block

extension NSObjectTests {

	func test_ShouldPerformBlockWithCompletion() {
		// mainBlock: ON
		// completionBlock: ON
		let expectation = self.expectation(description: "execute block in background")
		self.perform({ () -> Void in
			XCTAssert(Thread.isMainThread == true)

			}) { () -> Void in
				XCTAssert(Thread.isMainThread == true)
				expectation.fulfill()
		}
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockBeforeCompletionBlock() {
		// mainBlock: ON
		// completionBlock: ON
		let expectation = self.expectation(description: "execute block in background")
		var count = 0
		self.perform({ () -> Void in
			XCTAssert(Thread.isMainThread == true)
			XCTAssert(count == 0)
			count += 1

			}) { () -> Void in
				XCTAssert(Thread.isMainThread == true)
				XCTAssert(count == 1)
				expectation.fulfill()
		}
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformNilBlockWithCompletion() {
		// mainBlock: OFF
		// completionBlock: ON
		let expectation = self.expectation(description: "should not crash")
		self.perform(nil, completion: {
			XCTAssert(Thread.isMainThread == true)
			expectation.fulfill()
		})
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldPerformBlockWithNilCompletion() {
		// mainBlock: ON
		// completionBlock: OFF
		let expectation = self.expectation(description: "should not crash")
		self.perform({ () -> Void in
			XCTAssert(Thread.isMainThread == true)
			expectation.fulfill()
			}, completion: nil)

		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}

	func test_ShouldNotPerformNilBlockWithNilCompletion() {
		// mainBlock: OFF
		// completionBlock: OFF
		let expectation = self.expectation(description: "should not crash")
		self.perform(nil, completion: nil)
		expectation.fulfill()
		waitForExpectations(timeout: 2) { error in
			XCTAssert(true, "didn't crash")
		}
	}
}
