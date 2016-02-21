//
//  MainViewController.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/21/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "MainViewController.h"
#import "MainSlidingAnimationcontroller.h"

@interface MainViewController () <ECSlidingViewControllerDelegate>

@property (nonatomic, strong) MainSlidingAnimationcontroller *defaultSlidingAnimationController;

@end

@implementation MainViewController

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setUp
{
    self.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping;
    self.anchorRightPeekAmount = 55;
}
-(id<UIViewControllerAnimatedTransitioning>)slidingViewController:(ECSlidingViewController *)slidingViewController animationControllerForOperation:(ECSlidingViewControllerOperation)operation topViewController:(UIViewController *)topViewController
{
    if(_defaultSlidingAnimationController) return _defaultSlidingAnimationController;
    _defaultSlidingAnimationController = [MainSlidingAnimationcontroller new];
    return _defaultSlidingAnimationController;
}

@end
