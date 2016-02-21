//
//  UIFont+Theme.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/18/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 A category of UIFont, customized for 'Go Time' app.
 */
@interface UIFont (Theme)
/**
 @return UIFont for UILabel
 */
+ (UIFont *)labelFont;
/**
 @return UIFont of specified size
 */
+ (UIFont *)labelFontOfSize:(CGFloat)size;
@end
