//
//  FelixPageContentViewController.h
//  FelixUIKit
//
//  Created by weistek on 2019/2/19.
//  Copyright © 2019 weistek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JXCategoryView/JXCategoryView.h>
NS_ASSUME_NONNULL_BEGIN

/**
 分页controller的类，其他类可继承该类进行界面的布局
 */
@interface FelixPageContentViewController : UIViewController<JXCategoryListContentViewDelegate>

@end

NS_ASSUME_NONNULL_END
