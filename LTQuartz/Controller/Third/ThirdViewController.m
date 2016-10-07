//
//  ThirdViewController.m
//  LTQuartz
//
//  Created by LaoTao on 15/9/30.
//  Copyright © 2015年 LaoTao. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
{
    UIImageView *imageView;
}

@end

@implementation ThirdViewController

/**
 *  运用CGPath来标定区域
 *  通过CGPath创建一个区域，区域是由路径做两点间线段并闭合成的区域，比如这里创建了一个简单的矩形。
 *  然后就可以用CGPath相关函数判断点是否在区域里了
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathMoveToPoint(pathRef, NULL, 4, 4);
    CGPathAddLineToPoint(pathRef, NULL, 4, 8);
    CGPathAddLineToPoint(pathRef, NULL, 10, 4);
    CGPathAddLineToPoint(pathRef, NULL, 4, 4);
    
    // 关闭该path
    CGPathCloseSubpath(pathRef);
    
    CGPoint point = CGPointMake(5, 7);
    CGPoint outPoint = CGPointMake(5, 10);
    
    if (CGPathContainsPoint(pathRef, NULL, point, NO)) {
        NSLog(@"point in path!");
    }
    
    if (!CGPathContainsPoint(pathRef, NULL, outPoint, NULL)) {
        NSLog(@"outPoint out path!");
    }
    
    //释放该path
    CGPathRelease(pathRef);
    
    imageView=[[UIImageView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    
    self.view.backgroundColor=[UIColor blueColor];
    
    UIGraphicsBeginImageContext(imageView.frame.size);
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    
    //设置线的边缘样式：
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 35.0);
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    
    //设置描边颜色
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 100, 100);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), 200, 100);
    
    //对上下文进行描边
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
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
