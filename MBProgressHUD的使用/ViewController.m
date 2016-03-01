//
//  ViewController.m
//  MBProgressHUD的使用
//
//  Created by Mac on 16/2/29.
//  Copyright © 2016年 77K. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "UIViewController+HUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
    [self networkReq];
    
    
}
- (void)networkReq
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"www.baidu.com" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self showHint:@"失败" yOffset:-100];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
