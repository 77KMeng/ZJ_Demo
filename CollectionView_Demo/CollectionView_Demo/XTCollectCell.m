//
//  XTCollectCell.m
//  CollectionView_Demo
//
//  Created by zjwang on 16/5/26.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "XTCollectCell.h"

@implementation XTCollectCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // label
        [self.contentView addSubview:self.labelText];
        self.labelText.backgroundColor = [UIColor lightGrayColor];
        self.labelText.frame = CGRectMake(20, 20, self.contentView.frame.size.width - 40, self.contentView.frame.size.height - 40);
        self.labelText.textAlignment = NSTextAlignmentCenter;
        // btn
        [self.contentView addSubview:self.btnDelete];
        self.btnDelete.frame = CGRectMake(self.contentView.frame.size.width - 20, 0, 20, 20);
        self.btnDelete.backgroundColor = [UIColor cyanColor];
        self.btnDelete.titleLabel.textColor = [UIColor blackColor];
        [self.btnDelete setTitle:@"X" forState:UIControlStateNormal];
        [self.btnDelete addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (UILabel *)labelText
{
    if (!_labelText) {
        _labelText = [[UILabel alloc] init];
    }
    return _labelText;
}
- (UIButton *)btnDelete
{
    if (!_btnDelete) {
        _btnDelete = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _btnDelete;
}
- (void)btnClick:(UIButton *)btn
{
    self.btnClickDeleteBlock();
}
- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [self.btnDelete setHidden:YES];
    
}
@end
