//
//  DogeKit.h
//  DogeKitTestProject
//
//  Created by Sam Jarman on 15/01/14.
//  Copyright (c) 2014 Sam Jarman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DogeKit : NSObject

@property (nonatomic, strong) NSMutableArray *prefixes;
@property (nonatomic, strong) NSMutableArray *things;
@property (nonatomic, assign) NSTimeInterval secondsInterval;
@property (nonatomic, strong) UIView *targetView;
@property (nonatomic, assign, readonly) BOOL isRunning;

@property (nonatomic, readwrite) CGFloat minSize;
@property (nonatomic, readwrite) CGFloat maxSize;

@property (nonatomic, readwrite) BOOL shouldRotateLabels;

-(void) start;
-(void) stop;
-(void) clear;
-(id)initWithTargetView:(UIView *)view;

@end
