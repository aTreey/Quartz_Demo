//
//  SecondQuartzView.m
//  LTQuartz
//
//  Created by LaoTao on 15/9/29.
//  Copyright © 2015年 LaoTao. All rights reserved.
//

#import "SecondQuartzView.h"

@interface SecondQuartzView ()

@property (strong, nonatomic) NSMutableArray *mArray;

@end

@implementation SecondQuartzView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _mArray = [NSMutableArray array];
        for (int i = 0; i < 30; i++) {
            [_mArray addObject:[NSString stringWithFormat:@"%d", arc4random() % 100]];
        }
    }
    
    return self;
}

- (void)changeMArray {
    [_mArray removeObjectAtIndex:0];
    [_mArray addObject:[NSString stringWithFormat:@"%d", arc4random() % 100]];
}

/*
- (NSMutableArray *)mArray {
    if (_mArray == nil) {
        _mArray = [NSMutableArray array];
        for (int i = 0; i < 40; i++) {
            [_mArray addObject:[NSString stringWithFormat:@"%d", arc4random() % 100]];
        }
    }
    
    [_mArray removeObjectAtIndex:0];
    [_mArray addObject:[NSString stringWithFormat:@"%d", arc4random() % 100]];
    
    return _mArray;
}
 */

- (void)drawCurve {
    
    [self changeMArray];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(currentContext, 2);
    
    // 设置描边颜色
    CGContextSetRGBStrokeColor(currentContext, 0.99f, 0.01f, 0.02f, 1.0f);
//    CGContextSetStrokeColor(<#CGContextRef  _Nullable c#>, <#const CGFloat * _Nullable components#>)
    
    
    CGContextMoveToPoint(currentContext, 40, [NSString stringWithFormat:@"%@", _mArray[0]].intValue);
    for (int i = 0; i < _mArray.count; i++) {
        int pointY = [NSString stringWithFormat:@"%@", _mArray[i]].intValue;
        CGContextAddLineToPoint(currentContext, i * 10 + 40, pointY);
        CGContextMoveToPoint(currentContext, i * 10 + 40, pointY);
    }
    
    CGContextStrokePath(currentContext);
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawCurve];
}


@end
