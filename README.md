DogeKit for iOS - Dogeumentation
=======


DogeKit was inspired by [this project.](http://visualidiot.com/articles/doge) It's meant for a laugh during those times in development where things just aren't going your way. Other good use could be an easter egg. 

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

### Pull Requests? 
I'd love them!

### Comments?
Let's hear them! (The nice ones please!)


### Me? 
In case you're interested I'm [@samjarman](http://twitter.com/samjarman)

![Doge](http://weknowmemes.com/generator/uploads/generated/g1387468120607223108.jpg)

