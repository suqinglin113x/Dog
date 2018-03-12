//
//  MBProgressHUD+Simple.m
//  1001
//
//  Created by 罗义德 on 15/8/1.
//  Copyright (c) 2015年 ChuXiong. All rights reserved.
//

#import "MBProgressHUD+Simple.h"

@implementation MBProgressHUD (Simple)

+ (MBProgressHUD *)showNetWorkProgressWithView:(UIView *)view {
    MBProgressHUD *HUD;
    if (!view) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        HUD = [[MBProgressHUD alloc] initWithView:window];
        [window addSubview:HUD];
    }else {
        HUD = [[MBProgressHUD alloc] initWithView:view];
        [view addSubview:HUD];
    }
    HUD.removeFromSuperViewOnHide = YES;
    return HUD;
}

+ (MBProgressHUD *)showNetWorkProgressWithView:(UIView *)view title:(NSString *)title {
    MBProgressHUD *HUD = [MBProgressHUD showNetWorkProgressWithView:view];
    HUD.labelText = title;
    return HUD;
}

/**
 网络请求数据失败HUD
 */
+ (MBProgressHUD *)showNetWorkFailureWithView:(UIView *)view {
    MBProgressHUD *hud;
    if (!view) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    }else {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = @"获取数据失败...";
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2.0];
    return hud;
}

/**
 网络请求数据失败HUD:自定义文字
 */
+ (MBProgressHUD *)showNetWorkFailureWithView:(UIView *)view title:(NSString *)title {
    MBProgressHUD *hud = [MBProgressHUD showNetWorkFailureWithView:view];
    hud.labelText = title;
    return hud;
}

/**
 网络上传数据成功
 */
+ (MBProgressHUD *)showNetWorkSuccessWithView:(UIView *)view title:(NSString *)title {
    
    MBProgressHUD *HUD;
    if (view) {
        HUD = [[MBProgressHUD alloc] initWithView:view];
        [view addSubview:HUD];
    }else{
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        HUD = [[MBProgressHUD alloc] initWithView:window];
        [window addSubview:HUD];
    }
    
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    if (title) {
        HUD.labelText = title;
    }else{
        HUD.labelText = @"Completed";
    }
    
    [HUD show:YES];
    [HUD hide:YES afterDelay:2];
    
    return HUD;
}

@end
