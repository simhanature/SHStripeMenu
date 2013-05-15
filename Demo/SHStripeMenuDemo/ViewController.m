//
//  ViewController.m
//  SHStripeMenuDemo
//
//  Created by Narasimharaj on 09/05/13.
//  Copyright (c) 2013 SimHa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) SHStripeMenuExecuter *executer;	// SHStripeMenu code

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	// SHStripeMenu code
	if (_executer == nil)
		_executer = [[SHStripeMenuExecuter alloc] init];
	[_executer setupToParentView:self];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

// SHStripeMenu code
- (void)stripeMenuItemSelected:(NSString *)menuName
{
	if ([menuName isEqualToString:@"home"])
	{
		// 
	}
	else if ([menuName isEqualToString:@"graph"])
	{
		// 
	}
	else if ([menuName isEqualToString:@"chat"])
	{
		// 
	}
}

@end