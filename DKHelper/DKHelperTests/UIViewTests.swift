//
//  UIViewTests.swift
//  DKHelper
//
//  Created by kevin delord on 05/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import XCTest
@testable import DKHelper

class DKViewTest : UIView {

	override func awakeFromNib() {
		super.awakeFromNib()
		self.backgroundColor = UIColor.redColor()
	}
}

class UIViewTests: XCTestCase {

	private var currentBundle : NSBundle {
		return NSBundle(forClass: UIImageTests.self)
	}
}

// MARK: - Load From Nib

extension UIViewTests {

	func test_ShouldReturnNilWhenLoadinFromInvalidNibInMainBundle() {
		let view = UIView.loadFromNib("uiview")
		XCTAssertNil(view)
	}

	func test_ShouldReturnNilWhenLoadinFromInvalidNib() {
		let view = UIView.loadFromNib("uiview", fromBundle: self.currentBundle)
		XCTAssertNil(view)
	}

	func test_ShouldReturnValidViewFromNib() {
		let view = UIView.loadFromNib("DKViewTest", fromBundle: self.currentBundle)
		XCTAssertNotNil(view)
		XCTAssert((view is DKViewTest) == true)
	}
}

// MARK: - Vertical Gradient Layer

extension UIViewTests {

	func test_ShouldCreateVerticalGradientLayerWithCorrectFrame() {
		let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
		let view = UIView.verticalGradientLayer(frame, topColor: UIColor.greenColor(), bottomColor: UIColor.blueColorWithAlpha(0.3))
		XCTAssertNotNil(view)
		XCTAssertNotNil(view.layer)
		XCTAssertEqual(view.frame, frame)
	}

	func test_ShouldCreateGradientWithValidColors() {
		let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
		let view = UIView.verticalGradientLayer(frame, topColor: UIColor.greenColor(), bottomColor: UIColor.blueColorWithAlpha(0.3))

		XCTAssertEqual(view.layer.sublayers?.first is CAGradientLayer, true)
		let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
		let colors = gradientLayer?.colors as? [CGColorRef]
		XCTAssertNotNil(colors)
		XCTAssertEqual(colors?.count, 2)
		XCTAssert(CGColorEqualToColor(colors?.first, UIColor.greenColor().CGColor) == true)
		XCTAssert(CGColorEqualToColor(colors?.last, UIColor.blueColorWithAlpha(0.3).CGColor) == true)
	}

	func test_ShouldCreateGradientWithValidStartAndEndPoints() {
		let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
		let view = UIView.verticalGradientLayer(frame, topColor: UIColor.greenColor(), bottomColor: UIColor.blueColorWithAlpha(0.3))

		XCTAssertEqual(view.layer.sublayers?.first is CAGradientLayer, true)
		let gradientLayer = view.layer.sublayers?.first as? CAGradientLayer
		XCTAssertEqual(gradientLayer?.startPoint, CGPoint(x: 0, y: 0))
		XCTAssertEqual(gradientLayer?.endPoint, CGPoint(x: 0, y: 1))
	}
}

// MARK: - UIView+Constraints

extension UIViewTests {

	func test_ShouldNotMatchParentWhenSuperViewIsNil() {
		let view = UIView(frame: CGRect(x: 10, y: 30, width: 10, height: 70))
		// check there are no constraint
		XCTAssertEqual(view.constraints.count, 0)
		let constraints = view.matchParentConstraints()
		// check there are more constraint
		XCTAssertEqual(view.constraints.count, 0)
		XCTAssertEqual(constraints.count, 0)
	}

	func test_ShouldMatchParentConstraints() {
		let superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		let view = UIView(frame: CGRect(x: 10, y: 30, width: 10, height: 70))
		// check there are no constraint
		XCTAssertEqual(superview.constraints.count, 0)
		XCTAssertEqual(view.constraints.count, 0)
		superview.addSubview(view)
		view.matchParentConstraints()
		// check there are more constraint
		XCTAssertEqual(superview.constraints.count, 4)
		XCTAssertEqual(view.constraints.count, 0)
	}

	func test_ShouldMatchParentViewWithValidBottomConstraints() {
		let superview = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		let view = UIView(frame: CGRect(x: 10, y: 30, width: 10, height: 70))
		// check there are no constraint
		superview.addSubview(view)
		let constraints = view.matchParentConstraints()

		// verify bottom constraint
		for constraint in constraints {
			for attribute in [NSLayoutAttribute.Bottom, NSLayoutAttribute.Top, NSLayoutAttribute.Left, NSLayoutAttribute.Right]
				where (attribute == constraint.firstAttribute) {
					XCTAssertEqual(constraint.firstItem as? UIView, view)
					XCTAssertEqual(constraint.relation, NSLayoutRelation.Equal)
					XCTAssertEqual(constraint.secondItem as? UIView, superview)
					XCTAssertEqual(constraint.multiplier, 1.0)
					XCTAssertEqual(constraint.constant, 0)
					XCTAssertEqual(constraint.firstAttribute, attribute)
					XCTAssertEqual(constraint.secondAttribute, attribute)
			}
		}
	}
}

