## SHStripeMenu

It is a leftside menu which will appear either by tapping the stripes or swiping stripes to right. It can be used as an alternative to bottom tabs in the application and gain maximum space to display the content.

It will work on both landscape and portrait mode.

**Screenshots**

![Stripe menu](https://raw.github.com/simhanature/SHStripeMenu/master/screenshots/StripeMenu.png "Stripe Menu")
![Stripe menu](https://raw.github.com/simhanature/SHStripeMenu/master/screenshots/StripesOverContent.png "Stripe Menu Over Content")


**How To Use:**

In your RootViewController.h file, add the following code

```  objc
#import "SHStripeMenuExecuter.h"
#import "SHStripeMenuActionDelegate.h"
```

RootViewController should implement SHStripeMenuActionDelegate, it contains a method to makes sure that menu selection has been handled in the root controller class

```  objc
@interface YourRootViewController : UIViewController<SHStripeMenuActionDelegate>
```

Add the property executer to your RootViewController 

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

**Requirements**
SHStripeMenu requires iOS 5.0+and it uses ARC. It is built using Xcode 4.5+. It is tested on iPhone 3GS(iOS 6.1). It is tested on iPhone simulators for iOS5.0+

Feel free to fork and update the library

**License**
The MIT License
