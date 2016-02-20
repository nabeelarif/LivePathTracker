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
#import "BigButton.h"

@class UIButtonLabel;
@implementation LivePathTrackerTheme
+ (void)applyTheme
{
    [self applyThemeToTableCells];
    [self applyThemeToStatusBar];
    [self applyThemeToNavigationBar];
    [self applyThemeToViews];
}

+ (void)applyThemeToTableCells
{
    //Applay theme to UITableView
    //    [[UITableView appearance] setBackgroundColor:[UIColor appColorWithLightness:0.95]];
    
    // Apply effects to general label
    [[UILabel appearanceWhenContainedIn:PathCell.class, nil]
     setFont:UIFont.labelFont];
    [[UILabel appearanceWhenContainedIn:PathCell.class, nil]
     setTextColor:UIColor.labelColor];
    //    [[UITableViewCell appearance]
    //     setBackgroundColor:[UIColor appColorWithLightness:0.95]];
    
    //Selected background Appearance
    UIView *selectionView = [UIView new];
    selectionView.backgroundColor = [UIColor appColorWithLightness:0.95];
    [[PathCell appearance] setSelectedBackgroundView:selectionView];
    
    // Title label
    [[TitleLabel appearanceWhenContainedIn:PathCell.class, nil]
     setFont:[UIFont labelFontOfSize:23]];
    [[TitleLabel appearanceWhenContainedIn:PathCell.class, nil]
     setShadowColor:[UIColor lightGrayColor]];
    [[TitleLabel appearanceWhenContainedIn:PathCell.class, nil]
     setShadowOffset:CGSizeMake(0., 1.)];
    //    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
    //     setTextColor:[UIColor appColorWithLightness:0.2]];
    [[TitleLabel appearanceWhenContainedIn:PathCell.class, nil] setTextColor:[UIColor colorWithHex:@"#800000" alpha:1.]];
    
    
    
}
+(void)applyThemeToViews
{
    
    // Set progress tint color
    [[UIActivityIndicatorView appearance] setColor:[UIColor appColorWithLightness:0.1]];
    
    //UISearchBar
    [[UISearchBar appearance] setTintColor:[UIColor appColorWithLightness:0.2]];
    
    //UIButton
    [[BigButton appearanceWhenContainedInInstancesOfClasses:@[HomeViewController.class]] setBackgroundColor:[UIColor appColorWithLightness:0.2]];
    [[BigButton appearance] setTitleColor:[UIColor appColorWithLightness:0.95] forState:UIControlStateNormal];
    
    //header footer view
    [[UITableViewHeaderFooterView appearance] setTintColor:[UIColor appColorWithLightness:0.2]];
    [[UILabel appearanceWhenContainedInInstancesOfClasses:@[UITableViewHeaderFooterView.class]] setTextColor:[UIColor appColorWithLightness:0.95]];
    
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
    //Apply theme to UIBarbuton
    [[UIBarButtonItem appearance] setTintColor:[UIColor appColorWithLightness:0.2]];
    UIImage *barButtonBkg = [self imageFromColor:[UIColor appColorWithLightness:0.8]];
    [[UIBarButtonItem appearance] setBackgroundImage:barButtonBkg
                                            forState:UIControlStateNormal
                                               style:UIBarButtonItemStylePlain
                                          barMetrics:UIBarMetricsDefault];
}

+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
