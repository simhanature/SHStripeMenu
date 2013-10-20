//
//  SHStripeMenuViewController.m
//  SHStripeMenu
//
//  Created by Narasimharaj on 26/04/13.
//  Copyright (c) 2013 SimHa. All rights reserved.
//

#import "SHStripeMenuViewController.h"
#import "SHMenuItem.h"
#import "UIApplication+AppDimensions.h"

#import <QuartzCore/QuartzCore.h>

@interface SHStripeMenuViewController () <UIGestureRecognizerDelegate, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView		*menuTableView;
@property (nonatomic, weak) IBOutlet UITableViewCell	*cellForMenu;
@property (nonatomic, retain) NSMutableArray			*items;

@end

@implementation SHStripeMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

	if (self)
	{
		// Custom initialization
	}
	return self;
}

- (void)setupGestures
{
	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidePanel:)];
    [gestureRecognizer setCancelsTouchesInView:NO];
	[gestureRecognizer setDelegate:self];
	[self.view addGestureRecognizer:gestureRecognizer];
    
	UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeReceived:)];
	[panRecognizer setDelegate:self];
	[self.view addGestureRecognizer:panRecognizer];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
	// ignore the touch
	if (touch.view.superview)
		if ([touch.view.superview isKindOfClass:[UITableViewCell class]])
			return NO;

	return YES;	// handle the touch
}

- (void)swipeReceived:(id)sender
{
	[self.delegate hideMenu];
}

- (void)hidePanel:(id)sender
{
	CGPoint location	= [(UITapGestureRecognizer *) sender locationInView:[[(UITapGestureRecognizer *) sender view] superview]];
	UIView	*tappedView = [self.view hitTest:location withEvent:nil];	// UITableViewCellContentView

	if ([tappedView isEqual:self.view])									// tappedView will be instance of UITableViewCellContentView on cliking menu item
		[self.delegate hideMenu];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
	[self setupMenuItems];
	[self setupGestures];
	[self setTableView];
}

- (void)setTableView
{
	[_menuTableView setFrame:CGRectMake(0,
			([UIApplication currentSize].height - ROW_HEIGHT * [self.items count]) / 2,
			MENU_WIDTH,
			ROW_HEIGHT * [self.items count])];														// + 88

	[self.menuTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

	_menuTableView.scrollEnabled = FALSE;

	_menuTableView.backgroundColor	= [UIColor clearColor];	// [UIColor whiteColor];
	_menuTableView.opaque			= NO;
	_menuTableView.backgroundView	= nil;
	_menuTableView.alpha			= 1;
}

- (void)setupMenuItems
{
	NSString	*filePath	= [[NSBundle mainBundle] pathForResource:@"menu_info" ofType:@"plist"];
	NSArray		*menuArray	= [[NSArray alloc] initWithContentsOfFile:filePath];

	self.items = [NSMutableArray array];

	for (NSDictionary *item in menuArray) {
		SHMenuItem *menuItem = [SHMenuItem initWithName:[item objectForKey:@"name"] andImage:[UIImage imageNamed:[item objectForKey:@"image"]]];
		[self.items addObject:menuItem];
	}

	// self.items = [NSMutableArray arrayWithArray:array];
	[self.menuTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.items count];
}

- (UITableViewCell *)tableView:(UITableViewCell *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *menuCellID = @"menuCell";

	_cellForMenu = [self.menuTableView dequeueReusableCellWithIdentifier:menuCellID];

	if (_cellForMenu == nil)
		[[NSBundle mainBundle] loadNibNamed:@"SHMenuCell" owner:self options:nil];

	UIImageView *cellImage	= (UIImageView *)[_cellForMenu viewWithTag:1];
	UILabel		*cellName	= (UILabel *)[_cellForMenu viewWithTag:2];

	if ([_items count] > 0)
	{
		SHMenuItem *menuItem = [_items objectAtIndex:indexPath.row];
		cellImage.image = [menuItem image];
		cellName.text	= [menuItem name];
	}

	UIView *myView = [[UIView alloc] init];
	myView.backgroundColor				= [UIColor colorWithRed:.1 green:.1 blue:.1 alpha:1];
	_cellForMenu.backgroundView			= myView;
	_cellForMenu.backgroundView.alpha	= .9;

	CGRect frame = _cellForMenu.frame;
	frame.size.width	= MENU_WIDTH;
	_cellForMenu.frame	= frame;

	if ([self.items count] == 1)
	{
		// Create the path (with only the top-right corner rounded)
		UIBezierPath *maskPathRight = [UIBezierPath bezierPathWithRoundedRect	:_cellForMenu.bounds
													byRoundingCorners			:UIRectCornerTopRight | UIRectCornerBottomRight
													cornerRadii					:CGSizeMake(10.0, 10.0)];

		// Create the shape layer and set its path
		CAShapeLayer *maskLayerRight = [CAShapeLayer layer];
		maskLayerRight.frame	= _cellForMenu.bounds;
		maskLayerRight.path		= maskPathRight.CGPath;

		_cellForMenu.layer.mask = maskLayerRight;
	}
	else
	{
		if ([indexPath row] == 0)
		{
			// Create the path (with only the top-right corner rounded)
			UIBezierPath *maskPathTopRight = [UIBezierPath	bezierPathWithRoundedRect	:_cellForMenu.bounds
															byRoundingCorners			:UIRectCornerTopRight
															cornerRadii					:CGSizeMake(10.0, 10.0)];

			// Create the shape layer and set its path
			CAShapeLayer *maskLayerTopRight = [CAShapeLayer layer];
			maskLayerTopRight.frame = _cellForMenu.bounds;
			maskLayerTopRight.path	= maskPathTopRight.CGPath;

			_cellForMenu.layer.mask = maskLayerTopRight;
		}

		if (indexPath.row == [self.items count] - 1)
		{
			// Create the path (with only the bottom-left corner rounded)
			UIBezierPath *maskPathBottomRight = [UIBezierPath	bezierPathWithRoundedRect	:_cellForMenu.bounds
																byRoundingCorners			:UIRectCornerBottomRight
																cornerRadii					:CGSizeMake(10.0, 10.0)];

			// Create the shape layer and set its path
			CAShapeLayer *maskLayerBottomRight = [CAShapeLayer layer];
			maskLayerBottomRight.frame	= _cellForMenu.bounds;
			maskLayerBottomRight.path	= maskPathBottomRight.CGPath;

			_cellForMenu.layer.mask = maskLayerBottomRight;
		}

		if (([indexPath row] > 0) && (indexPath.row < [self.items count] - 1))
		{
			// Create the path (with only the bottom-left corner rounded)
			UIBezierPath *maskPathSquare = [UIBezierPath	bezierPathWithRoundedRect	:_cellForMenu.bounds
															byRoundingCorners			:UIRectCornerAllCorners
															cornerRadii					:CGSizeMake(0, 0)];

			// Create the shape layer and set its path
			CAShapeLayer *maskLayerSquare = [CAShapeLayer layer];
			maskLayerSquare.frame	= _cellForMenu.bounds;
			maskLayerSquare.path	= maskPathSquare.CGPath;

			_cellForMenu.layer.mask = maskLayerSquare;
		}
	}

	return _cellForMenu;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return ROW_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// hide panel
	[_delegate hideMenu];
	// send the selected menu item
	[_delegate itemSelected:[_items objectAtIndex:indexPath.row]];
}

@end