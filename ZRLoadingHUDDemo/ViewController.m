//
//  ViewController.m
//  ZRLoadingHUDDemo
//
//  Created by GKY on 2017/9/22.
//  Copyright © 2017年 Run. All rights reserved.
//

#import "ViewController.h"
#import "ZRHomeItem.h"

static NSString *cellID = @"cellID";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 注释
 */
@property (nonatomic,strong) NSMutableArray<ZRHomeItem *> *datas;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.rowHeight = 50;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    [self configData];
}

- (void)configData{
    self.datas = [NSMutableArray array];
    [_datas addObject: [[ZRHomeItem alloc]initWithTitle:@"旋转加载" viewControllerName:@"ZRLoadingHUDViewController"]];
    [_datas addObject: [[ZRHomeItem alloc]initWithTitle:@"单条波浪加载" viewControllerName:@"ZRWaveLoadingViewController"]];
    [_datas addObject: [[ZRHomeItem alloc]initWithTitle:@"多条波浪加载" viewControllerName:@"ZRMultipleWaveLoadingViewController"]];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.textLabel.text = _datas[indexPath.row].title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *viewContrName = _datas[indexPath.row].viewControllerName;
    UIViewController *viewContr = [[NSClassFromString(viewContrName) alloc] init];
    [self.navigationController pushViewController:viewContr animated:YES];
}
@end
