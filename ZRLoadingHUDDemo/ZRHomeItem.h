//
//  ZRHomeItem.h
//  CoreAnimationDemo
//
//  Created by GKY on 2017/9/12.
//  Copyright © 2017年 Run. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZRHomeItem : NSObject
/**
 注释
 */
@property (nonatomic,copy) NSString *title;
/**
 注释
 */
@property (nonatomic,copy) NSString *viewControllerName;
- (instancetype)initWithTitle: (NSString *)title viewControllerName: (NSString *)viewControllerName;
@end
