//
//  FirstQuartzView.h
//  LTQuartz
//
//  Created by LaoTao on 15/9/22.
//  Copyright © 2015年 LaoTao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstQuartzView : UIView
{
    
}

/**
 * 在画线的时候，方法的内部默认创建一个path。它把路径都放到了path里面去。
 * 1.创建路径  CGMutablePathRef 调用该方法相当于创建了一个路径，这个路径用来保存绘图信息。
 * 2.把绘图信息添加到路径里边。
 * 以前的方法是点的位置添加到ctx（图形上下文信息）中，ctx 默认会在内部创建一个path用来保存绘图信息。
 * 在图形上下文中有一块存储空间专门用来存储绘图信息，其实这块空间就是CGMutablePathRef。
 * 3.把路径添加到上下文中。
 */


/**
 *
 *1     //1.获取图形上下文
 *2     CGContextRef ctx=UIGraphicsGetCurrentContext();
 *3     //2.绘图（画线）
 *4     //设置起点
 *5     CGContextMoveToPoint(ctx, 20, 20);
 *6     //设置终点
 *7     CGContextAddLineToPoint(ctx, 200, 300);
 *8     //渲染
 *9     CGContextStrokePath(ctx);
 */

@end
