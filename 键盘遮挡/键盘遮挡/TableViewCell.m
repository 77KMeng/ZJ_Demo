//
//  TableViewCell.m
//  键盘遮挡
//
//  Created by zjwang on 16/4/6.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.text1 = [[UITextField alloc] initWithFrame:CGRectMake(55, 5, 200, 30)];
        [self.contentView addSubview:self.text1];
        self.text1.borderStyle = UITextBorderStyleRoundedRect;
        self.text1.placeholder = @"text1";
        
        self.text2 = [[UITextField alloc] initWithFrame:CGRectMake(55, 40, 200, 30)];
        [self.contentView addSubview:self.text2];
        self.text2.borderStyle = UITextBorderStyleRoundedRect;
        self.text2.placeholder = @"text2";
    }
    return self;
}

@end
