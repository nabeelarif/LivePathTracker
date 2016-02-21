//
//  MainSlidingAnimationcontroller.m
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/21/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import "MainSlidingAnimationcontroller.h"
#import "ECSlidingConstants.h"

@interface MainSlidingAnimationcontroller ()
@property (nonatomic,strong) UIView *viewOverlay;
@property (nonatomic, copy) void (^coordinatorAnimations)(id<UIViewControllerTransitionCoordinatorContext>context);
@property (nonatomic, copy) void (^coordinatorCompletion)(id<UIViewControllerTransitionCoordinatorContext>context);

@end

@implementation MainSlidingAnimationcontroller

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *topViewController = [transitionContext viewControllerForKey:ECTransitionContextTopViewControllerKey];
    UIViewController *toViewController  = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    CGRect topViewInitialFrame = [transitionContext initialFrameForViewController:topViewController];
    CGRect topViewFinalFrame   = [transitionContext finalFrameForViewController:topViewController];
    
    topViewController.view.frame = topViewInitialFrame;
    BOOL enableOverlay = NO;
    if (topViewController != toViewController) {
        enableOverlay = YES;
        CGRect toViewFinalFrame = [transitionContext finalFrameForViewController:toViewController];
        toViewController.view.frame = toViewFinalFrame;
        [containerView insertSubview:toViewController.view belowSubview:topViewController.view];
    }
    if (enableOverlay) {
        self.viewOverlay.frame = topViewController.view.bounds;
        [topViewController.view addSubview:self.viewOverlay];
    }
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        if (self.coordinatorAnimations) self.coordinatorAnimations((id<UIViewControllerTransitionCoordinatorContext>)transitionContext);
        topViewController.view.frame = topViewFinalFrame;
        if (enableOverlay) {
            self.viewOverlay.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        }else{
            self.viewOverlay.backgroundColor = [UIColor clearColor];
        }
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            topViewController.view.frame = [transitionContext initialFrameForViewController:topViewController];
        }
        
        if (self.coordinatorCompletion) self.coordinatorCompletion((id<UIViewControllerTransitionCoordinatorContext>)transitionContext);
        [transitionContext completeTransition:finished];
        if (enableOverlay==NO) {
            [self.viewOverlay removeFromSuperview];
        }else{
            [topViewController.view bringSubviewToFront:self.viewOverlay];
        }
    }];
}

-(UIView *)viewOverlay
{
    if (!_viewOverlay) {
        _viewOverlay = [UIView new];
        _viewOverlay.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        _viewOverlay.userInteractionEnabled = NO;
    }
    return _viewOverlay;
}
-(void)dealloc
{
    [_viewOverlay removeFromSuperview];
    _viewOverlay = nil;
}
@end
