//
//  DKViewController.m
//  DogeKitTestProject
//
//  Created by Sam Jarman on 15/01/14.
//  Copyright (c) 2014 Sam Jarman. All rights reserved.
//

#import "DKViewController.h"
#import "DogeKit.h"
@interface DKViewController ()
@property (nonatomic, strong) DogeKit *dk;
@end

@implementation DKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.dk = [[DogeKit alloc] initWithTargetView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDogeKit:(id)sender {
    [self.dk start];

}

- (IBAction)stopDogeKit:(id)sender {
    [self.dk stop];
}
@end
