//
//  ZRMultipleWavePathMaker.m
//  CoreAnimationDemo
//
//  Created by GKY on 2017/9/19.
//  Copyright © 2017年 Run. All rights reserved.
//

#import "ZRMultipleWavePathMaker.h"

@implementation ZRMultipleWavePathMaker

- (instancetype)initWithLimitSize: (CGSize)limitSize waveHeight: (CGFloat)waveHeight{
    self = [super init];
    if (self) {
        self.limitSize = limitSize;
        self.waveHeight = waveHeight;
    }
    return self;
}

- (void)createPathWithXOffSet: (CGFloat)xOffset{
    //获取绘制三次贝塞尔曲线的4个点
    CGPoint startPoint = CGPointMake(0, [self calculateStartOrEndPointOfYWithXOffSet:xOffset]);
    CGPoint endPoint = CGPointMake(_limitSize.width, [self calculateStartOrEndPointOfYWithXOffSet:xOffset]);
    CGPoint firstPoint = [self calculateFirstControlPointWithXOffSet:xOffset];
    CGPoint secondPoint = [self calculateSecondControlPointWithFirstControlPoint:firstPoint];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addCurveToPoint:endPoint controlPoint1:firstPoint controlPoint2:secondPoint];
    [path addLineToPoint:CGPointMake(_limitSize.width, _limitSize.height)];
    [path addLineToPoint:CGPointMake(0, _limitSize.height)];
    [path closePath];
    _wavePath = path;
}
///根据xOffset计算起点和终点的y值
- (CGFloat)calculateStartOrEndPointOfYWithXOffSet: (CGFloat)xOffset{
    return _limitSize.height - (_waveHeight * sin(xOffset / _limitSize.width * M_PI * 2) + _yOffset + _waveHeight);
}

- (CGPoint)calculateFirstControlPointWithXOffSet: (CGFloat)xOffset{
    //1/4个边长
    CGFloat fourPartWidth = _limitSize.width /  4;
    if (xOffset < fourPartWidth) {
        return CGPointMake(fourPartWidth - xOffset, _limitSize.height - (_yOffset + _waveHeight * 2));
    }else if (xOffset > fourPartWidth * 3){
        return CGPointMake(fourPartWidth * 5 - xOffset, _limitSize.height - (_yOffset + _waveHeight * 2));
    }
    return CGPointMake(fourPartWidth * 3 - xOffset, _limitSize.height - _yOffset);
}

- (CGPoint)calculateSecondControlPointWithFirstControlPoint:(CGPoint)firstControlPoint{
    return CGPointMake(firstControlPoint.x + _limitSize.width / 2, (firstControlPoint.y == (_limitSize.height - _yOffset)) ? ( _limitSize.height - (_yOffset + _waveHeight * 2)) : (_limitSize.height - _yOffset));
}
@end
