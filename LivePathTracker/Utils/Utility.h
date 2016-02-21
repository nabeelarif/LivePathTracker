//
//  Utility.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/19/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;
@class UIColor;

@interface Utility : NSObject

+ (NSString *)stringifyDistance:(float)meters;
+ (NSString *)stringifySecondCount:(int)seconds usingLongFormat:(BOOL)longFormat;
+ (NSString *)stringifyAvgPaceFromDist:(float)meters overTime:(int)seconds;
+ (NSDateFormatter*)dateFormatter;
+ (NSArray *)colorSegmentsForLocations:(NSArray *)locations;
+ (UIImage *)imageFromColor:(UIColor *)color;

@end
