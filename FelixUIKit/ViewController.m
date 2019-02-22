//
//  ViewController.m
//  FelixTableView
//
//  Created by weistek on 2019/2/13.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "ViewController.h"
#import "Classes/FelixUIKit.h"
#import "CustomViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) FelixTableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataList;
@end

@implementation ViewController
{
    int index;
    NSMutableArray *serverData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self testPageViewController];
//    [self testTableView];
//    [self testTabbarController];
}
- (void)testPageViewController{
    FelixPageViewController *pvc = [[FelixPageViewController alloc] initWithTitles:@[@"hello",@"world",@"dd",@"fs",@"helloword",@"pagecontroller",@"page",@"nice",@"ok",@"te"] titleHeight:80 titleColor:[UIColor lightGrayColor] selTitleColor:[UIColor redColor] controllerClassList:@[[CustomViewController class],[CustomViewController class],[CustomViewController class],[CustomViewController class],[CustomViewController class],[CustomViewController class],[CustomViewController class],[CustomViewController class],[CustomViewController class],[CustomViewController class]]];
    [self addChildViewController:pvc];
    [self.view addSubview:pvc.view];
//    [pvc.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.left.right.equalTo(self.view);
//    }];
}
- (void)testTableView{
    index = 0;
    serverData = [NSMutableArray array];
    for (int i = 0; i < 95; i++) {
        [serverData addObject:[NSString stringWithFormat:@"data %d",i]];
    }
    self.dataList = [NSMutableArray array];
    [super viewDidLoad];
    __weak typeof(self) weakself = self;
    self.tableView = [[FelixTableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain emptyDataImage:[UIImage imageNamed:@"1"] emptyDataTitle:nil loadingDataImage:[UIImage imageNamed:@"2"] emptyDataImageTapAction:^{
        NSMutableArray *pageData = [NSMutableArray arrayWithArray:[weakself requestServerDataWithPage:self.tableView.minPage]];
        [weakself.tableView processPageData:pageData page:self.tableView.minPage sourceData:weakself.dataList];
        [weakself.tableView reloadData];
        NSLog(@"refresh");
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView addPagerWithPageSize:10 cachePagePoolSize:3];
    [self.tableView addPullUpAction:^{
        NSArray *pageData = [NSMutableArray arrayWithArray:[weakself requestServerDataWithPage:weakself.tableView.maxPage+1]];
        [weakself.tableView endDropUpOrDropDownAnimation];
        if (pageData.count > 0)
        {
            NSLog(@"%ld",weakself.tableView.maxPage);
            [weakself.tableView processPageData:pageData page:weakself.tableView.maxPage+1 sourceData:weakself.dataList];
            NSLog(@"%ld",weakself.tableView.maxPage);
            [weakself.tableView reloadData];
            [weakself.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:weakself.dataList.count - pageData.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
            NSLog(@"pull up");
        }
    }];
    [self.tableView addPullDownAction:^{
        NSArray *pageData = [NSMutableArray arrayWithArray:[weakself requestServerDataWithPage:weakself.tableView.minPage-1]];
        [weakself.tableView endDropUpOrDropDownAnimation];
        if (pageData.count > 0)
        {
            [weakself.tableView processPageData:pageData page:weakself.tableView.minPage-1 sourceData:weakself.dataList];
            NSLog(@"pull down");
            [weakself.tableView reloadData];
        }
    }];
    self.tableView.rowHeight = 60;
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}
- (NSArray *)requestServerDataWithPage:(NSInteger)page{
    if (page > 10){return @[];}
    if (page < 1){return @[];}
    return [serverData subarrayWithRange:NSMakeRange((page-1)*10, MIN(10, serverData.count - (page-1)*10))];
}
@end
