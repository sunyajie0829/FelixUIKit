//
//  FelixTableView+Pager.h
//  FelixTableView
//
//  Created by weistek on 2019/2/14.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "FelixTableView.h"
@interface FelixTableView (Pager)

/**
 为TableView添加一个翻页扩展

 @param pageSize 每页需要展示的数据量
 @param cachePagePoolSize 共需要缓存多少页
 */
- (void)addPagerWithPageSize:(NSInteger)pageSize cachePagePoolSize:(NSInteger)cachePagePoolSize;

/**
 自动处理TableView的数据源,需要自己进行刷新界面

 @param pageData 请求回来的本页的数据
 @param page 本页的index
 @param dataList TableView的数据源
 */
- (void)processPageData:(NSArray *)pageData page:(NSInteger)page sourceData:(NSMutableArray *)dataList;
@end
