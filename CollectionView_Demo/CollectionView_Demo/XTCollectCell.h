//
//  XTCollectCell.h
//  CollectionView_Demo
//
//  Created by zjwang on 16/5/26.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XTCollectCell : UICollectionViewCell
@property (nonatomic, strong) UILabel *labelText;

@property (nonatomic, strong) UIButton *btnDelete;

@property (nonatomic, copy) void(^btnClickDeleteBlock)();
@end
