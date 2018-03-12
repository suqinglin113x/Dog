//
//  MBProgressHUD+Simple.h
//  1001
//
//  Created by 罗义德 on 15/8/1.
//  Copyright (c) 2015年 ChuXiong. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Simple)

/**
 网络请求过程HUD
 */
+ (MBProgressHUD *)showNetWorkProgressWithView:(UIView *)view;
+ (MBProgressHUD *)showNetWorkProgressWithView:(UIView *)view title:(NSString *)title;

/**
 网络请求数据失败HUD
 */
+ (MBProgressHUD *)showNetWorkFailureWithView:(UIView *)view;

/**
 网络请求数据失败HUD:自定义文字
 */
+ (MBProgressHUD *)showNetWorkFailureWithView:(UIView *)view title:(NSString *)title;

/**
 网络上传数据成功
 */
+ (MBProgressHUD *)showNetWorkSuccessWithView:(UIView *)view title:(NSString *)title;

@end
