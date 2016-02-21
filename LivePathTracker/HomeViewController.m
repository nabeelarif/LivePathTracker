//
//  ViewController.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/18/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "HomeViewController.h"
#import "BigButton.h"
#import <CoreGraphics/CoreGraphics.h>
#import "UIColor+Theme.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet BigButton *btnBeginRun;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) BOOL isFirstTime;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *labelAppName;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.btnBeginRun.alpha = .0;
    self.imageViewIcon.layer.cornerRadius = 5.0;
    self.imageViewIcon.clipsToBounds = YES;
    self.imageViewIcon.alpha = .0;
    self.imageViewIcon.layer.borderWidth = 1.0;
    self.imageViewIcon.layer.borderColor = [UIColor appColorWithLightness:0.2].CGColor;
    self.labelAppName.alpha = .0;
    self.isFirstTime = YES;
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (self.isFirstTime) {
        self.isFirstTime = NO;
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.btnBeginRun.alpha = .0;
        self.btnBeginRun.enabled = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.btnBeginRun.alpha = 1.0;
            self.imageView.alpha = 0.7;
            self.imageViewIcon.alpha = 1.0;
            self.labelAppName.alpha = 1.0;
        } completion:^(BOOL finished) {
            self.btnBeginRun.enabled = YES;
        }];
    }
}
@end
