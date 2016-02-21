//
//  UIColor+Theme.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/18/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
  A category of UIColor customized for Go Time app and provide different theme color
  combinations.
 */
@interface UIColor (Theme)
/**
 @return UIColor for general label
 */
+(UIColor*)labelColor;
/**
 @return UIColor for table View's background
 */
+(UIColor*)tableViewCellBackgroundColor;
/**
 @param lightness 1 being white and 0 being black, you can choose any shade of app's theme color
 @return UIColor representing specified lightness
 */
+(UIColor*)appColorWithLightness:(CGFloat)lightness;
/**
 @param lightness 1 being white and 0 being black, you can choose any shade of app's theme color
 @param alpha Alpha value of color
 @return UIColor representing specified lightness
 */
+(UIColor*)appColorWithLightness:(CGFloat)lightness alpha:(CGFloat)alpha;

#pragma mark - Util
+ (UIColor*)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
+ (UIColor*)colorWithHex:(NSString*)hex alpha:(CGFloat)alpha;
@end
