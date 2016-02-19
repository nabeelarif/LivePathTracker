//
//  LivePathTrackerTheme.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/18/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "LivePathTrackerTheme.h"
#import "TitleLabel.h"
#import "UIFont+Theme.h"
#import "UIColor+Theme.h"
#import "HomeViewController.h"

@class UIButtonLabel;
@implementation LivePathTrackerTheme
+ (void)applyTheme
{
    [self applyThemeToTableCells];
    [self applyThemeToStatusBar];
    [self applyThemeToNavigationBar];
}

+ (void)applyThemeToTableCells
{
    //Applay theme to UITableView
    //    [[UITableView appearance] setBackgroundColor:[UIColor appColorWithLightness:0.95]];
    
    // Apply effects to general label
    [[UILabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setFont:UIFont.labelFont];
    [[UILabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setTextColor:UIColor.labelColor];
    //    [[UITableViewCell appearance]
    //     setBackgroundColor:[UIColor appColorWithLightness:0.95]];
    
    //Selected background Appearance
    UIView *selectionView = [UIView new];
    selectionView.backgroundColor = [UIColor appColorWithLightness:0.95];
    [[UITableViewCell appearance] setSelectedBackgroundView:selectionView];
    
    // Title label
    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setFont:[UIFont labelFontOfSize:23]];
    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setShadowColor:[UIColor lightGrayColor]];
    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setShadowOffset:CGSizeMake(0., 1.)];
    //    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
    //     setTextColor:[UIColor appColorWithLightness:0.2]];
    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil] setTextColor:[UIColor colorWithHex:@"#800000" alpha:1.]];
    
    // Set progress tint color
    [[UIActivityIndicatorView appearance] setColor:[UIColor appColorWithLightness:0.1]];
    
    //UISearchBar
    [[UISearchBar appearance] setTintColor:[UIColor appColorWithLightness:0.2]];
    
    //UIButton
    [[UIButton appearanceWhenContainedInInstancesOfClasses:@[ViewController.class]] setBackgroundColor:[UIColor appColorWithLightness:0.2]];
    [[UIButton appearance] setTitleColor:[UIColor appColorWithLightness:0.95] forState:UIControlStateNormal];
    
}

+ (void)applyThemeToStatusBar
{
    //    [UIStatusBar appearance]
}

+ (void)applyThemeToNavigationBar
{
    [[UINavigationBar appearance] setBackgroundColor:[UIColor appColorWithLightness:0.5]];
    [[UINavigationBar appearance] setTintColor:[UIColor appColorWithLightness:0.3]];
    [[UILabel appearanceWhenContainedIn:UINavigationBar.class, nil]
     setTextColor:UIColor.redColor];
    
    // Title attribute
    NSShadow * shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor lightGrayColor];
    shadow.shadowOffset = CGSizeMake(0, -2);
    
    NSDictionary * navBarTitleTextAttributes =
    @{ NSForegroundColorAttributeName : [UIColor appColorWithLightness:0.2],
       NSShadowAttributeName          : shadow,
       NSFontAttributeName            : [UIFont boldSystemFontOfSize:18] };
    
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleTextAttributes];
}
@end
