//
//  LeftMenuHeaderView.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/21/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftMenuHeaderView : UIView

+ (instancetype)instantiateFromNib;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
