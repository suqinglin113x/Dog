//
//  LyricLabel.m
//  Dog
//
//  Created by Lin on 2018/2/23.
//  Copyright © 2018年 国恒金服. All rights reserved.
//

#import "LyricLabel.h"


@interface LyricLabel ()

@property (nonatomic, strong, readwrite) UILabel *textL;

@property (nonatomic, strong, readwrite) UILabel *maskL;

@property (nonatomic, strong) UIColor *maskTextColor;

@property (nonatomic, strong) UIColor *maskBackgroundColor;

@property (nonatomic, strong) CALayer *maskLayer;
@end

@implementation LyricLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textL];
        [self addSubview:self.maskL];
        [self setupDefault];
    }
    return self;
}

- (void)setupDefault
{
    self.maskTextColor = [UIColor orangeColor];
    self.maskBackgroundColor = [UIColor clearColor];
    
    self.maskL.textColor = self.maskTextColor;
    self.maskL.backgroundColor = self.maskBackgroundColor;
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.bounds = CGRectMake(0, 0, 0, CGRectGetHeight(self.bounds));
    maskLayer.position = CGPointMake(0, CGRectGetHeight(self.bounds) / 32);
    maskLayer.anchorPoint = CGPointMake(0, 0.5);
    maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    self.maskL.layer.mask = maskLayer;
    self.maskLayer = maskLayer;
    
    
}

- (void)startlyricAnimationWithTimeArr:(NSArray *)timeArr andLocationArr:(NSArray *)locationArray
{
    CGFloat totalDuration = [[timeArr lastObject] floatValue];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"bounds.size.width"];
    
    NSMutableArray *keyTimeArr = [NSMutableArray array];
    NSMutableArray *widthArr = [NSMutableArray array];
    
    for (int i = 0; i < timeArr.count; i++) {
        CGFloat tempTime = [timeArr[i] floatValue] / totalDuration;
        [keyTimeArr addObject: @(tempTime)];
        CGFloat temWidth = [locationArray[i] floatValue] *CGRectGetWidth(self.bounds);
        [widthArr addObject:@(temWidth)];
    }
    animation.values = widthArr;
    animation.keyTimes = keyTimeArr;
    animation.duration = totalDuration;
    animation.calculationMode = kCAAnimationLinear;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = YES;
    [self.maskLayer addAnimation:animation forKey:@"animation"];
    
    
    
}

- (void)stopAnimation
{
    [self.maskLayer removeFromSuperlayer];
}


- (UILabel *)textL
{
    if (_textL == nil) {
        _textL = [[UILabel alloc] initWithFrame:self.bounds];
    }
    return _textL;
}

- (UILabel *)maskL
{
    if (_maskL == nil) {
        _maskL = [[UILabel alloc] initWithFrame:self.bounds];
    }
    return _maskL;
}

@end
