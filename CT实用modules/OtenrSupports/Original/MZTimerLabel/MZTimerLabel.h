//
//  MZTimerLabel.h
//  Version 0.5.1
//  Created by MineS Chan on 2013-10-16
//  Updated 2014-12-15

// This code is distributed under the terms and conditions of the MIT license. 

// Copyright (c) 2014 MineS Chan
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>


/**********************************************
 MZTimerLabel TimerType Enum
 **********************************************/
typedef enum{
    MZTimerLabelTypeStopWatch,
    MZTimerLabelTypeTimer
}MZTimerLabelType;

/**********************************************
 Delegate Methods
 @optional
 
 - timerLabel:finshedCountDownTimerWithTimeWithTime:
    ** MZTimerLabel Delegate method for finish of countdown timer

 - timerLabel:countingTo:timertype:
    ** MZTimerLabel Delegate method for monitering the current counting progress
 
 - timerlabel:customTextToDisplayAtTime:
    ** MZTimerLabel Delegate method for overriding the text displaying at the time, implement this for your very custom display formmat
**********************************************/
 
@class MZTimerLabel;
@protocol MZTimerLabelDelegate <NSObject>
@optional
-(void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime;
-(void)timerLabel:(MZTimerLabel*)timerLabel countingTo:(NSTimeInterval)time timertype:(MZTimerLabelType)timerType;
-(NSString*)timerLabel:(MZTimerLabel*)timerLabel customTextToDisplayAtTime:(NSTimeInterval)time;
@end

/**********************************************
 MZTimerLabel Class Defination
 **********************************************/

@interface MZTimerLabel : UILabel;

/*Delegate for finish of countdown timer */
@property (nonatomic,weak) id<MZTimerLabelDelegate> delegate;

/*Time format wish to display in label
 时间格式希望显示在标签*/
@property (nonatomic,copy) NSString *timeFormat;

/*Target label obejct, default self if you do not initWithLabel nor set
 目标标签obejct,默认自己如果不initWithLabel也没有设置*/
@property (nonatomic,strong) UILabel *timeLabel;

/*Used for replace text in range
 用于替换文本范围*/
@property (nonatomic, assign) NSRange textRange;

@property (nonatomic, strong) NSDictionary *attributedDictionaryForTextInRange;

/*Type to choose from stopwatch or timer
 类型选择秒表或计时器*/
@property (assign) MZTimerLabelType timerType;

/*Is The Timer Running?
 计时器运行吗?*/
@property (assign,readonly) BOOL counting;

/*Do you want to reset the Timer after countdown?
 你想要重置计时器倒计时之后?*/
@property (assign) BOOL resetTimerAfterFinish;

/*Do you want the timer to count beyond the HH limit from 0-23 e.g. 25:23:12 (HH:mm:ss) 
 你想让定时器计数超出了HH限制从0-23例如25:23:12(HH:mm:ss)*/
@property (assign,nonatomic) BOOL shouldCountBeyondHHLimit;

#if NS_BLOCKS_AVAILABLE
@property (copy) void (^endedBlock)(NSTimeInterval);
#endif


/*--------Init methods to choose
 Init方法选择*/
-(id)initWithTimerType:(MZTimerLabelType)theType;
-(id)initWithLabel:(UILabel*)theLabel andTimerType:(MZTimerLabelType)theType;
-(id)initWithLabel:(UILabel*)theLabel;
/*--------designated Initializer
 指定初始化*/
-(id)initWithFrame:(CGRect)frame label:(UILabel*)theLabel andTimerType:(MZTimerLabelType)theType;

/*--------Timer control methods to use
 使用定时器控制方法*/
-(void)start;
#if NS_BLOCKS_AVAILABLE
-(void)startWithEndingBlock:(void(^)(NSTimeInterval countTime))end; //use it if you are not going to use delegate如果你不使用它将使用委托
#endif
-(void)pause;
-(void)reset;

/*--------Setter methods*/
-(void)setCountDownTime:(NSTimeInterval)time;
-(void)setStopWatchTime:(NSTimeInterval)time;
-(void)setCountDownToDate:(NSDate*)date;

-(void)addTimeCountedByTime:(NSTimeInterval)timeToAdd;

/*--------Getter methods*/
- (NSTimeInterval)getTimeCounted;
- (NSTimeInterval)getTimeRemaining;
- (NSTimeInterval)getCountDownTime;
//使用方法请看giehub＝＝＝https://github.com/mineschan/MZTimerLabel

/*
 Manual
 
 Download or clone MZTimerLabel, add MZTimerLabel.h and MZTimerLabel.m source files into your project.
 #import "MZTimerLabel.h" whereever you need it.
 CocoaPods
 
 (Unfamiliar with CocoaPods yet? It's a dependency management tool for iOS and Mac, check it out!)
 
 Add pod 'MZTimerLabel' to your podfiles
 Carthage
 
 Another dependency manager is Carthage, which does not have a centralized repository.
 
 Add github "mineschan/MZTimerLabel" to your Cartfile
 Easy Example
 
 To use MZTimerLabel as a stopwatch and counter, you need only 2 lines.
 
 MZTimerLabel *stopwatch = [[MZTimerLabel alloc] initWithLabel:aUILabel];
 [stopwatch start];
 Easy? If you are looking for a timer, things is just similar.
 
 MZTimerLabel *timer = [[MZTimerLabel alloc] initWithLabel:aUILabel andTimerType:MZTimerLabelTypeTimer];
 [timer setCountDownTime:60];
 [timer start];
 Now the timer will start counting from 60 to 0 ;)
 
 Custom Appearance
 
 As MZTimerLabel is a UILabel subclass, you can directly allocate it as a normal UILabel and customize timeLabel property just like usual.
 
 MZTimerLabel *redStopwatch = [[MZTimerLabel alloc] init];
 redStopwatch.frame = CGRectMake(100,50,100,20);
 redStopwatch.timeLabel.font = [UIFont systemFontOfSize:20.0f];
 redStopwatch.timeLabel.textColor = [UIColor redColor];
 [self.view addSubview:redStopwatch];
 [redStopwatch start];
 MZTimerLabel uses 00:00:00 (HH:mm:ss) as time format, if you prefer using another format such as including milliseconds.Your can set your time format like below.
 
 timerExample4.timeFormat = @"HH:mm:ss SS";
 
 Control the timer
 
 You can start,pause,reset your timer with your custom control, set your control up and call these methods:
 
 -(void)start;
 -(void)pause;
 -(void)reset;
 Getter and Setters
 
 You may control the time value and behaviours at the begining or during runtime with these properties and methods
 
 @property (assign) BOOL shouldCountBeyondHHLimit;   //see example #12
 @property (assign) BOOL resetTimerAfterFinish;      //see example #7
 
 -(void)setCountDownTime:(NSTimeInterval)time;
 -(void)setStopWatchTime:(NSTimeInterval)time;
 -(void)setCountDownToDate:(NSDate*)date;
 -(void)addTimeCountedByTime:(NSTimeInterval)timeToAdd; //see example #10, #11
 And if you want to have information of the timer, here is how.
 
 @property (assign,readonly) BOOL counting;  //see example #4-7
 
 - (NSTimeInterval)getTimeCounted;    //see example #3
 - (NSTimeInterval)getTimeRemaining;  //see example #3
 - (NSTimeInterval)getCountDownTime;
 Timer Finish Handling
 
 Usually when you need a timer, you need to deal with it after it finished. Following are 2 examples showing how to do it using delegate and block methods.
 
 Delegate
 
 First, set the delegate of the timer label.
 
 timer.delegate = self;
 
 And then implement MZTimerLabelDelegate protocol in your dedicated class
 
 @interface ViewController : UIViewController<MZTimerLabelDelegate>
 
 Finally, implement the delegate method timerLabel:finshedCountDownTimerWithTimeWithTime:
 
 -(void)timerLabel:(MZTimerLabel*)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
 //time is up, what should I do master?
 }
 Blocks
 
 Block is a very convenient way to handle the callbacks, MZTimerLabel makes your life even easier.
 
 MZTimerLabel *timer = [[MZTimerLabel alloc] initWithLabel:aUILabel andTimerType:MZTimerLabelTypeTimer];
 [timer3 setCountDownTime:60];
 [timer startWithEndingBlock:^(NSTimeInterval countTime) {
 //oh my gosh, it's awesome!!
 }];
 Or set it seperately
 
 [timer3 setCountDownTime:60];
 timer.endedBlock = ^(NSTimeInterval countTime) {
 //oh my gosh, it's awesome!!
 };
 [timer start];
 More Examples
 
 Please check the demo project I provided, with well explained example code inside.
 
 License
 
 This code is distributed under the terms and conditions of the MIT license.
 
 What's coming up next?
 
 Submit to CocaPods
 Better performance.
 Your suggestions!:D
 
 */


@end


