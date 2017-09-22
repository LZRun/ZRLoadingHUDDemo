//
//  ZRLoadingHUDViewController.m
//  CoreAnimationDemo
//
//  Created by GKY on 2017/9/11.
//  Copyright © 2017年 Run. All rights reserved.
//

#import "ZRLoadingHUDViewController.h"
#import "ZRLoadingHUD.h"

@interface ZRLoadingHUDViewController ()
@property (nonatomic) CGFloat progress;
@end

@implementation ZRLoadingHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZRLoadingHUD *hud = [[ZRLoadingHUD alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    hud.center = self.view.center;
    [self.view addSubview:hud];
    hud.progress = 100000;
    
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
//    dispatch_source_set_event_handler(timer, ^{
//        if (_progress >= 1) {
//            dispatch_cancel(timer);
//            return ;
//        }
//        _progress += 0.01;
//        hud.progress = _progress;
//    });
//
//    [hud setPlayOrSuspendHandler:^(BOOL isplay){
//        if (isplay) {
//            dispatch_resume(timer);
//        }else{
//            dispatch_suspend(timer);
//        }
//    }];
//
//    dispatch_resume(timer);
  
    /*
    ZRAnimationLoadingHUD *hud = [[ZRAnimationLoadingHUD alloc]init];
    [self.view addSubview:hud];
    hud.center = self.view.center;
    hud.progress = 0.99;
  */
    
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
