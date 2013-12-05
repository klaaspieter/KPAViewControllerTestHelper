//
//  KPAViewControllerTestHelper.m
//  KPAViewControllerTestHelper
//
//  Created by Klaas Pieter Annema on 14-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "KPAViewControllerTestHelper.h"

@implementation KPAViewControllerTestHelper

+ (void)presentViewController:(UIViewController *)viewController;
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectZero];
    [window makeKeyAndVisible];
    UIViewController *mainViewController = [[UIViewController alloc] init];
    mainViewController.view = [[UIView alloc] init];
    window.rootViewController = mainViewController;
    [mainViewController presentViewController:viewController animated:NO completion:nil];
}

+ (void)pushViewController:(UIViewController *)viewController;
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectZero];
    [window makeKeyAndVisible];
    window.rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
}

@end
