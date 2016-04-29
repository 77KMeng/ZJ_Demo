//
//  TableViewCell.h
//  YYWebImageDemo
//
//  Created by zjwang on 4/29/16.
//  Copyright © 2016 夏天. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYAnimatedImageView.h>
#import <YYKit.h>
@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *webImageView;
@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) UILabel *label;
- (void)setImageURL:(NSURL *)url;
@end
