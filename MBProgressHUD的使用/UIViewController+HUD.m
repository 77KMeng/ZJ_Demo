//
//  UIViewController+HUD.m
//  MBProgressHUD的使用
//
//  Created by Mac on 16/2/29.
//  Copyright © 2016年 77K. All rights reserved.
//

#import "UIViewController+HUD.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <objc/runtime.h>

@implementation UIViewController (HUD)
- (MBProgressHUD *)HUD
{
    static const void *hubKey = &hubKey;
    return objc_getAssociatedObject(self, hubKey);
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint
{
    // 初始化
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    // 文本内容
    hud.labelText = hint;
    [view addSubview:hud];
    [hud show:YES];
}


- (void)showHint:(NSString *)hint yOffset:(float)yOffset
{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hub.userInteractionEnabled = NO;
    hub.mode = MBProgressHUDModeText;
    hub.labelText = hint;
    hub.margin = 10.f;
    hub.yOffset = 200.f;
    hub.yOffset += yOffset;
    hub.removeFromSuperViewOnHide = YES;
    [hub hide:YES afterDelay:2];
}

- (void)hideHud
{
    [[self HUD] hide:YES];
}
@end
