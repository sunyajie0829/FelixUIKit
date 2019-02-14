//
//  FelixTableView+Refresh.m
//  FelixTableView
//
//  Created by weistek on 2019/2/13.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "FelixTableView+Refresh.h"

@implementation FelixTableView (Refresh)
- (void)addPullUpAction:(void (^)(void))pullUpAction{
    NSAssert(pullUpAction != nil, @"pull up action should not be nil");
    MJRefreshAutoNormalFooter *fotter = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:pullUpAction];
    self.mj_footer = fotter;
}
- (void)addPullDownAction:(void (^)(void))pullDownAction{
    NSAssert(pullDownAction != nil, @"pull down action should not be nil");
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:pullDownAction];
    self.mj_header = header;
}
- (void)endDropUpOrDropDownAnimation{
    if (self.mj_footer){
        [self.mj_footer endRefreshing];
    }
    if (self.mj_header){
        [self.mj_header endRefreshing];
    }
}
@end
