
//  RootViewController.m
//  KPAViewControllerTestHelper
//
//  Created by Klaas Pieter Annema on 29/08/14.
//  Copyright (c) 2014 Annema. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@end

@implementation RootViewController

- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
{
    return NO;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;
{
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
    [viewControllerToPresent beginAppearanceTransition:YES animated:flag];
    [viewControllerToPresent endAppearanceTransition];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion;
{
    [super dismissViewControllerAnimated:flag completion:completion];
    UIViewController *presentedViewController = self.presentedViewController;
    [presentedViewController beginAppearanceTransition:NO animated:flag];
    [presentedViewController endAppearanceTransition];
}

@end
