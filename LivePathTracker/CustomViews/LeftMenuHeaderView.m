//
//  LeftMenuHeaderView.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/21/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "LeftMenuHeaderView.h"

@implementation LeftMenuHeaderView

+ (instancetype)instantiateFromNib
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"%@", [self class]] owner:nil options:nil];
    return [views firstObject];
}

@end
