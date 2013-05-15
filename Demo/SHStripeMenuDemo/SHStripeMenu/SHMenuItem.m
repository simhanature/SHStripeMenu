//
//  SHMenuItem.m
//  SHStripeMenu
//
//  Created by Narasimharaj on 26/04/13.
//  Copyright (c) 2013 SimHa. All rights reserved.
//

#import "SHMenuItem.h"

@implementation SHMenuItem

+ (SHMenuItem *)initWithName:(NSString *)name andImage:(UIImage *)image
{
	return [[self alloc] initWithName:name andImage:image];
}

- (SHMenuItem *)initWithName:(NSString *)name andImage:(UIImage *)image
{
	if (self = [super init])
	{
		_name	= name;
		_image	= image;
	}
	return self;
}

@end