//
//  FelixTableView+Refresh.h
//  FelixTableView
//
//  Created by weistek on 2019/2/13.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "FelixTableView.h"
#import <MJRefresh/MJRefresh.h>
NS_ASSUME_NONNULL_BEGIN

@interface FelixTableView (Refresh)
/**
 为tableView增加一个上拉刷新，可在block中设置上拉执行的动作
 */
- (void)addPullUpAction:(void(^)(void))pullUpAction;
/**
 为tableView增加一个下拉刷新，可在block中设置下拉执行的动作
 */
- (void)addPullDownAction:(void(^)(void))pullUpAction;
/**
 结束tableView的刷新动作
 */
- (void)endDropUpOrDropDownAnimation;
@end

NS_ASSUME_NONNULL_END
