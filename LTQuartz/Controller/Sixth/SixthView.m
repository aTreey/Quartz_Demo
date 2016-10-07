//
//  SixthView.m
//  LTQuartz
//
//  Created by LaoTao on 16/7/25.
//  Copyright © 2016年 LaoTao. All rights reserved.
//

#import "SixthView.h"
#import "ChartData.h"

@interface SixthView ()

@property (strong, nonatomic) NSDictionary *textStyleDict;
@property (assign, nonatomic) CGFloat sWidth;
@property (assign, nonatomic) CGFloat sHeight;

@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;

@property (assign, nonatomic) CGFloat leftWidth;
@property (assign, nonatomic) CGFloat rightWidth;
@property (assign, nonatomic) CGFloat topHeight;
@property (assign, nonatomic) CGFloat bottomHeight;

@end

@implementation SixthView

- (instancetype)init {
    
    if (self = [super init]) {
        [self customInitData];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _width = frame.size.width;
        _height = frame.size.height;
        [self customInitData];
    }
    
    return self;
}

- (void)customInitData
{
    _sWidth = [UIScreen mainScreen].bounds.size.width;
    _sHeight = [UIScreen mainScreen].bounds.size.height;
    
    _leftWidth = 40;
    _rightWidth = 30;
    _topHeight = 30;
    _bottomHeight = 40;
    
    NSMutableParagraphStyle *style=[[NSMutableParagraphStyle alloc]init]; // 段落样式
    style.alignment = NSTextAlignmentCenter;
    _textStyleDict = @{
//      NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0f],
                       NSFontAttributeName: [UIFont systemFontOfSize:14],
                       NSForegroundColorAttributeName: [UIColor whiteColor],
      };
    
//    [self sortArray];
}