// MARK: - RoundCorner

extension UIViewTests {

	func test_ShouldRoundCornerWithRadiusAndMaskToBounds() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		// there is no mask
		XCTAssertNil(view.layer.mask)
		view.roundCorner(UIRectCorner.AllCorners, radius: 10, maskToBounds: true)
		// verify new mask's validity
		XCTAssertNotNil(view.layer.mask)
		XCTAssertEqual(view.layer.mask?.bounds, CGRect(x: 0, y: 0, width: 200, height: 200))
		XCTAssertNotNil((view.layer.mask as? CAShapeLayer)?.path)
		XCTAssert(((view.layer.mask as? CAShapeLayer)?.masksToBounds ?? false) == true)
	}

	func test_ShouldRoundCornerWithRadiusAndWithoutMaskToBounds() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		// there is no mask
		XCTAssertNil(view.layer.mask)
		view.roundCorner(UIRectCorner.AllCorners, radius: 10, maskToBounds: false)
		// verify new mask's validity
		XCTAssertNotNil(view.layer.mask)
		XCTAssertEqual(view.layer.mask?.bounds, CGRect(x: 0, y: 0, width: 200, height: 200))
		XCTAssertNotNil((view.layer.mask as? CAShapeLayer)?.path)
		XCTAssert(((view.layer.mask as? CAShapeLayer)?.masksToBounds ?? true) == false)
	}

	func test_ShouldRoundCornerWithRadius() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		// there is no mask
		XCTAssertNil(view.layer.mask)
		view.roundCorner(UIRectCorner.AllCorners, radius: 10)
		// verify new mask's validity
		XCTAssertNotNil(view.layer.mask)
		XCTAssertEqual(view.layer.mask?.bounds, CGRect(x: 0, y: 0, width: 200, height: 200))
		XCTAssertNotNil((view.layer.mask as? CAShapeLayer)?.path)
		XCTAssert(((view.layer.mask as? CAShapeLayer)?.masksToBounds ?? true) == false)
	}
}

// MARK: - Frame Getter

extension UIViewTests {

	func test_ShouldReturnWidth() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		XCTAssertEqual(view.frameWidth, 200)
	}

	func test_ShouldReturnHeight() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		XCTAssertEqual(view.frameHeight, 200)
	}

	func test_ShouldReturnX() {
		let view = UIView(frame: CGRect(x: 10, y: 0, width: 200, height: 200))
		XCTAssertEqual(view.frameX, 10)
	}

	func test_ShouldReturnY() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		XCTAssertEqual(view.frameY, -20)
	}

	func test_ShouldReturnOrigin() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		XCTAssertEqual(view.frameOrigin.x, 10)
		XCTAssertEqual(view.frameOrigin.y, -20)
	}

	func test_ShouldReturnSize() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		XCTAssertEqual(view.frameSize.width, 200)
		XCTAssertEqual(view.frameSize.height, 200)
	}
}

// MARK: - Frame Setter

extension UIViewTests {

	func test_ShouldSetWidth() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		view.frameWidth = 100
		XCTAssertEqual(view.frameWidth, 100)
	}

	func test_ShouldSetHeight() {
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
		view.frameHeight = 100
		XCTAssertEqual(view.frameHeight, 100)
	}

	func test_ShouldSetX() {
		let view = UIView(frame: CGRect(x: 10, y: 0, width: 200, height: 200))
		view.frameX = 100
		XCTAssertEqual(view.frameX, 100)
	}

	func test_ShouldSetY() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		view.frameY = 100
		XCTAssertEqual(view.frameY, 100)
	}

	func test_ShouldSetOrigin() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		view.frameOrigin = CGPoint(x: 100, y: 21)
		XCTAssertEqual(view.frameOrigin.x, 100)
		XCTAssertEqual(view.frameOrigin.y, 21)
	}

	func test_ShouldSetSize() {
		let view = UIView(frame: CGRect(x: 10, y: -20, width: 200, height: 200))
		view.frameSize = CGSize(width: 30, height: 31)
		XCTAssertEqual(view.frameSize.width, 30)
		XCTAssertEqual(view.frameSize.height, 31)
	}
}
