//
//  ViewController.swift
//  DKHelper
//
//  Created by kevin delord on 03/11/15.
//  Copyright © 2015 Kevin Delord. All rights reserved.
//

import UIKit

class DKViewController					: UIViewController {

	@IBOutlet weak var backgroundView	: UIView?
	@IBOutlet weak var versionLabel		: UILabel?

	override func viewDidLoad() {
		super.viewDidLoad()
		let radius = (self.backgroundView?.frameWidth ?? 0)
		self.backgroundView?.roundCorner(UIRectCorner.AllCorners, radius: radius, maskToBounds: true)
		self.versionLabel?.text = appVersion()
	}
}
