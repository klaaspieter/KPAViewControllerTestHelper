//
//  ViewController.m
//  KPAViewControllerTestHelper
//
//  Created by Klaas Pieter Annema on 18-12-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, readwrite, assign) BOOL didAppear;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated;
{
    [super viewDidAppear:animated];
    self.didAppear = YES;
}

- (void)viewDidDisappear:(BOOL)animated;
{
    [super viewDidDisappear:animated];
    self.didAppear = NO;
}

@end
