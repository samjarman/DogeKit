DogeKit for iOS - Dogeumentation
=======

![Example](http://i.imgur.com/wHyo2gn.png)


DogeKit was inspired by [this project.](http://visualidiot.com/articles/doge) Use it as you like. 

###Installation
If you use Cocoapods:
`pod 'DogeKit'`
then `#include "DogeKit.h"`

If not, just copy DogeKit.h and DogeKit.m into your project, and whereever you'd like to use it, just include it. 

	#include "DogeKit.h"


###Usage

```objc 
DogeKit *dk = [[DogeKit alloc] initWithTargetView:self.view]; //Init with a target view

[dk start]; //Start adding comments to your view

[dk stop]; //Stop adding comments to your view
```
	
Or you can use the `sharedInstance`. So you can have DogeKit supported all throughout your application if you want.

For example you can set it up so no matter what view you are in, if you tap on the navigation bar (or something) DogeKit will be triggered

*In AppDelegate or somewhere*


```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
	
	// Add gesture recognizer to toggle DogeKit if two figer tap 
	// is done on navigation bar
	UITapGestureRecognizer *superTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleDogeKit)];
       superTap.numberOfTapsRequired = 1;
       superTap.numberOfTouchesRequired = 2;
       [navigationController.navigationBar addGestureRecognizer:superTap];
       
	return YES;
}

// More AppDelegate Code...

- (void)toggleDogeKit {
    [[DogeKit sharedInstance] toggle];
}	
```

### Extras
You can set your own 'things' too. These are then printed with prefixes. Prefixes are stored in a mutable array so you can change them as you like. You could consider changing out the prefixes for all the text in the user's current context. Such news. Much stocks. Wow. 

```objc
dk.things = [NSMutableArray arrayWithObjects:<(id), ...>, nil];
``` 
#### DogeKitDelegate

'Things' get even more powerful when you implement the DogeKitDelgate.

```objc
// After initilization

dk.delegate = self;
[dk createThings]; //Will traverse your hierarchy and pull out words and feed them to your delegate method.

#pragma mark -
#pragma mark DogeKitDelegate methods

-(BOOL)allowWordInThings:(NSString *)word{
    if (word.length > 4) { //A very simple filter
        return YES;
    } else return NO;
}
```

#### Clearing
If you really wanted to, you can also clear the labels again thanks to [this pull request](https://github.com/samjarman/DogeKit/pull/1)

```objc
[dk clear];
```

#### Label control.
You can control the rotation and size of the lables with the `minSize`, `maxSize` and `shouldRotateLabels` properties thanks to [these pull requests](https://github.com/samjarman/DogeKit/pulls/fjcaetano).



### Pull Requests? 
I'd love them!

### Comments?
Let's hear them! (The nice ones please!)


### Me? 
In case you're interested I'm [@samjarman](http://twitter.com/samjarman)

### Using DogeKit?
Simply submit a pull request editing this ReadMe. Or tweet me. 

### Apps using DogeKit:
Who will be first?

![Doge](http://weknowmemes.com/generator/uploads/generated/g1387468120607223108.jpg)

