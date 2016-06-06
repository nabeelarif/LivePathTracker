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
#import <MapKit/MapKit.h>
#import "Utility.h"

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
    self.btnBeginRun.layer.cornerRadius = 75.0;
    
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
- (IBAction)actionLetsGo:(id)sender {
    
    if ([Utility isNetworkConnected]==NO) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Error" message:@"Please check your network connection." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    if ([CLLocationManager locationServicesEnabled] == NO) {
        NSLog(@"locationServicesEnabled false");
        UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Location Services Disabled" message:@"You currently have all location services for this device disabled. To enable, please go to Settings->Privacy->Location Services" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [servicesDisabledAlert show];
    } else {
        CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
        
        if(authorizationStatus == kCLAuthorizationStatusDenied || authorizationStatus == kCLAuthorizationStatusRestricted){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enable Location Service" message:@"You have to enable the Location Service to use this App. To enable, please go to Settings->Privacy->Location Services" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        } else {
            [self performSegueWithIdentifier:@"PathViewController" sender:self];
        }
    }
}
@end
