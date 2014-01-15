//
//  DogeKit.m
//  DogeKitTestProject
//
//  Created by Sam Jarman on 15/01/14.
//  Copyright (c) 2014 Sam Jarman. All rights reserved.
//

#import "DogeKit.h"
@interface DogeKit ()
@property (nonatomic, assign, readwrite) BOOL isRunning;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *labels;
@end


@implementation DogeKit

- (id)init {
    self = [super init];
    
    if (self) {
        // initialize instance variables here
        self.prefixes = [NSMutableArray arrayWithObjects:@"wow", @"such", @"very", @"much", nil];
        self.things = [NSMutableArray arrayWithObjects:@"doge", @"shibe", @"excite", @"impress", @"skill", @"warn", nil];
        self.secondsInterval = 0.5;
        self.labels = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(id)initWithTargetView:(UIView *)view{
    self = [[DogeKit alloc] init];
    self.targetView = view;
    
    return self;
}

-(void) start{
    if (self.isRunning) return;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.secondsInterval target:self selector:@selector(drawText) userInfo:nil repeats:YES];
    self.isRunning = YES;
}

-(void) stop{
    if (!self.isRunning) return;
    
    [self.timer invalidate];
    self.timer = nil;
    self.isRunning = NO;
}

-(void) clear{
    NSArray *labels = self.labels.copy;
    [self.labels removeAllObjects];
    [labels enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
        [label removeFromSuperview];
    }];
}

-(void) drawText{
    //Position
    CGFloat x = (CGFloat) (arc4random() % (int) self.targetView.frame.size.width);
    CGFloat y = (CGFloat) (arc4random() % (int) self.targetView.frame.size.height);

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, 0.0f, 0.0f)];
    
    //Text
    NSString *prefix = self.prefixes[arc4random()%self.prefixes.count];
    NSString *thing = self.things[arc4random()%self.things.count];

    if ([prefix isEqualToString:@"wow"]) {
        label.text = prefix;
    } else {
        label.text = [NSString stringWithFormat:@"%@ %@", prefix, thing];
    }
    
    //Color
    label.textColor = [UIColor colorWithRed:arc4random()%255 / 255.0f green:arc4random()%255 / 255.0f blue:arc4random()%255 / 255.0f alpha:1.0f];
    
    //Font (between 12 and 23)
    label.font = [UIFont fontWithName:@"ChalkboardSE-Regular" size:((arc4random()%(24-12))+12)];
    
    //Resize
    [label sizeToFit];
    
    [self.labels addObject:label];
    [self.targetView addSubview:label];
}

@end
