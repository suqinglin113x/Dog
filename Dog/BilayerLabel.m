//
//  BilayerLabel.m
//  Dog
//
//  Created by Lin on 2018/2/23.
//  Copyright © 2018年 国恒金服. All rights reserved.
//

#import "BilayerLabel.h"

@interface BilayerLabel ()

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) UILabel *maskLabel;

@property (nonatomic, strong) CALayer *maskLayer;

@property (nonatomic, strong) UIColor *maskTextColor;

@property (nonatomic, strong) UIColor *maskBackgroundColor;

@end
@implementation BilayerLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.maskLabel];
    }
    return self;
}
@end
