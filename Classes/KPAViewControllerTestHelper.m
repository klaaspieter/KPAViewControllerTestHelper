//
//  KPAViewControllerTestHelper.m
//  KPAViewControllerTestHelper
//
//  Created by Klaas Pieter Annema on 14-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "KPAViewControllerTestHelper.h"

static NSMutableArray *KPAViewControllerTestHelperWindows = nil;

@implementation KPAViewControllerTestHelper

+ (NSArray *)createdWindows;
{
    return [KPAViewControllerTestHelperWindows copy];
}

+ (UIWindow *)prepareWindowWithRootViewController:(UIViewController *)rootViewController;
{
    if (!KPAViewControllerTestHelperWindows) {
        KPAViewControllerTestHelperWindows = [NSMutableArray array];
    }

    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectZero];
    [window makeKeyAndVisible];
    window.rootViewController = rootViewController;
    [self wait];
    [KPAViewControllerTestHelperWindows addObject:window];
    return window;
}

+ (void)presentViewController:(UIViewController *)viewController;
{
    [self makeViewControllerVisible:viewController inContainerViewController:[self emptyViewController] presentationBlock:^(UIViewController *containerViewController, UIViewController *viewController) {
        [containerViewController presentViewController:viewController animated:NO completion:nil];
    }];
}

+ (void)pushViewController:(UIViewController *)viewController;
{
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[self emptyViewController]];
    [self makeViewControllerVisible:viewController inContainerViewController:navigationController presentationBlock:^(UIViewController *containerViewController, UIViewController *viewController) {
        [navigationController pushViewController:viewController animated:NO];
    }];
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

+ (void)makeViewControllerVisible:(UIViewController *)viewController inContainerViewController:(UIViewController *)containerViewController presentationBlock:(ContainerViewControllerPresentationBlock)presentationBlock; {
    [self prepareWindowWithRootViewController:containerViewController];
    presentationBlock(containerViewController, viewController);
    [self wait];
}

+ (void)tearDown;
{
    for (UIWindow *window in KPAViewControllerTestHelperWindows) {
        window.hidden = true;
    }
    [self wait];
    KPAViewControllerTestHelperWindows = [NSMutableArray array];
}

@end
