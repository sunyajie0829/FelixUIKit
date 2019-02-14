//
//  ViewController.m
//  FelixTableView
//
//  Created by weistek on 2019/2/13.
//  Copyright © 2019 weistek. All rights reserved.
//

#import "ViewController.h"
#import "FelixTableView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) FelixTableView *tableView;
@property (nonatomic,assign) int count;
@end

@implementation ViewController
- (void)viewDidLoad {
    self.count = 0;
    [super viewDidLoad];
    __weak typeof(self) weakself = self;
    self.tableView = [[FelixTableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain emptyDataImage:[UIImage imageNamed:@"1"] emptyDataTitle:nil loadingDataImage:[UIImage imageNamed:@"2"] emptyDataImageTapAction:^{
        if(arc4random()%2){
            weakself.count = 20;
        }else{
            weakself.count = 0;
        }
        weakself.tableView.isLoading = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakself.tableView.isLoading = NO;
            [weakself.tableView reloadData];
        });
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView addPullUpAction:^{
        NSLog(@"pull up");
    }];
    [self.tableView addPullDownAction:^{
        NSLog(@"pull down");
    }];
    self.tableView.rowHeight = 60;
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行，第%ld段",indexPath.row,indexPath.section];
    return cell;
}

@end
