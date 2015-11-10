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

/**
* Performs a code block after a given delay.
*
* @param delay The amount of time (measured in seconds) to wait before beginning the animations. Specify a value of 0 to begin the animations immediately.
* @param block A block object containing the code to execute. This block takes no parameters and has no return value.
*/
//- (void)performBlockAfterDelay:(NSTimeInterval)delay block:(nullable void (^)(void))block;

extension NSObjectTests {

	func test_ShouldPerformBlockAfterDelay() {

		
	}

	func test_ShouldNotPerformNilBlockAfterDelay() {

	}

	func test_ShouldPerforlBlockAfterInvalidDelay() {

	}

}

// MARK: - Perform Block In Background

/**
* Performs a code block on a background thread.
*
* @param block A block object containing the code to execute. This block takes no parameters and has no return value.
*/
//- (void)performBlockInBackground:(nullable void (^)(void))block;

extension NSObjectTests {

}

// MARK: - Perform Block In Background With Completion Block

/**
* Performs a code block on a background thread and call a completion block when it's done.
*
* @param block A block object containing the code to execute. This block takes no parameters and has no return value.
* @param completionBlock A block object containing the code to execute. This block takes no parameters and has no return value. It will be called after the main block has been executed.
*/
//- (void)performBlockInBackground:(nullable void (^)(void))block completion:(nullable void (^)(void))completionBlock;

extension NSObjectTests {

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
