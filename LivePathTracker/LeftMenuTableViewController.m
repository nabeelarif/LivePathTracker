//
//  LeftMenuTableViewController.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/21/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "LeftMenuTableViewController.h"
#import "UIScrollView+VGParallaxHeader.h"
#import "LeftMenuHeaderView.h"
#import "UIColor+Theme.h"
#import "UIViewController+ECSlidingViewController.h"

@interface LeftMenuTableViewController ()

@property (nonatomic, strong) LeftMenuHeaderView *headerView;

@end

@implementation LeftMenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headerView = [LeftMenuHeaderView instantiateFromNib];
    [self.tableView setParallaxHeaderView:self.headerView
                                     mode:VGParallaxHeaderModeTopFill
                                   height:120];
    
    self.headerView.imageView.layer.cornerRadius = 10.0;
    self.headerView.imageView.clipsToBounds = YES;
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //Adjust Left Menu to fill menu area
    CGRect frame = self.view.frame;
    frame.size.width = [[UIScreen mainScreen] bounds].size.width-self.slidingViewController.anchorRightPeekAmount;
    self.view.frame = frame;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.tableView shouldPositionParallaxHeader];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    UIImageView *theImageView = (UIImageView*)[cell viewWithTag:3];
    if (theImageView) {
        theImageView.image = [theImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
}
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // only works for iOS 7+
//    self.tableView.contentInset = UIEdgeInsetsMake(20.0, 0.0, 0.0, 0.0);
}
- (IBAction)unwindToMenuViewController:(UIStoryboardSegue *)segue { }
@end
