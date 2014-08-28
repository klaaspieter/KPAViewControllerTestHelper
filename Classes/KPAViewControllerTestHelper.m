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
    window.rootViewController = [self emptyViewController];
    [window.rootViewController presentViewController:viewController animated:NO completion:nil];
    [self wait];
}

+ (void)pushViewController:(UIViewController *)viewController;
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectZero];
    [window makeKeyAndVisible];
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:[self emptyViewController]];
    window.rootViewController = navigationController;
    [navigationController pushViewController:viewController animated:NO];
    [self wait];
}

+ (void)dismissViewController:(UIViewController *)viewController;
{
    [viewController dismissViewControllerAnimated:NO completion:nil];
    [self wait];
}

+ (void)presentAndDismissViewController:(UIViewController *)viewController;
{
    [self presentViewController:viewController];
    [self dismissViewController:viewController];
}

+ (void)wait;
{
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
}

+ (UIViewController *)emptyViewController;
{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view = [[UIView alloc] init];
    return viewController;
}

@end
