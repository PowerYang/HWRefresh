//
//  ViewController.m
//  Demo
//
//  Created by Howe on 16/2/23.
//  Copyright © 2016年 Howe. All rights reserved.
//

#import "ViewController.h"
#import "HWHeadRefresh.h"
#import "HWFooterRefresh.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak)HWHeadRefresh *headrefresh;
@property (nonatomic, weak)HWFooterRefresh *footerrefresh;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    tableView.dataSource = self;
    tableView.delegate = self;

    HWHeadRefresh *headrefresh = HWHeadRefresh.new;
    [tableView addSubview:headrefresh];
    self.headrefresh = headrefresh;
    [headrefresh hw_addFooterRefreshWithView:tableView hw_footerRefreshBlock:^{
        
    }];

    HWFooterRefresh *footerrefresh = HWFooterRefresh.new;
    [tableView addSubview:footerrefresh];
    self.footerrefresh = footerrefresh;
    [footerrefresh hw_addFooterRefreshWithView:tableView hw_footerRefreshBlock:^{
        NSLog(@"Data Loading");        
    }];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [self.headrefresh hw_toRfreshState];
        return;
    }
    
    if (indexPath.row == 1)
    {
        [self.headrefresh hw_endRefreshState];
        return;
    }
    if (indexPath.row == 18)
    {
        [self.footerrefresh hw_toRfreshState];
        return;
    }
    if (indexPath.row == 19)
    {
        [self.footerrefresh hw_endRefreshState];
        return;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
