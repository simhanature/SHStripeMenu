//
//  UIApplication+AppDimensions.h
//  SHStripeMenuDemo
//
//  Created by Narasimharaj on 09/05/13.
//  Copyright (c) 2013 SimHa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (AppDimensions)
+ (CGSize)currentSize;
+ (CGSize)sizeInOrientation:(UIInterfaceOrientation)orientation;
@end