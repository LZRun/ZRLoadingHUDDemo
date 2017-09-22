//
//  ZRWaveLoadingViewController.m
//  CoreAnimationDemo
//
//  Created by Run on 2017/9/13.
//  Copyright © 2017年 Run. All rights reserved.
//

#import "ZRWaveLoadingViewController.h"
#import "ZRWaveLoadingView.h"

@interface ZRWaveLoadingViewController ()

@end

@implementation ZRWaveLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZRWaveLoadingView *loadingView = [[ZRWaveLoadingView alloc]init];
    loadingView.center = self.view.center;
    [self.view addSubview:loadingView];
    
    __block CGFloat progress = 0;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (progress >= 1) {
            dispatch_cancel(timer);
            return ;
        }
        progress += 0.1;
        loadingView.progress = progress;
    });

    dispatch_resume(timer);
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
