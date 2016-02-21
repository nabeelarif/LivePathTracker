//
//  UIColor+Theme.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/18/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Theme)
+(UIColor*)labelColor;
+(UIColor*)tableViewCellBackgroundColor;
+(UIColor*)appColorWithLightness:(CGFloat)lightness;
+(UIColor*)appColorWithLightness:(CGFloat)lightness alpha:(CGFloat)alpha;

#pragma mark - Util
+ (UIColor*)colorWith8BitRed:(NSInteger)red green:(NSInteger)green blue:(NSInteger)blue alpha:(CGFloat)alpha;
+ (UIColor*)colorWithHex:(NSString*)hex alpha:(CGFloat)alpha;
@end
