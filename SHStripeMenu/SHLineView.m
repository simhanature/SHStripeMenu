//
//  SHLineView.m
//  SHStripeMenu
//
//  Created by Narasimharaj on 06/05/13.
//  Copyright (c) 2013 SimHa. All rights reserved.
//

#import "SHLineView.h"

@implementation SHLineView

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];

	if (self)
	{
		// Initialization code
	}
	return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
	// Drawing code
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);

	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(context, .8);

	CGContextMoveToPoint(context, 0, 0);							// start at this point
	CGContextAddLineToPoint(context, 0, self.frame.size.height);	// draw to this point

	CGContextMoveToPoint(context, 2.5, 0);							// start at this point
	CGContextAddLineToPoint(context, 2.5, self.frame.size.height);	// draw to this point

	CGContextMoveToPoint(context, 5, 0);							// start at this point
	CGContextAddLineToPoint(context, 5, self.frame.size.height);	// draw to this point

	// and now draw the Path!
	CGContextStrokePath(context);
}

@end