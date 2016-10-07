//
//  FourthViewController.m
//  LTQuartz
//
//  Created by LaoTao on 15/10/8.
//  Copyright © 2015年 LaoTao. All rights reserved.
//

#import "FourthViewController.h"
#import "LTQuartz-Swift.h"

@interface FourthViewController ()

@end

@implementation FourthViewController
{
    UIView *_view;
    CAShapeLayer *trackLayer;
    CAShapeLayer *progressLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"进度条";
    self.view.opaque = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    _view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_view];
    
    //背景圆环
    trackLayer = [CAShapeLayer layer];
    //    trackLayer.frame = CGRectMake(0, 0, 80, 80);
    trackLayer.path = [self drawPathWithArcCenter];
    trackLayer.fillColor = [UIColor clearColor].CGColor;
    trackLayer.strokeColor = [UIColor cyanColor].CGColor;
    trackLayer.opacity = 1;  //背景圆环的背景透明度
    trackLayer.lineWidth = 10;
    trackLayer.lineCap = kCALineCapRound;
    trackLayer.lineJoin = kCALineCapRound;
    [_view.layer addSublayer:trackLayer];
    
    
    //进度轨道
    progressLayer = [CAShapeLayer layer];
    progressLayer.path = [self drawPathWithArcCenter];
    progressLayer.fillColor = [UIColor clearColor].CGColor;
    progressLayer.strokeColor = [UIColor redColor].CGColor;
    progressLayer.opacity = 0.8;
    progressLayer.strokeEnd = 0;
    progressLayer.lineWidth = trackLayer.lineWidth;
    progressLayer.lineCap = kCALineCapRound;
    progressLayer.lineJoin = kCALineCapRound;
    
    [_view.layer addSublayer:progressLayer];
    
    [self performSelector:@selector(draw) withObject:nil afterDelay:0.5];
//    [self draw];
    
    DetailCircleProgressView *progressView = [[DetailCircleProgressView alloc] initWithFrame: CGRectMake(100, 230, 100, 100)];
    [self.view addSubview:progressView];
}

- (void)draw {
    CGFloat stroke = 0.02;
    progressLayer.strokeEnd = stroke;
}

- (CGPathRef)drawPathWithArcCenter {
    
    CGFloat position_y = 50;
    CGFloat position_x = 50; // Assuming that width == height
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(position_x, position_y)
                                          radius:40
                                      startAngle:(M_PI * -1 / 2)
                                        endAngle:(M_PI * 3 / 2)
                                       clockwise:YES].CGPath;
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
