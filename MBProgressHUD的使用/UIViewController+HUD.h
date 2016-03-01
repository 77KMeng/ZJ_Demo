//
//  UIViewController+HUD.h
//  MBProgressHUD的使用
//
//  Created by Mac on 16/2/29.
//  Copyright © 2016年 77K. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHint:(NSString *)hint yOffset:(float)yOffset;


@end
