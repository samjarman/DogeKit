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

	DogeKit *dk = [[DogeKit alloc] initWithTargetView:self.view]; //Init with a target view

	[dk start]; //Start adding comments to your view

	[dk stop]; //Stop adding comments to your view
	
Extras...
You can set your own 'things' too. These are then printed with prefixes. Prefixes are stored in a mutable array so you can change them as you like. You could consider changing out the prefixes for all the text in the user's current context. Such news. Much stocks. Wow. 

	 dk.things = [NSMutableArray arrayWithObjects:<(id), ...>, nil];
	 
If you really wanted to, you can also clear the labels again thanks to [this pull request](https://github.com/samjarman/DogeKit/pull/1)

    [dk clear];

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

