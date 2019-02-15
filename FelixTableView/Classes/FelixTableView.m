//
//  FelixTableView.m
//  FelixTableView
//
//  Created by weistek on 2019/2/13.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "FelixTableView.h"
@implementation FelixTableView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self == [super initWithFrame:frame]){
        [self setUP];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self == [super initWithFrame:frame style:style]){
        [self setUP];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame emptyDataImage:(UIImage *)emptyDataImage emptyDataTitle:(NSAttributedString *)emptyDataTitle loadingDataImage:(UIImage *)loadingDataImage emptyDataImageTapAction:(void(^)(void))tapAction{
    if (self == [super initWithFrame:frame]){
        [self setUP];
        self.emptyDataImage = emptyDataImage;
        self.emptyDataTitle = emptyDataTitle;
        self.loadingDataImage = loadingDataImage;
        self.emptyDataImageTapAction = tapAction;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style emptyDataImage:(UIImage *)emptyDataImage emptyDataTitle:(NSAttributedString *)emptyDataTitle loadingDataImage:(UIImage *)loadingDataImage emptyDataImageTapAction:(void(^)(void))tapAction{
    if (self == [super initWithFrame:frame style:style]){
        [self setUP];
        self.emptyDataImage = emptyDataImage;
        self.emptyDataTitle = emptyDataTitle;
        self.loadingDataImage = loadingDataImage;
        self.emptyDataImageTapAction = tapAction;
    }
    return self;
}
- (void)setUP{
    self.emptyDataSetDelegate = self;
    self.emptyDataSetSource = self;
    self.tableFooterView = [[UIView alloc] init];
    _cachedPages = [NSMutableDictionary dictionary];
    _minPage = 1;
    _maxPage = 1;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    if (self.emptyDataImageTapAction){
        self.emptyDataImageTapAction();
    }
}
- (CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath: @"transform"];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0.0, 0.0, 1.0)];
    animation.duration = 0.25;
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    return animation;
}
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView{
    return self.isLoading;
}
- (void)setIsLoading:(BOOL)isLoading{
    _isLoading = isLoading;
    [self reloadEmptyDataSet];
}
- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    if(self.isLoading){
        return self.loadingDataImage;
    }else{
        return self.emptyDataImage;
    }
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    return self.emptyDataTitle;
}
- (void)reloadData{
    [super reloadData];
    [self reloadEmptyDataSet];
}
@end
