//
//  FirstQuartzView.m
//  LTQuartz
//
//  Created by LaoTao on 15/9/22.
//  Copyright © 2015年 LaoTao. All rights reserved.
//

#import "FirstQuartzView.h"
#import <QuartzCore/QuartzCore.h>

@interface FirstQuartzView ()

@property (strong, nonatomic) NSDictionary   *textStyleDict;

@end

@implementation FirstQuartzView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

-(NSDictionary *)textStyleDict
{
    if (!_textStyleDict) {
        UIFont *font = [UIFont systemFontOfSize:14];
        NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init]; // 段落样式
        style.alignment = NSTextAlignmentCenter;
        _textStyleDict = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:style};
    }
    return _textStyleDict;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // 创建Quratz上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 填充矩形
    // 颜色
    CGContextSetRGBFillColor(context, 0.6f, 0.6f, 0.6f, 1.0f);
    // 区域
    CGContextFillRect(context, CGRectMake(0.0f, 0.f, self.frame.size.width, self.frame.size.height));
    
    CGContextSetRGBFillColor(context, 0.94f, 0.94f, 0.6f, 1.0f);
    
    CGContextFillRect(context, CGRectMake(30.0f, 0.f, 100, 200));
    
    // 创建一个Path句柄
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    // 初始化该path到一个初始点
    CGPathMoveToPoint(pathRef, &CGAffineTransformIdentity, 30.0f, 0.0f);
    
    // 创建完一个Path句柄后，必须调用一次CGPathMoveToPoint来初始化绘制的初始点。
    for (int i = 0; i < 40; i++) {
        CGPoint point = CGPointMake(i * 10 + 40, arc4random() % 100);
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 3, 3)];
        image.center = point;
        image.backgroundColor = [UIColor blackColor];
        image.layer.cornerRadius = 1.5;
        image.layer.masksToBounds = YES;
        [self addSubview:image];
        
        CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, point.x, point.y);
        
        if (i != 39) {
            CGPathMoveToPoint(pathRef, &CGAffineTransformIdentity, point.x, point.y);
        }
    }
    
    NSArray *timeArray = @[@":00", @":10", @":20", @":30", @":40", @":50"];
    for (int i = 0; i < 6; i++) {
        NSString *time = [NSString stringWithFormat:@"3%@", timeArray[i]];
        [time drawAtPoint:CGPointMake([UIScreen mainScreen].bounds.size.width / 6 * i + 20, 200) withAttributes:_textStyleDict];
    }
    
    NSArray *valueArray = @[@"120", @"100", @"80", @"60", @"40", @"20", @"0"];
    for (int i = 0; i < valueArray.count; i++) {
        NSString *value = valueArray[i];
        [value drawAtPoint:CGPointMake(10, 200 / valueArray.count * i + 10) withAttributes:_textStyleDict];
    }
    
    // 关闭该path
    CGPathCloseSubpath(pathRef);
    
    CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
    backgroundLayer.frame = self.bounds;
    backgroundLayer.fillColor = [UIColor redColor].CGColor;
    backgroundLayer.backgroundColor = [UIColor clearColor].CGColor;
    [backgroundLayer setStrokeColor:[UIColor clearColor].CGColor];
    [backgroundLayer setLineWidth:2];
    
    backgroundLayer.path = pathRef;
    
    //animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 5;
    animation.fromValue = @(0.0);
    animation.toValue = @(1.0);
    [backgroundLayer addAnimation:animation forKey:@"strokeEnd"];
    
    backgroundLayer.zPosition = 0;
    
    [self.layer addSublayer:backgroundLayer];
    
    // 设置描边颜色
    CGContextSetRGBStrokeColor(context, 0.99f, 0.01f, 0.02f, 1.0f);
    
    // 将此path添加到Quartz上下文中
    CGContextAddPath(context, pathRef);
    
    // 对上下文进行描边
    CGContextStrokePath(context);
    
    // 释放该path
    CGPathRelease(pathRef);
    
    
}


@end

































