# DKHelper CHANGELOG

## 2.2.4

- UIDevice: add new iPhone and AppleWatch devices.
- UIColor: init function now forces the RGB values to be between 0.0 and 1.0.
- UIImage: `resizedImage` functions now return an optional object.
- Minor `GET_DATE` function improvement.

## 2.2.3

- Print a warning if a localized string can't be found.

## 2.2.2

- Fix crash on non NSString values when using GET_STRING()

## 2.2.1

- Fix Carthage deploy.

## 2.2.0

- Add Carthage support.
- Add `logAppVersion` function.
- NSBundle: `entryInPlist` functions are now also object functions.
- NSDate: all helper functions now used the `defaultTimeZone`.
- UIView: add `loadFromNib:fromBundle:` function.

## 2.1.4

- UIImage: add `sizeInPixel`function.
- CGSize: add `CGSizeMultiply` function.

## 2.1.3

- Add support for iPhone SE and iPro 9,7 inches.
- Add `performBlock` C functions.

## 2.1.2

- Remove iOS7Delta define.

## 2.1.1

- NSDate: add `GET_DATE_FORMAT` function.

## 2.1.0

- NSDate: `dateFromString` functions now use the system time zone.
- NSDate: remove `gregorianCalendarIdentifier` deprecated function.
- NSObject: add `performBlockInMainThread` function.
- NSString: add `stringFromDate:format:timeZone:` function.
- NSString: add `stringFromDate:style:timeZone:` function.

This version also fix some unit tests.

## 2.0.0

### Breaking

- CGSize: `CGSizeAdjustToCGRect` has be changed to `CGSizeAdjustToCGRect`.
- CGSize: The logic behind `CGSizeAdjustToCGSize` has been mergely improved.
- Function `iOS7Delta` has been removed.
- UIView: Getters and setters for receiver's frame are now attributes and no longer functions.
- NSObject: Remove deprecated functions `performBlock:afterDelay:completion:` and `performBlock:afterDelay`.
- UIDevice: Function `platform` has been renamed `currentPlatform`.
- UIDevice: Function `platformString` has been renamed `currentPlatformName`.
- UIDevice: Functions `isSlowDevice` and `isIPad` are now properties.

### Enhancements

- NSDate: fix minor Timezone Bug in `currentDayDate`
- Improve swift compatibility for all classes and functions!
- The test project is now coded in Swift.
- NSString: add `randomString` function.
- NSString: add `isNumeric` property.
- NSString: `isAlpaNumeric`, `isEmail`, `isPhoneNumber` are now properties.
- NSString: add `lastOccuranceForPattern` function.
- UIColor: `colorFromHexString` now returns nil if parameter is nil.
- DKHelper: `VALID` also returns nil if the key is nil or an instance of NSNull.
- DKHelper: `GET_NUMBER` now use the `en_US` locale to convert a string into a date object.
- CGRect: add `CGRectSetInsideContainer` function.
- CGRect: fix minor bugs by using standard CGRectGet functions.
- DKRegex: improve file extension.
- NSBundle: `numberEntryInPListForKey` now uses the `en_US` locale.
- UIView: `matchParentConstraints` now returns an array of `NSLayoutConstraints`.
- UIView: `loadFromNib` avoid crash when invalid nib name.
- UIScreen: Fix `is55InchScreen` function.
- NSObject: Function `performBlock:completion:` will now execute the completion block even if the main block is `nil`.
- UIDevice: Add function `platformNameFromString:`.
- UIDevice: Add function `isSlowDeviceForPlatform:`.
- NSPredicate: Swift support of the functions improved.

## 1.0.0

This version fixes crashes in the `performBlock` functions and add many helpers for the NSBundle and NSDate classes.

#### NSBundle

+ (NSString *)stringEntryInPListForKey:(NSString *)key;
+ (BOOL)booleanEntryInPListForKey:(NSString *)key;
+ (NSNumber *)numberEntryInPListForKey:(NSString *)key;

#### NSDate

- (void)logCurrentDateWithDateStyleAndAllTimeStyle:(NSDateFormatterStyle)dateStyle;
- (void)logAllFormats;
- (BOOL)isOlderOrEqualThan:(NSDateComponents *)dateComponent;
- (BOOL)isOlderOrEqualThan:(NSInteger)years months:(NSInteger)months days:(NSInteger)days hours:(NSInteger)
- (BOOL)isOlderOrEqualThanYearInterval:(NSInteger)year;
- (BOOL)isOlderOrEqualThanMonthInterval:(NSInteger)month;
- (BOOL)isOlderOrEqualThanDayInterval:(NSInteger)days;
- (BOOL)isOlderOrEqualThanHourInterval:(NSInteger)hours;
- (BOOL)isOlderOrEqualThanMinuteInterval:(NSInteger)minutes;
- (BOOL)isOlderOrEqualThanSecondInterval:(NSInteger)seconds;

#### NSObject

- Nullable block parameters
- Crash fixes

## 0.9.6

- Add UIImage::resizedImageToSize:

## 0.9.5

- Remove calls to gregorianCalendarIdentifier
- Add NSOperation::addOperationWithBlock:timeout:

## 0.9.4

- Improvement on UIView: now use `CGRectGet` functions.

## 0.9.3

- Bug fix on GET_DATE(NSDictionary *dict, id key)
- Add UIColor::fadeFromBaseColor:ToColor:withPercentage:

## 0.9.2

- Add NSString::strimFromDate:style
- Add DEPRECATED NSObject::performBlock:afterDelay:completion:
- Add DEPRECATED NSObject::performBlock:afterDelay:
- Improve NSDate::fullDisplayTime
- Improve NSDate::hourDisplayTime

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
