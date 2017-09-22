//
//  ZRLoadingHUD.m
//  CoreAnimationDemo
//
//  Created by GKY on 2017/9/11.
//  Copyright © 2017年 Run. All rights reserved.
//

#import "ZRLoadingHUD.h"

@interface ZRLoadingHUD ()

@property (nonatomic,strong) CADisplayLink *displayLink;
@property (nonatomic,strong) UIColor *smallRoundedfillColor;
@property (nonatomic,strong) UIColor *minRoundedfileColor;
@property (nonatomic) CGFloat currentProgress;
@end

@implementation ZRLoadingHUD
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        _progress = self.currentProgress = 0;
        isPlay = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(playOrSuspendTapeGestureAction)];
        [self addGestureRecognizer:tapGesture];
        
        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(reloadView)];
        [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    if (!newSuperview) {
        //销毁
        [_displayLink invalidate];
    }
}

- (void)drawRect:(CGRect)rect {
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat bigRadius = width * 0.9 / 2;
    CGFloat smallRadius = width * 0.7 / 2;
  
    [[UIColor whiteColor] setFill];
    [[UIColor whiteColor] setStroke];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(width / 2 - bigRadius, height / 2 - bigRadius, bigRadius * 2, bigRadius * 2) cornerRadius:bigRadius];
    [path fill];
    
    [_smallRoundedfillColor setFill];
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(width / 2 - smallRadius, height / 2 - smallRadius, smallRadius * 2, smallRadius * 2) cornerRadius:smallRadius];
    [path1 stroke];
    [path1 fill];
    
    if (!isPlay) {
        [_minRoundedfileColor setFill];
        CGFloat minimumRadius = smallRadius / 3;
        CGPoint center = CGPointMake(width / 2, height / 2);
        CGFloat changeAngle = self.endAngle + M_PI_2;
        CGFloat x = sin(changeAngle) * smallRadius;
        CGFloat y = cos(changeAngle) * smallRadius;
        UIBezierPath *path2 = [UIBezierPath bezierPath];
        [path2 moveToPoint:CGPointMake(center.x, center.y - minimumRadius)];
        [path2 addArcWithCenter:center radius:minimumRadius startAngle:- M_PI_2 endAngle:self.endAngle clockwise:YES];
        [path2 addLineToPoint:CGPointMake(center.x + x, center.y - y)];
        [path2 addArcWithCenter:center radius:smallRadius startAngle:self.endAngle endAngle:- M_PI_2 clockwise:NO];
        [path2 addLineToPoint:CGPointMake(center.x, center.y - minimumRadius)];
        [path2 stroke];
        [path2 fill];
        
        CGFloat lineWith = 5;
        CGFloat lineHeight = 10;
        CGFloat centerSpace = 3;
        UIBezierPath *path3 = [UIBezierPath bezierPath];
        path3.lineWidth = lineWith;
        [path3 moveToPoint:CGPointMake(center.x - lineWith - centerSpace, center.y - lineHeight / 2)];
        [path3 addLineToPoint:CGPointMake(path3.currentPoint.x, path3.currentPoint.y + lineHeight)];
        [path3 moveToPoint: CGPointMake(center.x + centerSpace, center.y - lineHeight / 2)];
        [path3 addLineToPoint:CGPointMake(path3.currentPoint.x, path3.currentPoint.y + lineHeight)];
        [_minRoundedfileColor setStroke];
        [path3 stroke];
    }else{
        
        [_minRoundedfileColor setFill];
        CGPoint center = CGPointMake(width / 2, height / 2);
        UIBezierPath *path2 = [UIBezierPath bezierPath];
        [path2 moveToPoint:center];
        [path2 addLineToPoint:CGPointMake(width / 2, height / 2 - smallRadius)];
        [path2 addArcWithCenter:center radius:smallRadius startAngle:- M_PI_2 endAngle:self.endAngle clockwise:YES];
        [path2 addLineToPoint:center];
        [path2 stroke];
        [path2 fill];
    }
}
                            
- (void)reloadView{
    if (_currentProgress >= _progress) {
        _displayLink.paused = YES;
        return;
    }
    self.currentProgress += 0.01;
    [self setNeedsDisplay];
}

- (void)playOrSuspendTapeGestureAction{
    isPlay = !isPlay;
    _displayLink.paused = !isPlay;
    if (_playOrSuspendHandler) {
        _playOrSuspendHandler(isPlay);
    }
    [self setNeedsDisplay];
}

- (CGFloat)endAngle{
    //值为0~1之间，类似下载的处理
    //- M_PI_2 + M_PI * 2 * _currentProgress;
    //对于值可以无穷大，无限旋转,类似网络加载的处理
    //double modf (double, double*); 将参数的整数部分通过指针回传, 返回小数部分
    double integer;
    CGFloat endAngle = - M_PI_2 + M_PI * 2 * modf(_currentProgress, &integer);//(_currentProgress - (NSInteger)(_currentProgress));
    return endAngle;
}

- (void)setCurrentProgress:(CGFloat)currentProgress{
    _currentProgress = currentProgress;
    if ((NSInteger)currentProgress % 2 == 0) {
        self.smallRoundedfillColor = [UIColor blackColor];
        self.minRoundedfileColor = [UIColor whiteColor];
    }else{
        self.minRoundedfileColor = [UIColor blackColor];
        self.smallRoundedfillColor = [UIColor whiteColor];
    }
}

- (void)setProgress:(CGFloat)progress{
    if (_progress != progress) {
        //控制进度在0~1之间
        //progress = MIN(MAX(progress, 0), 1);
        _progress = progress;
        _displayLink.paused = NO;
    }
}

@end
