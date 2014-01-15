//
//  DogeKit.m
//  DogeKitTestProject
//
//  Created by Sam Jarman on 15/01/14.
//  Copyright (c) 2014 Sam Jarman. All rights reserved.
//

#import "DogeKit.h"
@interface DogeKit ()
@property (nonatomic, strong) NSTimer *timer;
@end


@implementation DogeKit

- (id)init {
    self = [super init];
    
    if (self) {
        // initialize instance variables here
        self.prefixes = [NSMutableArray arrayWithObjects:@"wow", @"such", @"very", @"much", nil];
        self.things = [NSMutableArray arrayWithObjects:@"doge", @"shibe", @"excite", @"impress", @"skill", @"warn", nil];
        self.secondsInterval = 0.5;
    }
    
    return self;
}

-(id)initWithTargetView:(UIView *)view{
    self = [[DogeKit alloc] init];
    self.targetView = view;
    return self;
    
}

-(void) start{
    if ([self.timer isValid]) {
        return;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.secondsInterval target:self selector:@selector(drawText) userInfo:nil repeats:YES];
    
}
-(void) stop{
    [self.timer invalidate];
    
}

-(void) drawText{
    UILabel *label = [[UILabel alloc] init];
    
    //Text
    NSString *prefix = self.prefixes[arc4random()%self.prefixes.count];
    NSString *thing = self.things[arc4random()%self.things.count];

    if ([prefix isEqualToString:@"wow"]) {
        label.text = prefix;
    } else {
        label.text = [NSString stringWithFormat:@"%@ %@", prefix, thing];
    }
    
    [label sizeToFit];
    
    //Position
    float x = (float) (arc4random() %  (int) self.targetView.frame.size.width);
    float y = (float) (arc4random() %  (int) self.targetView.frame.size.height);
    [label setFrame:CGRectMake(x, y, self.targetView.frame.size.width, self.targetView.frame.size.width)];
    
    //Color
    label.textColor = [UIColor colorWithRed:arc4random()%255 / 255.0 green:arc4random()%255 / 255.0 blue:arc4random()%255 / 255.0 alpha:1];
    
    //Font
    label.font = [UIFont fontWithName:@"ChalkboardSE-Regular" size:15];
    
    
    [self.targetView addSubview:label];
}



@end
