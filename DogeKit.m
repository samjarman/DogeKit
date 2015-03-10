//
//  DogeKit.m
//  DogeKitTestProject
//
//  Created by Sam Jarman on 15/01/14.
//  Copyright (c) 2014 Sam Jarman. All rights reserved.
//

#define kDEFAULT_MIN_FONT   13
#define kDEGREES_TO_RADIANS(x) ((x) * M_PI / 180.0)

#import "DogeKit.h"
@interface DogeKit ()
@property (nonatomic, assign, readwrite) BOOL isRunning;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *labels;
@property (nonatomic, weak) id<UIApplicationDelegate> appDelegate;
@end


@implementation DogeKit

+ (instancetype)sharedInstance {
    static DogeKit *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];
        _shared.appDelegate = [[UIApplication sharedApplication] delegate];
    });
    
    _shared.targetView = _shared.appDelegate.window.subviews.lastObject;
    
    return _shared;
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.prefixes = [NSMutableArray arrayWithObjects:@"wow", @"such", @"very", @"much", nil];
        self.things = [NSMutableArray arrayWithObjects:@"doge", @"shibe", @"excite", @"impress", @"skill", @"warn", nil];
        self.secondsInterval = 0.5;
        self.labels = [[NSMutableArray alloc] init];
        self.minSize = nanf(NULL);
        self.maxSize = nanf(NULL);
    }
    
    return self;
}

- (id)initWithTargetView:(UIView *)view {
    self = [[DogeKit alloc] init];
    self.targetView = view;
    return self;
}



- (NSArray *)listSubviewsOfView:(UIView *)view {
    NSMutableArray *views = [NSMutableArray array];
    NSArray *subviews = [view subviews];
    
    if ([subviews count] == 0) return nil;
    
    for (UIView *subview in subviews) {
        [views addObject:subview];
        [views addObjectsFromArray:[self listSubviewsOfView:subview]];
    }
    
    return views;
}
- (void)createThings {
    
    NSMutableArray *finalWords = [NSMutableArray array];
    NSArray *views = [self listSubviewsOfView:self.targetView];
    NSString *allText = @"";

    for (UIView *view in views) {

        if ([view isKindOfClass:[UITextView class]]) {
            UITextView *tv = (UITextView *)view;
            allText = [allText stringByAppendingString:tv.text];
        }
        if ([view isKindOfClass:[UILabel class]]) {
            UITextView *tv = (UITextView *)view;
            allText = [allText stringByAppendingString:tv.text];
        }
        //Add other texty things here
    }
    NSArray *words = [allText componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    for (__strong NSString  *word in words){
        word = [word stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
        if ([self.delegate allowWordInThings:word]) {
            [finalWords addObject:word];
        }
    }
   
    
    self.things = finalWords;
    NSLog(@"%@", [self.things componentsJoinedByString:@", "]);
}





- (void)start {
    if (self.isRunning) return;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.secondsInterval target:self selector:@selector(drawText) userInfo:nil repeats:YES];
    self.isRunning = YES;
}

- (void)stop {
    if (!self.isRunning) return;
    
    [self.timer invalidate];
    self.timer = nil;
    self.isRunning = NO;
}

- (void)clear {
    NSArray *labels = self.labels.copy;
    [self.labels removeAllObjects];
    [labels enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL *stop) {
        [label removeFromSuperview];
    }];
}

- (void)toggle {
    if (self.isRunning) {
        [self stop];
        [self clear];
    } else {
        [self start];
    }
}

- (void)drawText {

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    
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
    
    CGFloat fontSize;
    if (! isnan(self.minSize))
    {
        if (! isnan(self.maxSize))
        {
            fontSize = (arc4random() % (int)(self.maxSize - self.minSize)) + self.minSize;
        }
        else
        {
            fontSize = (arc4random() % (int)self.minSize) + self.minSize;
        }
    }
    else
    {
        fontSize = (arc4random() % kDEFAULT_MIN_FONT) + kDEFAULT_MIN_FONT;
    }
    
    //Font (between 12 and 23)
    label.font = [UIFont fontWithName:@"ChalkboardSE-Regular" size:fontSize];
    
    //Resize
    [label sizeToFit];
    
    //Position
    int relativeWidth = self.targetView.frame.size.width - label.frame.size.width;
    CGFloat x = (CGFloat) (arc4random() % relativeWidth);
    CGFloat y = (CGFloat) (arc4random() % (int) self.targetView.frame.size.height);
    
    label.frame = CGRectMake(x, y, label.frame.size.width, label.frame.size.height);
    
    if (self.shouldRotateLabels)
    {
        CGFloat randomAngle = arc4random() % 90;
        // Randomly rotate from 315º to 45º
        label.transform = CGAffineTransformMakeRotation(kDEGREES_TO_RADIANS(315 + randomAngle));
    }
    
    [self.labels addObject:label];
    [self.targetView addSubview:label];
}

@end
