//
//  ZRBaseViewController.m
//  ZRLoadingHUDDemo
//
//  Created by GKY on 2017/9/22.
//  Copyright © 2017年 Run. All rights reserved.
//

#import "ZRBaseViewController.h"

@interface ZRBaseViewController ()

@end

@implementation ZRBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)dealloc{
    NSLog(@"%s",__func__);
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
