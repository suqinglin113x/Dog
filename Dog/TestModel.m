//
//  TestModel.m
//  Dog
//
//  Created by Lin on 2018/1/30.
//  Copyright © 2018年 国恒金服. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

- (id)copyWithZone:(NSZone *)zone
{
    TestModel *model = [[TestModel allocWithZone:zone] init];
    return model;
}
@end
