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
    [self.dk addObserver:self forKeyPath:@"isRunning" options:kNilOptions context:nil];
}

- (void)dealloc {
    [self.dk removeObserver:self forKeyPath:@"isRunning"];
}

- (IBAction)startDogeKit:(id)sender {
    [self.dk start];
}

- (IBAction)stopDogeKit:(id)sender {
    [self.dk stop];
}

- (IBAction)clearDogeKit:(id)sender {
    [self.dk clear];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.dk && [keyPath isEqualToString:@"isRunning"]) {
        if (self.dk.isRunning) {
            NSLog(@"Is running");
        } else {
            NSLog(@"Is not running");
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
