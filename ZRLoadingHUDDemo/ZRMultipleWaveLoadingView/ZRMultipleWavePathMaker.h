//
//  ZRMultipleWavePathMaker.h
//  CoreAnimationDemo
//
//  Created by GKY on 2017/9/19.
//  Copyright © 2017年 Run. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZRMultipleWavePathMaker : NSObject
/**
 波浪路径
 */
@property (nonatomic,strong,readonly) UIBezierPath *wavePath;
/**
 y轴的偏移量
 */
@property (nonatomic,assign) CGFloat yOffset;
///波浪被限制范围
@property (nonatomic) CGSize limitSize;
///波浪的高度
@property (nonatomic) CGFloat waveHeight;
- (instancetype)initWithLimitSize: (CGSize)limitSize waveHeight: (CGFloat)waveHeight;
///x轴的偏移量,设置了会生成wavePath
- (void)createPathWithXOffSet: (CGFloat)xOffset;

@end
