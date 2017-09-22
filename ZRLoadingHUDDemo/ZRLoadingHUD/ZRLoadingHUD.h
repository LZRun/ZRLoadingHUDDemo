
//  ZRLoadingHUD.h
//  CoreAnimationDemo
//
//  Created by GKY on 2017/9/11.
//  Copyright © 2017年 Run. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRLoadingHUD : UIView{
    BOOL isPlay;
}

@property (nonatomic) CGFloat progress;
@property (nonatomic,copy) void(^playOrSuspendHandler)(BOOL isPlay);

@end
