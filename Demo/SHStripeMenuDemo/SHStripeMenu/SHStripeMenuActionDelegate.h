//
//  SHStripeMenuActionDelegate.h
//  SHStripeMenu
//
//  Created by Narasimharaj on 08/05/13.
//  Copyright (c) 2013 SimHa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SHStripeMenuActionDelegate <NSObject>

@required
- (void)stripeMenuItemSelected:(NSString *)menuName;

@end
