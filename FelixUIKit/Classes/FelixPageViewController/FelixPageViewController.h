//
//  FelixPageViewController.h
//  FelixUIKit
//
//  Created by weistek on 2019/2/19.
//  Copyright © 2019 weistek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <JXCategoryView/JXCategoryView.h>
NS_ASSUME_NONNULL_BEGIN

@interface FelixPageViewController : UIViewController

/**
 创建一个FelixPageViewController，类似于今日头条、网易新闻等h可左右滑动的PageViewController。其子Controller需要继承FelixPageContentViewController或者遵守JXCategoryListContentViewDelegate协议(需要#import <JXCategoryView/JXCategoryView.h>)

 @param titles PageViewController模块的标题数组
 @param height 标题栏高度
 @param titleColor 普通状态下标题的颜色(默认指示条的颜色和标题选中状态的颜色相同)
 @param selTitleColor 选中状态下标题的颜色(默认指示条的颜色和标题选中状态的颜色相同)
 @param controllerClassList PageViewController模块分别对应的类,由FelixPageViewController自动创建
 @return 返回一个FelixPageViewController对象实例
 */
- (instancetype)initWithTitles:(NSArray<NSString *> *)titles titleHeight:(CGFloat)height titleColor:(UIColor *)titleColor selTitleColor:(UIColor *)selTitleColor controllerClassList:(NSArray<Class> *)controllerClassList;
@end

NS_ASSUME_NONNULL_END
