//
//  KPAViewControllerTestHelper.h
//  KPAViewControllerTestHelper
//
//  Created by Klaas Pieter Annema on 14-11-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KPAViewControllerTestHelper : NSObject

+ (void)presentViewController:(UIViewController *)viewController;
+ (void)pushViewController:(UIViewController *)viewController;

+ (void)dismissViewController:(UIViewController *)viewController;
+ (void)presentAndDismissViewController:(UIViewController *)viewController;

@end
