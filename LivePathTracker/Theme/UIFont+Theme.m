//
//  UIFont+Theme.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/18/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "UIFont+Theme.h"

#define kLabelFontSize 14
#define kGitFont 14
@implementation UIFont (Theme)
+ (UIFont *)labelFont
{
    return [self labelFontOfSize:kLabelFontSize];
}

+ (UIFont *)labelFontOfSize:(CGFloat)size
{
    return [UIFont systemFontOfSize:size];
}
@end
