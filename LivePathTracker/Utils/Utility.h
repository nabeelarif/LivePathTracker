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
/**
Converts distance in meters to specified unit and returns a string value.
 @param meters distance in meters
 @return string to represent the distance in KM/MI
 */
+ (NSString *)stringifyDistance:(float)meters;
/**
 Generate a human readable string from specified duration in seonds
 @param seconds Duration in seconds
 @param longFormat YES to have a longer format or no otherwise
 @return A human readable string of time
 */
+ (NSString *)stringifySecondCount:(int)seconds usingLongFormat:(BOOL)longFormat;
/**
 Calculates and returns human readable string value of average paced based on specified 
 distance and duration
 @param meters Distance in meters
 @param seconds Duration in seconds
 @return String value of average pace
 */
+ (NSString *)stringifyAvgPaceFromDist:(float)meters overTime:(int)seconds;
/**
 Returns a general date formatter used throughout the app.
 @return A date formatter
 */
+ (NSDateFormatter*)dateFormatter;
/**
 Method to divide the path of Map into different segments based on the speed.
 Fastest is Green, Slowest is Red and Medium is yellow.
 @param locations An array of PathModel objects
 @return An array of MulticolorPolylineSegment each object may have different color based on its 
 speed
 */
+ (NSArray *)colorSegmentsForLocations:(NSArray *)locations;
/**
 Creates an image of specified color
 @param color UIColor object
 @return UIImage of specified color
 */
+ (UIImage *)imageFromColor:(UIColor *)color;
/**
 @return YES if network is connected otherwise NO
 */
+ (BOOL)isNetworkConnected;

@end
