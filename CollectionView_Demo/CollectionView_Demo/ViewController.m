//
//  ViewController.m
//  CollectionView_Demo
//
//  Created by zjwang on 16/5/26.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "ViewController.h"
#import "XTCollectCell.h"
#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *xtCollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, strong) CALayer *dotLayer;
@property (nonatomic, assign) CGFloat endPoint_x;
@property (nonatomic, assign) CGFloat endPoint_y;
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UILongPressGestureRecognizer *longPress;
@end

@implementation ViewController

- (UICollectionView *)xtCollectionView
{
    if (!_xtCollectionView) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.minimumLineSpacing = 1;
        _flowLayout.minimumInteritemSpacing = 1;
        _xtCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, Screen_Width, Screen_Height - 20) collectionViewLayout:_flowLayout];
        _xtCollectionView.dataSource = self;
        _xtCollectionView.backgroundColor = [UIColor colorWithRed:0.8568 green:0.8568 blue:0.8568 alpha:1.0];
        _xtCollectionView.delegate = self;
        [_xtCollectionView registerClass:[XTCollectCell class] forCellWithReuseIdentifier:@"cellIdentiifer"];
    }
    return _xtCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.array.count;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XTCollectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentiifer" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.labelText.text = self.array[indexPath.item];
    //
    __weak __typeof(&*cell) weakCell = cell;
    //
    cell.btnClickDeleteBlock = ^(){
      //
        CGRect parentRect = [weakCell convertRect:weakCell.btnDelete.frame toView:self.view];
        [self joinCartAnimationWithRect:parentRect];
        [_array removeObjectAtIndex:indexPath.item];
        [_xtCollectionView reloadData];
    };
    return cell;
}
#pragma mark -加入购物车动画
-(void) joinCartAnimationWithRect:(CGRect)rect
{
    _endPoint_x = 35;
    _endPoint_y = Screen_Height - 35;
    
    CGFloat startX = rect.origin.x;
    CGFloat startY = rect.origin.y;
    
    _path= [UIBezierPath bezierPath];
    [_path moveToPoint:CGPointMake(startX, startY)];
    
    //三点曲线
    [_path addCurveToPoint:CGPointMake(_endPoint_x, _endPoint_y)
             controlPoint1:CGPointMake(startX, startY)
             controlPoint2:CGPointMake(startX - 180, startY - 200)];
    _dotLayer = [CALayer layer];
    _dotLayer.backgroundColor = [UIColor cyanColor].CGColor;
    _dotLayer.frame = CGRectMake(0, 0, 20, 20);
    _dotLayer.cornerRadius = 5;
    [self.view.layer addSublayer:_dotLayer];
    [self groupAnimation];
}
#pragma mark - 组合动画
-(void)groupAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = _path.CGPath;
    animation.rotationMode = kCAAnimationRotateAuto;
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"alpha"];
    alphaAnimation.duration = 0.5f;
    alphaAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    alphaAnimation.toValue = [NSNumber numberWithFloat:0.1];
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    CAAnimationGroup *groups = [CAAnimationGroup animation];
    groups.animations = @[animation,alphaAnimation];
    groups.duration = 0.8f;
    groups.removedOnCompletion = NO;
    groups.fillMode = kCAFillModeForwards;
    groups.delegate = self;
    [groups setValue:@"groupsAnimation" forKey:@"animationName"];
    [_dotLayer addAnimation:groups forKey:nil];
    [self performSelector:@selector(removeFromLayer:) withObject:_dotLayer afterDelay:0.8f];
}
- (void)removeFromLayer:(CALayer *)layerAnimation{
    
    [layerAnimation removeFromSuperlayer];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(Screen_Width / 3 - 1.5, Screen_Width / 3 - 1);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 1, 1, 1);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.array = [NSMutableArray arrayWithObjects:@"红包", @"转账", @"手机充值", @"芝麻信用",
                  @"天猫", @"生活缴费", @"蚂蚁呗", @"世界那么大",
                  @"余额宝", @"安全快付", @"蚂蚁聚宝", @"哈哈",@"红包1", @"转账1", @"手机充值1", @"芝麻信用1",
                  @"天猫1", @"生活缴费1", @"蚂蚁呗1", @"世界那么大1",
                  @"余额宝1", @"安全快付1", @"蚂蚁聚宝1", @"哈哈1",  nil];
    [self.view addSubview:self.xtCollectionView];
    
    _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressMoving:)];
    
    [self.xtCollectionView addGestureRecognizer:_longPress];
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath
{
    NSIndexPath *selectIndexPath = [self.xtCollectionView indexPathForItemAtPoint:[_longPress locationInView:self.xtCollectionView]];
    // 找到当前的cell
    XTCollectCell *cell = (XTCollectCell *)[self.xtCollectionView cellForItemAtIndexPath:selectIndexPath];
    [cell.btnDelete setHidden:YES];
    [self.array exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
    [self.xtCollectionView reloadData];
}
- (void)lonePressMoving:(UILongPressGestureRecognizer *)longPress
{
    
    switch (_longPress.state) {
        case UIGestureRecognizerStateBegan: {
            {
                NSIndexPath *selectIndexPath = [self.xtCollectionView indexPathForItemAtPoint:[_longPress locationInView:self.xtCollectionView]];
                // 找到当前的cell
                
                XTCollectCell *cell = (XTCollectCell *)[self.xtCollectionView cellForItemAtIndexPath:selectIndexPath];
                [cell.btnDelete setHidden:NO];
                [_xtCollectionView beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
                [self.xtCollectionView updateInteractiveMovementTargetPosition:[longPress locationInView:_longPress.view]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            
            
            
                [self.xtCollectionView endInteractiveMovement];
            break;
        }
        default: [self.xtCollectionView cancelInteractiveMovement];
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
