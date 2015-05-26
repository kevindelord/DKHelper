# DKHelper CHANGELOG

## 0.9.2

- Add NSString::strimFromDate:style
- Add DEPRECATED NSObject::performBlock:afterDelay:completion:
- Add DEPRECATED NSObject::performBlock:afterDelay:

## 0.9.1

- Add UIView::loadFromNib:
- Add UIView::matchParentConstraints
- Add UIView::verticalGradientLayer:topColor:bottomColor:
- Add NSString::randomString:
- Add NSString::randomNumericString:
- Add NSString::trimWhitespaces
- Add NSString::removeAllNewlinesAndIllegalChars
- Add NSString::isEmail
- Add NSString::isAlphaNumeric
- Add NSString::isPhoneNumber
- Add UIColor::randomColor
- Add UIImage::scaleImage:size:
- Add UIImage::resizedImageToScreenSize
- Add NSBundle::entryInPListForKey:
- Add NSDate::dateFromString:style:
- Add NSDate::fullDisplayTime
- Add NSDate::hourDisplayTime
- Add NSDate::displayableString
- Rename NSObject::performBlockAfterDelay:block:
- Rename NSObject::performBlockAfterDelay:block:completion:

## 0.8.1

- Fix Obj-C xcode project
- NSDate now compatible with Xcode 5.1.1

## 0.8.0

- Remove categorised class UIImage. Please now use the dedicated library: https://github.com/kevindelord/UIImage-Autoresize

## 0.7.6

- Fix UIImage initializer.

## 0.7.5

- Improve UIImage class to generate an object with a file corresponding to the current device size.

## 0.7.4

- GET_NUMBER bug fix

## 0.7.3

- NSPredicate documentation fixed

## 0.7.2

- NSPredicate bug fixes

## 0.7.1

- Bug fixes
- Add DKRegex class

## 0.7.0

- Improve documentation
- Add localized function L()
- Add NSPredicate function helpers
- Add Number and cast functions
- Add DKLog as a function
- Add regex functions
- Add functions to get the current screen size
- Add functions to get valid data from a dictionary
- Add Math fonction to convert radians and degrees
- Add categorised methods to UIDevice to check system version
- Create array category for file extensions

## 0.6.5

- Add is4InchScreen, is47InchScreen, is55InchScreen defines.
- ISO8601_DATE_FORMAT define has been removed. Use NSDate::ISO8601StringFormat instead.
- Add NSDate::ISO8601StringFormat method to get the ISO 8601 date format as a string.
- UIColorFromHexa define has been removed. Use UIColor::colorFromHexString instead.
- UIColor: add color from hexa methods
- UIView::roundCorner methods improved with maskToBounds parameter.
- Update device family with iPhone 6 and iPhone 6 Plus.
- NSCalendar unit warning fixes for iOS 8.

## 0.6.4

- NSDate: Use default timezone for NSDate components

## 0.6.3

- Add minor documentation on UIImage class

## 0.6.2

- NSString::stringFromDate now use temporary timezone set to 0

## 0.6.1

- Add Getter for UIVIew frame attributes
- Add NSNumber::currencyStringValue
- MINMAX macro now use <= and >= operator
- Add UIColorFromHexa maccro

## 0.6.0

- Improve Documentation
- Improve Test workspace
- Add and improve performBlock methods
- Add UIImageView::initwithframe:image(name)
- Add NSDate component getters
- Improve NSDate::dateByAddingInterval methods
- Add NSDate::midnightDate
- UIDevice::isSlowDevice bug fix

## 0.5.2

- NSDate: add dateFromISOString
- NSObject: add performBlockInBackground

## 0.5.1

- NSDate improvements

## 0.5.0

- Fix header in files.
- Add HTML documentation

## 0.4.0

- Add comments for every methods and functions
- Improve CGSize and CGRect functions

## 0.3.0

- Create multiple files for each category
- Create development and test projects

## 0.2.0

- Improve UIDevice methods
- Improve NSDarte default format: ISO8601 

## 0.1.0

- Initial release.
