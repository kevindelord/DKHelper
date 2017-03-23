# DKHelper

[![Build Status](https://travis-ci.org/kevindelord/DKHelper.svg?branch=master)](https://travis-ci.org/kevindelord/DKHelper)
[![codecov.io](https://codecov.io/github/kevindelord/DKHelper/coverage.svg?branch=master)](https://codecov.io/gh/kevindelord/DKHelper)
[![CocoaPods](https://img.shields.io/cocoapods/v/DKHelper.svg?style=flat)](https://cocoapods.org/pods/DKHelper)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/kevindelord/DKHelper)
[![License](https://img.shields.io/cocoapods/l/DKHelper.svg?style=flat)](http://cocoadocs.org/docsets/DKHelper)
[![Platform](https://img.shields.io/cocoapods/p/DKHelper.svg?style=flat)](http://cocoadocs.org/docsets/DKHelper)

The DKHelper library is a group of categorized classes containing functions meant to help any developer on his every day work.

Those functions were coded and used for many different projects. Instead of copying them every few days, a library has been made to simplify the this task.

## Integration

### [CocoaPods](http://cocoapods.org)

Add the following to your `Podfile`:

    pod "DKHelper"

And import the header file:

    #import "DKHelper.h"

### [Carthage](https://github.com/Carthage/Carthage)

Add the following to your `Cartfile`:

    github "kevindelord/DKHelper"

And import the framework:

    // Swift
    import DKHelper
    // Obj-C
    #import <DKHelper/DKHelper.h>

## Most common functions

Here is a small list of available functions. Many more are available, please check the [full documentation on CocoaDocs](http://cocoadocs.org/docsets/DKHelper).

### [Perform blocks](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSObject+Block.html)

The DKHelper makes it easier to deal with blocks [in brackground](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSObject+Block.html#//api/name/performBlockInBackground:completion:) or [in the main thread](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSObject+Block.html#//api/name/performBlockInMainThread:). You do not need to remember the GCD syntax or anything.

	performBlock(inMainThread: {
		// Block executed on background thread.
	})
	
	performBlock(inBackground: {
		// Block executed on background thread.
	}) {
		// Completion block executed on main thread.
	}

Some functions also exist giving the possibility to [execute a block after a certain delay](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSObject+Block.html#//api/name/performBlockAfterDelay:block:):

	performBlock(afterDelay: 0.3) {
		// Block executed after 0.3 seconds.
	}

### [NSDate](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSDate+DKHelper.html)

Many functions and properties have been created for the NSDate class.

There are functions to check how old is a date, [more than a day](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSDate+DKHelper.html#//api/name/isOlderOrEqualThanDayInterval:) or [a year](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSDate+DKHelper.html#//api/name/isOlderOrEqualThanYearInterval:)?

	aDate.isOlderOrEqualThanDayInterval(3)

	aDate.isOlderOrEqualThanYearInterval(1)

There are also function to directly get the [day](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSDate+DKHelper.html#//api/name/day), [hours](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSDate+DKHelper.html#//api/name/hour), [minutes](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSDate+DKHelper.html#//api/name/minute), etc. values.

	aDate.day()

	aDate.hour()

	aDate.minute()

It is also possible to add some time interval to a date. For example [add 2 years](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSDate+DKHelper.html#//api/name/dateByAddingYearInterval:) or [5 days](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSDate+DKHelper.html#//api/name/dateByAddingDayInterval:):

	aDate.addingYearInterval(2)

	aDate.addingDayInterval(5)

### [NSString](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSString+DKHelper.html)

There are properties to check whether a string is

[an email](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSString+DKHelper.html#//api/name/isEmail):

	myString.isEmail

[a numeric string](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSString+DKHelper.html#//api/name/isNumeric):

	myString.isNumeric

[an alphanumeric string](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSString+DKHelper.html#//api/name/isAlphaNumeric):

	myString.isAlphaNumeric

But also functions to generate a string object from a date [with style](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSString+DKHelper.html#//api/name/stringFromDate:style:) or [with format](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/NSString+DKHelper.html#//api/name/stringFromDate:format:):

	NSString(from: aDate, style: .ShortStyle)

	NSString(from: aDate, format: NSDate.ISO8601StringFormat(), timeZone: TimeZone.current)

### [UIColor](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIColor+DKHelper.html)

There is function to generate a color from [RGB](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIColor+DKHelper.html#//api/name/r:g:b:), [RGBA](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIColor+DKHelper.html#//api/name/r:g:b:a:), and [Hexa strings](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIColor+DKHelper.html#//api/name/colorFromHexString:):

	UIColor.r(123, g: 46, b: 14)

	UIColor.r(123, g: 46, b: 14, a: 0.7)

	UIColor(fromHexString: "#FF34DD")

	UIColor(fromHexString: "#FF34DD", alpha: 0.6)

### [UIImageView](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIImageView+DKHelper.html)

It is possible to initialize an image view [with a frame _and_ a picture](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIImageView+DKHelper.html#//api/name/initWithFrame:image:):

	UIImageView(frame: aFrame, image: anImage)

Or just with an [image name](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIImageView+DKHelper.html#//api/name/initWithImageNamed:):

	UIImageView(imageNamed: "aPicture.png")

### [UIDevice](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIDevice+Model.html)

Check the [current system version](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIDevice+Model.html#//api/name/systemVersionGreaterThan:):

	UIDevice.systemVersionGreaterThan("8.0")

or if it [is an iPad](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIDevice+Model.html#//api/name/isIPad):

	UIDevice.current.isIPad

or even the [current platform name](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIDevice+Model.html#//api/name/currentPlatformName), for example `"iPhone 5C (GSM)"`

	UIDevice.currentPlatformName()

### [UIScreen](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIScreen+DKHelper.html)

Functions to get to know the [size in inches of the current screen](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIScreen+DKHelper.html).

	UIScreen.is4InchScreen()

### [UIView](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIView+DKHelper.html)

[Loads a view from a nib file](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIView+DKHelper.html#//api/name/loadFromNib:) within the main bundle.

	UIView.load(fromNib: "myAwesomeNibFile")

Add [rounded corners](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIView+DKHelper.html#//api/name/roundCorner:radius:):

	myView.roundCorner(.allCorners, radius: 10)

Or to quickly access the [current width](http://cocoadocs.org/docsets/DKHelper/2.2.4/Categories/UIView+DKHelper.html#//api/name/frameWidth) of the view:

	myView.frameWidth

## Author

kevindelord, delord.kevin@gmail.com

## License

DKHelper is available under the [MIT license](https://github.com/kevindelord/DKHelper/blob/master/LICENSE).
