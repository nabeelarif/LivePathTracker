//
//  LivePathTrackerTheme.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/18/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 This class controls the theme of the whole application from a single point. applyTheme method 
 could be called from addDidFinishLaunchingWithOptions: so that app's theme is set.
 */
@interface LivePathTrackerTheme : NSObject
+ (void)applyTheme;
@end
