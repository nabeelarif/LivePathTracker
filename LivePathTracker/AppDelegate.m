//
//  AppDelegate.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/18/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>
#import "LivePathTrackerTheme.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Set core data stack using MagicRecord Api
    [MagicalRecord setupCoreDataStack];
    // Apply theme for the application
    [LivePathTrackerTheme applyTheme];
    return YES;
}
@end
