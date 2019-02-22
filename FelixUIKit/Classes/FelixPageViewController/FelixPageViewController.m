//
//  FelixPageViewController.m
//  FelixUIKit
//
//  Created by weistek on 2019/2/19.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "FelixPageViewController.h"
@interface FelixPageViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property (nonatomic,strong) NSArray<NSString *> *titles;
@property (nonatomic,assign) CGFloat titleHeight;
@property (nonatomic,strong) UIColor *titleColor;
@property (nonatomic,strong) UIColor *selTitleColor;
@property (nonatomic,strong) NSArray<Class> *controllerClassList;
@property (nonatomic,strong) JXCategoryListContainerView *listContainerView;
@end

@implementation FelixPageViewController
- (instancetype)initWithTitles:(NSArray<NSString *> *)titles titleHeight:(CGFloat)height titleColor:(UIColor *)titleColor selTitleColor:(UIColor *)selTitleColor controllerClassList:(NSArray<Class> *)controllerClassList{
    if (self == [super init]){
        self.titles = titles;
        self.titleHeight = height;
        self.titleColor = titleColor;
        self.selTitleColor = selTitleColor;
        self.controllerClassList = controllerClassList;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}
- (void)initUI{
    JXCategoryTitleView *titleView = [[JXCategoryTitleView alloc] init];
    titleView.delegate = self;
    titleView.titles = self.titles;
    titleView.titleColor = self.titleColor;
    [self.view addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(self.titleHeight);
    }];
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorLineViewColor = self.selTitleColor;
    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;
    titleView.indicators = @[lineView];
    
    _listContainerView = [[JXCategoryListContainerView alloc] initWithParentVC:self delegate:self];
    [self.view addSubview:_listContainerView];
    [_listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleView.mas_bottom);
        make.bottom.left.right.equalTo(self.view);
    }];
    titleView.contentScrollView = _listContainerView.scrollView;
}
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView{
    return self.titles.count;
}
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index
{
    return [[self.controllerClassList[index] alloc] init];
}
- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    [self.listContainerView didClickSelectedItemAtIndex:index];
}
//传递scrolling事件给listContainerView，必须调用！！！
- (void)categoryView:(JXCategoryBaseView *)categoryView scrollingFromLeftIndex:(NSInteger)leftIndex toRightIndex:(NSInteger)rightIndex ratio:(CGFloat)ratio {
    [self.listContainerView scrollingFromLeftIndex:leftIndex toRightIndex:rightIndex ratio:ratio selectedIndex:categoryView.selectedIndex];
}
@end
