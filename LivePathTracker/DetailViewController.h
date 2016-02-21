//
//  DetailViewController.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/20/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PathModel;
/**
 A view controller with a Map. It displays the archived Tracks or Journeys of the user. It is 
 launched when user clicks on any item in Activity controller list. The journey of the user is 
 shown on the map with a multi color line.
 */
@interface DetailViewController : UIViewController
@property (nonatomic,strong) PathModel *currentPathModel;
@end
