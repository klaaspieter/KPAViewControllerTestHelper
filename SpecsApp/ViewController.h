//
//  ViewController.h
//  KPAViewControllerTestHelper
//
//  Created by Klaas Pieter Annema on 18-12-13.
//  Copyright (c) 2013 Annema. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, readwrite, assign) BOOL shouldCrash;
@end
