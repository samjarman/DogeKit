//
//  DogeKit.h
//  DogeKitTestProject
//
//  Created by Sam Jarman on 15/01/14.
//  Copyright (c) 2014 Sam Jarman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DogeKit : NSObject

@property (nonatomic, strong) NSMutableArray *prefixes;
@property (nonatomic, strong) NSMutableArray *things;
@property (nonatomic) NSTimeInterval secondsInterval;
@property (nonatomic, strong) UIView *targetView;

-(void) start;
-(void) stop;
-(id)initWithTargetView:(UIView *)view;
@end
