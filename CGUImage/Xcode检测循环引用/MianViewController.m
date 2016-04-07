//
//  MianViewController.m
//  Xcode检测循环引用
//
//  Created by zjwang on 16/3/30.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "MianViewController.h"

@implementation MianViewController
- (void)viewDidLoad
{
    self.view.backgroundColor =[UIColor whiteColor];
    NSMutableArray *firstArray = [NSMutableArray array];
    NSMutableArray *secondArray = [NSMutableArray array];
    
    [firstArray addObject:secondArray];
    [secondArray addObject:firstArray];
    
    
    __block double j = 0;
    // 前台执行
    dispatch_async(dispatch_get_main_queue(), ^{
        //
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 30)];
        label.backgroundColor = [UIColor lightGrayColor];
        [self.view addSubview:label];
        label.text = [NSString stringWithFormat:@"%f", j];
    });
    // 后台执行
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //
        
        for (double i = 0; i < 100000000; i ++) {
            j = i;
            NSLog(@"%f", i);
        }
        
        
    });
    
}
@end
