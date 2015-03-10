//
//  DogeKit.h
//  DogeKitTestProject
//
//  Created by Sam Jarman on 15/01/14.
//  Copyright (c) 2014 Sam Jarman. All rights reserved.
//

#import <UIKit/UIKit.h>



/**
 * DokeKit provides a delgate known as DogeKitDelegate which is useful for controlling the running of DogeKit.
 */


@protocol DogeKitDelegate <NSObject>

@required

/**
 * This method is called for every word extracted from the view hierarchy.
 * @param word The word extracted from the view hierarchy.
 *
 * @return Return YES if the word is to be included in a list of of possible things that Doge can be excited about. Return NO otherwise.
*/
-(BOOL)allowWordInThings:(NSString *)word;

@end

@interface DogeKit : NSObject

/**
 * This property can be set to control the prefixes. The default prefixes are "wow", "such", "very" and "much".
 */
@property (nonatomic, strong) NSMutableArray *prefixes;

/**
 * This property can be set to control the suffixes or "things". The default things are "doge", "shibe", "excite", "impress", "skill" and "warn". To use an automatic system, implement DogeKitDelegate and call -createThings on your instance of DogeKit.
 */
@property (nonatomic, strong) NSMutableArray *things;

/**
 * How long between the adding of each new label.
 */
@property (nonatomic, assign) NSTimeInterval secondsInterval;

/**
 * The view in which the labels will be added to.
 */
@property (nonatomic, strong) UIView *targetView;

/**
 * Whether or not DogeKit is running.
 */
@property (nonatomic, assign, readonly) BOOL isRunning;


/**
 * Minimum size of the font of the labels.
 */
@property (nonatomic, readwrite) CGFloat minSize;

/**
 * Maximum size of the font of the labels.
 */
@property (nonatomic, readwrite) CGFloat maxSize;

/**
 * Whether or not the labels should appear on a random skew.
 */
@property (nonatomic, readwrite) BOOL shouldRotateLabels;


/**
 * The referece to the class that implements the DogeKit Delegate.
 */
@property (nonatomic, strong) id delegate;


-(void) start;
-(void) stop;
-(void) clear;
-(void) toggle;
-(void) createThings;


/**
 * Initializes DogeKit. By default is it not running.
 * @param view The target view in which you want DogeKit to place labels.
 *
 * @return Returns an instance of DogeKit.
 */
-(id)initWithTargetView:(UIView *)view;

/**
 * Gets a shared instance of DogeKit
 * @return Returns an instance of DogeKit.
 */
+(instancetype) sharedInstance;



@end
