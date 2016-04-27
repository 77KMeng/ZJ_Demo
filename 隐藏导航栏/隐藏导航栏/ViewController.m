//
//  ViewController.m
//  隐藏导航栏
//
//  Created by zjwang on 4/27/16.
//  Copyright © 2016 夏天. All rights reserved.
//

#import "ViewController.h"
#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height
#define cellIdentifier @"cellId"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) UITableView *tableViewScroll;
@property (nonatomic, assign) double recordDistance; /**<记录滑动的距离>*/
@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UIButton *btn;
@end

@implementation ViewController
- (UITableView *)tableViewScroll
{
    if (_tableViewScroll == nil) {
        _tableViewScroll = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStylePlain];
        _tableViewScroll.delegate = self;
        _tableViewScroll.dataSource = self;
        [_tableViewScroll registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    }
    return _tableViewScroll;
    
}
- (UIView *)customView
{
    if (_customView == nil) {
        _customView = [[UIView alloc] initWithFrame:CGRectMake(0, 44, screenWidth, 30)];
        _customView.backgroundColor = [UIColor lightGrayColor];
    }
    return _customView;
}
- (UIButton *)btn
{
    if (_btn == nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(screenWidth - 70, 5, 40, 20);
        [_btn setTitle:@"关注" forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:13];
        _btn.backgroundColor = [UIColor greenColor];
    }
    return _btn;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 155;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld条 %@", (long)indexPath.row, @"这是测试数据"];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableViewScroll];
    [self.navigationController.navigationBar addSubview:self.customView];
    [self.customView addSubview:self.btn];
    self.title = @"这是一个测试页";
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
}
// 减速停止的时候
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 记录滑动距离
    self.recordDistance = scrollView.contentOffset.y;
    NSLog(@"histroy_y ======== %lf", self.recordDistance);
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"y ======= %lf", scrollView.contentOffset.y);
    scrollView.contentOffset.y > self.recordDistance ? scrollView.contentOffset.y < self.recordDistance ? [self.navigationController setNavigationBarHidden:NO animated:YES]:[self.navigationController setNavigationBarHidden:YES animated:YES] : [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    // [self.customView setHidden:YES] UIViewAnimationCurveEaseOut
//     scrollView.contentOffset.y > self.recordDistance ? scrollView.contentOffset.y < self.recordDistance ? ([UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
//         //
//     } completion:^(BOOL finished) {
//         //
//         [self.customView setHidden:NO];
//     }]):([UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
//         //
//     } completion:^(BOOL finished) {
//         //
//         [self.customView setHidden:YES];
//     }]):([UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionShowHideTransitionViews animations:^{
//         //
//     } completion:^(BOOL finished) {
//         //
//         [self.customView setHidden:NO];
//     }]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
