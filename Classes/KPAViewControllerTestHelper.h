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

// To be called in tearDown, or your test framework's equivalent.
// KPAViewControllerTestHelper works by creating a new window for every view controller
// under test. Windows are expensive objects to maintain so cleaning them up after every
// test makes your test suite run faster.
// It is not required, but highly recommended, to call this method after every test.
+ (NSArray *)createdWindows;
+ (void)tearDown;

@end
