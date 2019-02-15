//
//  FelixTableView+Pager.m
//  FelixTableView
//
//  Created by weistek on 2019/2/14.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "FelixTableView+Pager.h"
@implementation FelixTableView (Pager)
- (void)addPagerWithPageSize:(NSInteger)pageSize cachePagePoolSize:(NSInteger)cachePagePoolSize{
    [self setValue:@(pageSize) forKeyPath:@"pageSize"];
    [self setValue:@(cachePagePoolSize) forKeyPath:@"cachePagePoolSize"];
//    self.pageSize = pageSize;
//    self.cachePagePoolSize = cachePagePoolSize;
}
- (void)processPageData:(NSArray *)pageData page:(NSInteger)page sourceData:(NSMutableArray *)dataList{
    NSAssert(pageData.count > 0, @"pageData size must bigger than 0");
    [self getMinAndMaxPage];
    if (page == [self.cachedPages.allKeys.firstObject integerValue]){//缓存当前页
        [self.cachedPages setValue:pageData forKey:[NSString stringWithFormat:@"%ld",page]];
    }else if(page < [self.cachedPages.allKeys.firstObject integerValue]){//请求前面的页面
        if (self.cachedPages.allKeys.count >= self.cachePagePoolSize){//如果缓存已满
            [dataList removeObjectsInArray:[self.cachedPages valueForKey:[NSString stringWithFormat:@"%ld",self.maxPage]]];
            [self.cachedPages removeObjectForKey:[NSString stringWithFormat:@"%ld",self.maxPage]];
        }
        [self.cachedPages setValue:pageData forKey:[NSString stringWithFormat:@"%ld",page]];
        NSMutableArray *tmpData = dataList.mutableCopy;
        [dataList removeAllObjects];
        [dataList addObjectsFromArray:[self.cachedPages valueForKey:[NSString stringWithFormat:@"%ld",page]]];
        [dataList addObjectsFromArray:tmpData];
    }else if(page > [self.cachedPages.allKeys.lastObject integerValue]){//请求后面的页面
        if (self.cachedPages.allKeys.count >= self.cachePagePoolSize){//如果缓存已满
            [dataList removeObjectsInArray:[self.cachedPages valueForKey:[NSString stringWithFormat:@"%ld",self.minPage]]];
            [self.cachedPages removeObjectForKey:[NSString stringWithFormat:@"%ld",self.minPage]];
        }
        [self.cachedPages setValue:pageData forKey:[NSString stringWithFormat:@"%ld",page]];
        [dataList addObjectsFromArray:[self.cachedPages valueForKey:[NSString stringWithFormat:@"%ld",page]]];
    }
    [self getMinAndMaxPage];
}
- (void)getMinAndMaxPage{
    NSInteger minIndex = MAXFLOAT;
    NSInteger maxIndex = 1;
    for (NSString *index in self.cachedPages.allKeys) {
        if (minIndex > [index integerValue]){
            minIndex = [index integerValue];
        }
        if (maxIndex < [index integerValue]){
            maxIndex = [index integerValue];
        }
    }
    [self setValue:@(minIndex) forKeyPath:@"minPage"];
    [self setValue:@(maxIndex) forKeyPath:@"maxPage"];
}
@end
