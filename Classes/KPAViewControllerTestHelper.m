//
//  KPAViewControllerTestHelper.m
//  KPAViewControllerTestHelper
//
//  Created by Klaas Pieter Annema on 14-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "KPAViewControllerTestHelper.h"

@implementation KPAViewControllerTestHelper

+ (UIWindow *)prepareWindowWithRootViewController:(UIViewController *)rootViewController;
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectZero];
    [window makeKeyAndVisible];
    window.rootViewController = rootViewController;
    [self wait];
    return window;
}

+ (void)presentViewController:(UIViewController *)viewController;
{
    UIWindow *window = [self prepareWindowWithRootViewController:[self emptyViewController]];
    [window.rootViewController presentViewController:viewController animated:NO completion:nil];
    [self wait];
}

+ (void)pushViewController:(UIViewController *)viewController;
{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[self emptyViewController]];
    [self prepareWindowWithRootViewController:navigationController];
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
