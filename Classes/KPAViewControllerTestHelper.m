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
    window.rootViewController = viewController;
}

+ (void)pushViewController:(UIViewController *)viewController;
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectZero];
    [window makeKeyAndVisible];
    window.rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
}

@end
