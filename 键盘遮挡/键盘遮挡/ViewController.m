//
//  ViewController.m
//  键盘遮挡
//
//  Created by zjwang on 16/4/6.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "ViewController.h"
#import "TPKeyboardAvoiding/TPKeyboardAvoidingTableView.h"
#import "TPKeyboardAvoiding/TPKeyboardAvoidingCollectionView.h"
#import "TableViewCell.h"
#import "CollectionViewCell.h"
#define cellIdentifier @"identifier"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) TPKeyboardAvoidingTableView *X_tableView;
@property (nonatomic, strong) TPKeyboardAvoidingCollectionView *X_collectionView;
@end

@implementation ViewController
- (TPKeyboardAvoidingTableView *)X_tableView
{
    if (_X_tableView == nil) {
        _X_tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _X_tableView;
}
- (TPKeyboardAvoidingCollectionView *)X_collectionView
{
    if (_X_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _X_collectionView = [[TPKeyboardAvoidingCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    }
    return _X_collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.view addSubview:self.X_tableView];
//    _X_tableView.delegate = self;
//    _X_tableView.dataSource = self;
//    [_X_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    _X_collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.X_collectionView];
    _X_collectionView.dataSource = self;
    _X_collectionView.delegate = self;
    [_X_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 30;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 30;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    return cell;
//}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
