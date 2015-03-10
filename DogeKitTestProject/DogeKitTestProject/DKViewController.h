//
//  DKViewController.h
//  DogeKitTestProject
//
//  Created by Sam Jarman on 15/01/14.
//  Copyright (c) 2014 Sam Jarman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DogeKit.h"
@interface DKViewController : UIViewController <DogeKitDelegate>
- (IBAction)startDogeKit:(id)sender;
- (IBAction)stopDogeKit:(id)sender;
- (IBAction)clearDogeKit:(id)sender;

@end
