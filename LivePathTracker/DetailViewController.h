//
//  DetailViewController.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/20/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PathModel;
@interface DetailViewController : UIViewController
@property (nonatomic,strong) PathModel *currentPathModel;
@end
