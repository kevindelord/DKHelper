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
		self.backgroundView?.roundCorner(UIRectCorner.AllCorners, radius: (self.backgroundView?.frameWidth() ?? 0), maskToBounds: true)
		self.versionLabel?.text = appVersion()

		let str : NSString = "dr_ferfr.gt"
		print(str.lastOccuranceForPattern("[.]+[0-9a-zA-Z]+$"))
		print(str.lastOccuranceForPattern(DKRegex.fileExtension()))

	}
}
