//
//  FelixTabbarController.m
//  FelixUIKit
//
//  Created by weistek on 2019/2/18.
//  Copyright © 2019 weistek. All rights reserved.
//
#define FelixTabBarHeight ({CGFloat height = 0.f;if(([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait)|| ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)){height = 49+[[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;}else{height = 32+[[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;}height;})
#import "FelixTabBarController.h"
#import "FelixTabbarButton.h"
@interface FelixTabBarController ()
@end

@implementation FelixTabBarController
{
    BOOL animating;
    BOOL tabBarShowing;
}
- (instancetype)initWithTitles:(NSArray<NSString *> *)titles titleFont:(UIFont *)font titleColor:(UIColor *)titleColor selTitleColor:(UIColor *)selTitleColor imageNames:(NSArray<NSString *> *)imageNames selectedImageNames:(NSArray<NSString *> *)selectedImageNames{
    if (self == [super init]){
        animating = NO;
        tabBarShowing = YES;
        [self initUIWithTitles:titles titleFont:font titleColor:titleColor selTitleColor:selTitleColor imageNames:imageNames selectedImageNames:selectedImageNames];
    }
    return self;
}
- (void)initUIWithTitles:(NSArray<NSString *> *)titles titleFont:(UIFont *)font titleColor:(UIColor *)titleColor selTitleColor:(UIColor *)selTitleColor imageNames:(NSArray<NSString *> *)imageNames selectedImageNames:(NSArray<NSString *> *)selectedImageNames{
    self.tabBar.hidden = YES;
    _tabBarIV = [[UIImageView alloc] init];
    _tabBarIV.userInteractionEnabled = YES;
    [self.view addSubview:_tabBarIV];
    [_tabBarIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(FelixTabBarHeight);
    }];
    //添加半圆形的效果
    [self.view layoutIfNeeded];
    NSMutableArray *bottomBtns = [NSMutableArray array];
    NSAssert((titles.count == imageNames.count) && (imageNames.count == selectedImageNames.count), @"the count of titles and images should be equal");
    for (int i = 0; i < titles.count; i ++){
        FelixTabbarButton *rtbBtn = [[FelixTabbarButton alloc] initWithImg:[UIImage imageNamed:imageNames[i]] selImg:[UIImage imageNamed:selectedImageNames[i]] title:titles[i] titleColor:titleColor selTitleColor:selTitleColor titleFont:font];
        rtbBtn.tag = (i + 1) * 100;
        rtbBtn.imgRatio = titles[i].length > 0 ?  0.6 : 1;
        rtbBtn.paddingTopRatio = titles[i].length > 0 ?  0.1 : 0.1;
        [rtbBtn addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_tabBarIV addSubview:rtbBtn];
        if (i == 0){
            rtbBtn.selected = YES;
        }
        [rtbBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(rtbBtn.superview);
            make.height.mas_equalTo(40);
        }];
        [bottomBtns addObject:rtbBtn];
    }
    [bottomBtns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
}
- (void)customSelectIndex:(NSInteger)index{
    UIButton *sender = [self.tabBarIV viewWithTag:(index + 1) * 100];
    [self tabBarBtnClick:sender];
}
- (void)tabBarBtnClick:(UIButton *)sender{
    sender.selected = YES;
    //切换控制器
    self.selectedIndex = (sender.tag - 100)/100;
    //关闭所有按钮的选中状态
    for (id obj in _tabBarIV.subviews){
        if ([obj isKindOfClass:[FelixTabbarButton class]]){
            if (((FelixTabbarButton *)obj).tag != sender.tag){
                ((FelixTabbarButton *)obj).selected = NO;
            }
        }
    }
}
- (void)showTabbarAnimate:(BOOL)animate
{
    if (!animating && !tabBarShowing){
        if (animate){
            animating = YES;
            __weak typeof(self) weakSelf = self;
            [UIView animateWithDuration:0.3 animations:^{
                [weakSelf.tabBarIV mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self.view).with.offset(0);
                }];
                [self.view layoutIfNeeded];
            } completion:^(BOOL finished) {
                self->animating = NO;
                self->tabBarShowing = YES;
            }];
        }else{
            [_tabBarIV mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.view).with.offset(0);
            }];
            tabBarShowing = YES;
        }
    }
}
- (void)hideTabbarAnimate:(BOOL)animate
{
    if (!animating && tabBarShowing){
        if (animate){
            animating = YES;
            __weak typeof(self) weakSelf = self;
            [UIView animateWithDuration:0.3 animations:^{
                [weakSelf.tabBarIV mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(weakSelf.view.mas_bottom).with.offset(FelixTabBarHeight);
                }];
                [self.view layoutIfNeeded];
            } completion:^(BOOL finished) {
                self->animating = NO;
                self->tabBarShowing = NO;
            }];
        }else{
            [_tabBarIV mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.view.mas_bottom).with.offset(FelixTabBarHeight);
            }];
            tabBarShowing = NO;
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
@end
