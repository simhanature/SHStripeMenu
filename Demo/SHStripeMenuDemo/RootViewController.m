//
//  RootViewController.m
//  SHStripeMenuDemo
//
//  Created by Narasimharaj on 09/05/13.
//  Copyright (c) 2013 SimHa. All rights reserved.
//

#import "RootViewController.h"
#import "NewsViewController.h"
#import "SocialViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) SHStripeMenuExecuter * executer;	// SHStripeMenu code
@property (nonatomic, strong) NewsViewController * newsViewController;
@property (nonatomic, strong) SocialViewController * socialViewController;


@end

@implementation RootViewController

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

-(void)switchToView:(NSString*)name
{
    if ([name isEqualToString:@"news"]) {
        if (_newsViewController==nil) {
            _newsViewController = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
            [self.view addSubview:_newsViewController.view];
        }
        [self.view bringSubviewToFront:_newsViewController.view];
    }
    else {
        if (_socialViewController==nil) {
            _socialViewController = [[SocialViewController alloc] initWithNibName:@"SocialViewController" bundle:nil];
            [self.view addSubview:_socialViewController.view];
        }
        [self.view bringSubviewToFront:_socialViewController.view];
    }
    
}

// SHStripeMenu code
- (void)stripeMenuItemSelected:(NSString *)menuName
{
	if ([menuName isEqualToString:@"home"])
	{
		[self switchToView:@"news"];
	}
	else 
	{
		[self switchToView:@"social"];
	}
}

@end