- (void)sortArray {
    double time = [[NSDate date] timeIntervalSince1970] - 60 * 60 * 8;
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < 240; i++) {
        ChartData *chartData = [[ChartData alloc] init];
        chartData.xValue = time + 60 * 2 * i;
        if (i < 30) {
            chartData.yValue = 38.2;
        }else if (i < 60) {
            chartData.yValue = 36.3;
        }else if (i < 90) {
            chartData.yValue = 37.3;
        }else if (i < 120) {
            chartData.yValue = 36;
        }else if (i < 150) {
            chartData.yValue = 38;
        }else if (i < 180) {
            chartData.yValue = 36;
        }else if (i < 210) {
            chartData.yValue = 37;
        }else if (i <= 240) {
            chartData.yValue = 36;
        }
        [mArray addObject:chartData];
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    // Drawing code
    
    //创建上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //下面是绘制两个报警范围的
    //颜色
    CGContextSetRGBFillColor(context, 1/255.0f, 7/255.0f, 9/255.0f, 1.0f);
    //区域
    CGContextFillRect(context, CGRectMake(_leftWidth, 0, _width - _leftWidth - _rightWidth, 40));
    //颜色
    CGContextSetRGBFillColor(context, 6/255.0f, 39/255.0f, 56/255.0f, 1.0f);
    //区域
    CGContextFillRect(context, CGRectMake(_leftWidth, 40, _width - _leftWidth - _rightWidth, 40));
    
    CGFloat lengths[] = {5,5,5,5};
    
    //创建一个Path 句柄
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    //初始化该path到一个初始点
    //创建完一个Path句柄后，必须调用一次CGPathMoveToPoint来初始化绘制的初始点。
    CGPathMoveToPoint(pathRef, &CGAffineTransformIdentity, 30, 30);
    
    
    //纵坐标 文字
    NSArray *valueArray = @[@"43", @"41", @"39", @"37", @"35", @"33"];
    for (int i = 0; i < valueArray.count; i++) {
        NSString *value = valueArray[i];
        [value drawAtPoint:CGPointMake(10, (_height - 40) / valueArray.count * i) withAttributes:_textStyleDict];
    }
    
    //时间的个数
    NSInteger timeCount = 5;
    //虚线的个数
    NSInteger lineCount = 8;
    
    //横坐标 文字
    for (int i = 0; i < timeCount; i++) {
        
        CGPoint aPoints[2];//坐标点
        aPoints[0] =CGPointMake((_sWidth - 40 - 30) / lineCount * (i * 2) + 30, 0);//坐标1
        aPoints[1] =CGPointMake((_sWidth - 40 - 30) / lineCount * (i * 2) + 40, _height - 40);//坐标2
        
        NSString *time = [NSString stringWithFormat:@"%d:00", (i + 3) * 2];
        
        [time drawAtPoint:CGPointMake(aPoints[0].x, _height - 40) withAttributes:_textStyleDict];
//        NSLog(@"%@", _textStyleDict);
    }
    
    //绘制虚线
    for (int i = 0; i < lineCount + 1; i++) {
        CGPoint aPoints[2];//坐标点
        aPoints[0] = CGPointMake((_sWidth - 40 - 30) / lineCount * i + 40, 0);//坐标1
        aPoints[1] = CGPointMake((_sWidth - 40 - 30) / lineCount * i + 40, _height - 40);//坐标2
        
//        textStyleX.color                 = [CPTColor colorWithComponentRed:193.f/255.f green:255.f/255.f blue:252.f/255.f alpha:1.0];
        
        //画 虚线
        CGContextSetRGBStrokeColor(context, 102/255.0, 165/255.0, 197/255.0, 1.0);    //设置图形线的颜色
        CGContextSetLineDash(context, 0, lengths, 4);   //设置线条为 虚线；
        CGContextSetLineWidth(context, 1.0);            //设置线宽；
        
        //    CGRect aRect= CGRectMake(60, 1,self.bounds.size.width-60*2,self.bounds.size.height-4);
        //    CGContextAddEllipseInRect(context, aRect); //画椭圆
        CGContextAddLines(context, aPoints, 2);//添加线
        CGContextDrawPath(context, kCGPathStroke);
    }
 
    
    //画 实线
    CGPoint aPoints[2];//坐标点
    aPoints[0] = CGPointMake(_leftWidth, _height - _bottomHeight);//坐标1
    aPoints[1] = CGPointMake(_width - _rightWidth, _height - _bottomHeight);//坐标2
    
    CGFloat lens[] = {5,0,0,0};
    
    CGContextSetRGBStrokeColor(context, 61/255.0, 205/255.0, 215/255.0, 1.0);    //设置线的颜色
    CGContextSetLineDash(context, 0, lens, 4);   //设置线条为 虚线；
    CGContextSetLineWidth(context, 2.0);            //设置线宽；
    CGContextAddLines(context, aPoints, 2);//添加线
    CGContextDrawPath(context, kCGPathStroke);
    
//    [@"文字" drawAtPoint:CGPointMake(160, 150) withAttributes:@{
//                                                              NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Bold" size:30.0f],
//                                                              NSForegroundColorAttributeName: [UIColor redColor],
//                                                              }];
    //    [@"再来个文字" drawAtPoint:CGPointMake(0, 0) withAttributes:_textStyleDict];
    
    
    /*
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextAddArc(context, 100, 20, 15, 0, 2 * M_PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
    
    //填充圆，无边框
    CGContextAddArc(context, 150, 30, 30, 0, 2 * M_PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathFill);//绘制填充
     */
    
    
    double time = [[NSDate date] timeIntervalSince1970] - 60 * 60 * 8;
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < 240; i++) {
        ChartData *chartData = [[ChartData alloc] init];
        chartData.xValue = time + 60 * 2 * i;
        if (i < 30) {
            chartData.yValue = 38.2;
        }else if (i < 60) {
            chartData.yValue = 36.3;
        }else if (i < 90) {
            chartData.yValue = 37.3;
        }else if (i < 120) {
            chartData.yValue = 36;
        }else if (i < 150) {
            chartData.yValue = 38;
        }else if (i < 180) {
            chartData.yValue = 36;
        }else if (i < 210) {
            chartData.yValue = 37;
        }else if (i <= 240) {
            chartData.yValue = 36;
        }
        [mArray addObject:chartData];
    }
    
    //画折现
    for (int i = 0; i < mArray.count; i++) {
        ChartData *chartData = mArray[i];
        int pointX = _leftWidth + (chartData.xValue - time) / (60 * 2);
        double pointY = chartData.yValue + 100;
        if (i != 0) {
            CGContextAddLineToPoint(context, pointX, pointY);
        }
        
        CGContextMoveToPoint(context, pointX, pointY);
        
        NSLog(@"%d, %.f", pointX, pointY);
    }
    
    CGContextStrokePath(context);
    /*
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);    //设置线的颜色
    
    CGContextMoveToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 100, 100);
    
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);  //线框颜色
    //    CGContextSetRGBStrokeColor(context, 255/255.0, 255/255.0, 255/255.0, 1.0);    //设置线的颜色
    
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddLineToPoint(context, 200, 100);
    CGContextStrokePath(context);
    
    CGContextSetRGBStrokeColor(context, 1, 0, 1, 1);//改变画笔颜色
    
    CGContextMoveToPoint(context, 200, 100);
    CGContextAddLineToPoint(context, 300, 200);
    
    CGContextStrokePath(context);
    */

    
    // 释放该path
    CGPathRelease(pathRef);

}


@end
