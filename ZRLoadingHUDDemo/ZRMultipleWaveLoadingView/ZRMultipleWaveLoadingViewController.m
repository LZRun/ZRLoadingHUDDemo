//
//  ZRMultipleWaveLoadingViewController.m
//  ZRLoadingHUDDemo
//
//  Created by GKY on 2017/9/22.
//  Copyright © 2017年 Run. All rights reserved.
//

#import "ZRMultipleWaveLoadingViewController.h"
#import "ZRMultipleWaveLoadingView.h"

@interface ZRMultipleWaveLoadingViewController ()

@end

@implementation ZRMultipleWaveLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZRMultipleWaveLoadingView *loadingView = [[ZRMultipleWaveLoadingView alloc]init];
    loadingView.center = self.view.center;
    loadingView.progress = 1;
    [self.view addSubview:loadingView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
