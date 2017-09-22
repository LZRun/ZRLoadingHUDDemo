//
//  ZRHomeItem.m
//  CoreAnimationDemo
//
//  Created by GKY on 2017/9/12.
//  Copyright © 2017年 Run. All rights reserved.
//

#import "ZRHomeItem.h"

@implementation ZRHomeItem
- (instancetype)initWithTitle: (NSString *)title viewControllerName: (NSString *)viewControllerName{
    
    self = [super init];
    if (self) {
        _title = title;
        _viewControllerName = viewControllerName;
    }
    return self;
}
@end
