//
//  UIApplication+AppDimensions.m
//  SHStripeMenuDemo
//
//  Created by Narasimharaj on 09/05/13.
//  Copyright (c) 2013 SimHa. All rights reserved.
//

#import "UIApplication+AppDimensions.h"

@implementation UIApplication (AppDimensions)

+ (CGSize)currentSize
{
	return [UIApplication sizeInOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

+ (CGSize)sizeInOrientation:(UIInterfaceOrientation)orientation
{
	CGSize			size			= [UIScreen mainScreen].bounds.size;
	UIApplication	*application	= [UIApplication sharedApplication];

	if (UIDeviceOrientationIsLandscape(orientation))
		size = CGSizeMake(size.height, size.width);

	if (application.statusBarHidden == NO)
		size.height -= MIN(application.statusBarFrame.size.width, application.statusBarFrame.size.height);
	return size;
}

@end