# FelixUIKit
###集成了常用的各种UI组件，可以快速的添加UI组件到自己的项目中.目前依赖于
```
MJRefresh
DZNEmptyDataSet
```
引入到自己的项目当中

```
source 'https://github.com/sunyajie0829/FelixUIKit.git'

platform:ios,'xxx'
target 'xxx' do
    pod 'FelixUIKit'
end

pod 'FelixUIKit'
```
>###FelixTableView

集成了上下拉刷新、翻页插件、数据源管理、空数据状态（图片、文字）、加载数据状态等等，用法如下。

* 创建一个FelixTableView,添加空数据状态、空数据描述、加载数据状态

```
self.tableView = [[FelixTableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain emptyDataImage:[UIImage imageNamed:@"1"] emptyDataTitle:nil loadingDataImage:[UIImage imageNamed:@"2"] emptyDataImageTapAction:^{
        /**
        从服务端获取数据
        */
    }];
```
* 添加上拉刷新和下拉刷新

```
[self.tableView addPullUpAction:^{
        NSLog(@"pull up");
    }];
[self.tableView addPullDownAction:^{
        NSLog(@"pull down");
    }];
```

* 翻页插件、数据源管理应用

```
[self.tableView addPullUpAction:^{
        NSArray *pageData = [NSMutableArray arrayWithArray:[weakself requestServerDataWithPage:weakself.tableView.maxPage+1]];
        [weakself.tableView endDropUpOrDropDownAnimation];
        if (pageData.count > 0)
        {
            [weakself.tableView processPageData:pageData page:weakself.tableView.maxPage+1 sourceData:weakself.dataList];
            [weakself.tableView reloadData];
            [weakself.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:weakself.dataList.count - pageData.count - 1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        }
    }];
    [self.tableView addPullDownAction:^{
        NSArray *pageData = [NSMutableArray arrayWithArray:[weakself requestServerDataWithPage:weakself.tableView.minPage-1]];
        [weakself.tableView endDropUpOrDropDownAnimation];
        if (pageData.count > 0)
        {
            [weakself.tableView processPageData:pageData page:weakself.tableView.minPage-1 sourceData:weakself.dataList];
            [weakself.tableView reloadData];
        }
    }];
```
