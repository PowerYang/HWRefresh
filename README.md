create  2016-02-23
简单的上啦加载和下拉刷新

补充：
```
- (void)addHeaderRefresh
{
    __weak typeof(self) weakSelf = self;
    [_myTb addHeaderRefreshWithCallback:^{
        [weakSelf getCard];
    }];
}

- (void)addFooterRefresh
{
    __weak typeof(self) weakSelf = self;
    [_myTb addFooterRefreshWithCallback:^{
        [weakSelf getCardNext];
    }];
}
```
