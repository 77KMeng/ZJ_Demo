//
//  CollectionViewCell.m
//  键盘遮挡
//
//  Created by zjwang on 16/4/6.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.text1 = [[UITextField alloc] initWithFrame:CGRectMake(5, 5, 80, 30)];
        [self.contentView addSubview:self.text1];
        self.text1.borderStyle = UITextBorderStyleRoundedRect;
        self.text1.placeholder = @"text1";
        
        self.text2 = [[UITextField alloc] initWithFrame:CGRectMake(5, 40, 80, 30)];
        [self.contentView addSubview:self.text2];
        self.text2.borderStyle = UITextBorderStyleRoundedRect;
        self.text2.placeholder = @"text2";
    }
    return self;
}
@end
