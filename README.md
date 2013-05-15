SHStripeMenu
===

It is a leftside menu which will appear either by tapping the stripes or swiping stripes to right. It can be used as an alternative to bottom tabs in iOS and utilize the maximum space to the views.

How To Use:
===

In your BaseViewController.h file, add the following code

```  objc
//base.h
#import "SHStripeMenuExecuter.h"
#import "SHStripeMenuActionDelegate.h"
```

BaseViewController should implement SHStripeMenuActionDelegate, it contains a method to makes sure that menu selection has been handled in the base controller class

```  objc
@interface YourBaseViewController : UIViewController<SHStripeMenuActionDelegate>
```

Add the property executer to your BaseViewController 

``` objc
@property (nonatomic, strong) SHStripeMenuExecuter	*executer; 
```

Initialize 'executer' in your viewDidLoad function
``` objc
if (_executer == nil)
		_executer = [[SHStripeMenuExecuter alloc] init];
	[_executer setupToParentView:self];
```


Add method that is declared in protocol SHStripeMenuActionDelegate, it is where you will receive the menu action
```  objc
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
```

Add the library folder SHStripeMenu to your project

You can add/remove/update your menu items in the file 'menu_info.plist'
Add icons for your menu as mentioned in menu_info.plist

Don't forget to add "QuartzCore.framework" to your project.

Feel free to fork and update the library
