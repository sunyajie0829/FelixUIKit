//
//  FelixTabbarButton.h
//  FelixUIKit
//
//  Created by weistek on 2019/2/18.
//  Copyright © 2019 weistek. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FelixTabbarButton : UIButton

/**
 图片距离顶端的比例
 */
@property (nonatomic,assign) float paddingTopRatio;
/**
 图片占据当前按钮的比例
 */
@property (nonatomic,assign) float imgRatio;

/**
 创建一个FelixTabbarButton

 @param img 默认状态下的TabbarButton的图标
 @param selImg 选中状态下的TabbarButton的图标
 @param title TabbarButton的标题
 @param titleColor 默认状态下的TabbarButton的标题
 @param selTitleColor 选中状态下的TabbarButton的标题
 @param font TabbarButton的标题的字体
 @return 返回一个FelixTabbarButton对象实例
 */
- (instancetype)initWithImg:(UIImage *)img selImg:(UIImage *)selImg title:(NSString *)title titleColor:(UIColor *)titleColor  selTitleColor:(UIColor *)selTitleColor titleFont:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
