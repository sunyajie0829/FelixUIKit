//
//  FelixTableView.h
//  FelixTableView
//
//  Created by weistek on 2019/2/13.
//  Copyright © 2019 weistek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>
typedef void(^EmptyDataImageTapAction)(void);
@interface FelixTableView : UITableView<DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>
#pragma mark - 基础状态设置
/**
 tableView数据源为空时的图片
 */
@property (nonatomic,strong) UIImage *emptyDataImage;
/**
 tableView数据源加载时的图片
 */
@property (nonatomic,strong) UIImage *loadingDataImage;
/**
 tableView数据源是否正在加载,为YES的时候会自动旋转loadingDataImage
 */
@property (nonatomic,assign) BOOL isLoading;
/**
 tableView数据源为空时的提示文字
 */
@property (nonatomic,strong) NSAttributedString *emptyDataTitle;
/**
 点击图片时的回调,建议在回调中进行数据获取和界面刷新
 */
@property (nonatomic,copy) EmptyDataImageTapAction emptyDataImageTapAction;

/**
 初始化一个tableview,需要添加上下拉刷新请直接 addPullUpAction/addPullDownAction
 
 @param frame tableview的Frame,也可使用自动布局
 @param emptyDataImage 数据为空时的图片
 @param emptyDataTitle 数据为空时的提示文字
 @param loadingDataImage 加载中的图片，isLoading为YES的时候会自动旋转
 @param tapAction 点击图片时执行的动作,一般用来获取数据
 @return 返回一个tableView
 */
- (instancetype)initWithFrame:(CGRect)frame emptyDataImage:(UIImage *)emptyDataImage emptyDataTitle:(NSAttributedString *)emptyDataTitle loadingDataImage:(UIImage *)loadingDataImage emptyDataImageTapAction:(void(^)(void))tapAction;
/**
 初始化一个tableview,需要添加上下拉刷新请直接 addPullUpAction/addPullDownAction
 
 @param style tableview的样式
 @param frame tableview的Frame,也可使用自动布局
 @param emptyDataImage 数据为空时的图片
 @param emptyDataTitle 数据为空时的提示文字
 @param loadingDataImage 加载中的图片，isLoading为YES的时候会自动旋转
 @param tapAction 点击图片时执行的动作,一般用来获取数据
 @return 返回一个tableView
 */
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style emptyDataImage:(UIImage *)emptyDataImage emptyDataTitle:(NSAttributedString *)emptyDataTitle loadingDataImage:(UIImage *)loadingDataImage emptyDataImageTapAction:(void(^)(void))tapAction;

#pragma mark - 分页相关的属性设置
/**
 tableView分页的单页数据量
 */
@property (nonatomic,assign,readonly) NSInteger pageSize;
/**
 tableView允许缓存的总页数
 */
@property (nonatomic,assign,readonly) NSInteger cachePagePoolSize;
/**
 tableView分页已经缓存的页数信息
 */
@property (nonatomic,strong,readonly) NSMutableDictionary<NSString *,NSArray *> *cachedPages;
/**
 tableView分页已缓存页的最小index
 */
@property (nonatomic,assign,readonly) NSInteger minPage;
/**
 tableView分页已缓存页的最大index
 */
@property (nonatomic,assign,readonly) NSInteger maxPage;

@end
