//
//  FifthQuartz.swift
//  LTQuartz
//
//  Created by LaoTao on 16/6/6.
//  Copyright © 2016年 LaoTao. All rights reserved.
//

import UIKit

class FifthQuartz: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var chartArray = [Float]()
    //数组保存的个数，因为后台运行时，无法获取到数组的实时个数
    //不要问为什么，我也不知道，现状是这样的
    var countNumber = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGrayColor()
        for _ in 0 ... 59 {
//            chartArray.append((Float)(arc4random() % 100))
        }
        
        chartArray.appendContentsOf(
            [
            50, 55, 60, 65, 70, 65, 60, 55, 50, 45,
            40, 35, 30, 35, 40, 45, 50, 55, 60, 65,
            70, 65, 60, 55, 50, 45, 40, 35, 30, 35,
            40, 45, 50, 55, 60, 65, 70, 65, 60, 55,
            50, 45, 40, 35, 30, 35, 40, 45, 50, 55,
            60, 65, 70, 65, 60, 55, 50, 45, 40, 35,
            ]
        )
        countNumber = 60
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /** 重置图表 */
    func resetChartView() -> Void {
        
        countNumber = 0
        chartArray.removeAll()
    }
    
    /** 添加新数据 */
    func streamAction(value: Float) -> Void {
        
        if countNumber < 60 {
            
            countNumber += 1
        }else {
            chartArray.removeAtIndex(0)
        }
        chartArray.append(value)
//        drawCurve()
    }
    
    //MARK: 绘图
    /** 绘图 */
    func drawCurve() -> Void {
        let currentContext = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(currentContext, 2)
        
        CGContextSetRGBStrokeColor(currentContext, 0.99, 0.01, 0.02, 1)
        
        CGContextMoveToPoint(currentContext, 0, (CGFloat)(chartArray[0]));
        
        var max = chartArray[0]
        var min = chartArray[0]
        
        for num in chartArray {
            if num > max {
                max = num
            }
            
            if num < min {
                min = num
            }
        }
        
        
//        var height = 100    //高度
        
        let unit = self.frame.size.height / (CGFloat)(max - min)   //单位距离
//        var averate = (max + min) / 2
        
        for i in 0 ... chartArray.count - 1 {
            let x = (CGFloat)(i * 3)
//            let num = (CGFloat)(chartArray[i])
            let num = max - chartArray[i]
            CGContextAddLineToPoint(currentContext, x, (CGFloat)(num) * unit)
            CGContextMoveToPoint(currentContext, x, (CGFloat)(num) * unit)
        }
        
        CGContextStrokePath(UIGraphicsGetCurrentContext())
    }
    
    func refresh() -> Void {
        streamAction(Float(arc4random() % 40 + 30))
        self.setNeedsDisplay()
    }
    
    
    override func drawRect(rect: CGRect) {
        drawCurve()
        self.performSelector(#selector(FifthQuartz.refresh), withObject: nil, afterDelay: 1)
    }
    
}
