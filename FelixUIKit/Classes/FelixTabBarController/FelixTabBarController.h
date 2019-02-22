//
//  FelixTabbarController.h
//  FelixUIKit
//
//  Created by weistek on 2019/2/18.
//  Copyright © 2019 weistek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
NS_ASSUME_NONNULL_BEGIN

@interface FelixTabBarController : UITabBarController
@property (nonatomic,strong) UIImageView *tabBarIV;

/**
 创建一个FelixTabbarController

 @param titles tabBar上按钮的标题数组，如果为空，那么图片会填充当前按钮，否则图片占比为0.6，标题占比0.3
 @param font tabBar上按钮的字体
 @param titleColor tabBar上按钮的字体颜色
 @param selTitleColor tabBar上按钮选中的字体颜色
 @param imageNames tabBar上按钮的图标
 @param selectedImageNames tabBar上按钮选中时的图标
 @return 返回一个FelixTabbarController对象
 */
- (instancetype)initWithTitles:(NSArray<NSString *> *)titles titleFont:(UIFont *)font titleColor:(UIColor *)titleColor selTitleColor:(UIColor *)selTitleColor imageNames:(NSArray<NSString *> *)imageNames selectedImageNames:(NSArray<NSString *> *)selectedImageNames;

/**
 显示Tabbar栏

 @param animate 显示的时候是否显示动画
 */
- (void)showTabbarAnimate:(BOOL)animate;
/**
 隐藏Tabbar栏
 
 @param animate 隐藏的时候是否显示动画
 */
- (void)hideTabbarAnimate:(BOOL)animate;

/**
 选择tabBar上的某个按钮

 @param index 按钮的index,从0开始
 */
- (void)customSelectIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
