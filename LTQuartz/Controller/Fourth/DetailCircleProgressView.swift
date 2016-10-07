//
//  DetailCircleProgressView.swift
//  LTQuartz
//
//  Created by LaoTao on 16/6/8.
//  Copyright © 2016年 LaoTao. All rights reserved.
//

import UIKit

class DetailCircleProgressView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    /** 进度轨道 */
    var progressLayer: CAShapeLayer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        customUI()
    }
    
    /** 设置进度条颜色 */
    func setCircleViewProgressTintColor(color: UIColor) -> Void {
        progressLayer.strokeColor = color.CGColor
    }
    
    func setProgress(progress: CGFloat) -> Void {
        progressLayer.strokeEnd = progress
    }
    
    
    /** 初始化UI */
    func customUI() -> Void {
        let trackLayer = CAShapeLayer()
        trackLayer.path = drawPathWithArcCenter()
        trackLayer.fillColor = UIColor.clearColor().CGColor
        
        trackLayer.strokeColor = UIColor.cyanColor().CGColor
        trackLayer.opacity = 1  //圆环的背景透明度
        trackLayer.lineWidth = 10
        trackLayer.lineCap = kCALineCapRound
        trackLayer.lineJoin = kCALineCapRound
        self.layer.addSublayer(trackLayer)
        
        progressLayer = CAShapeLayer()
        progressLayer.path = drawPathWithArcCenter()
        progressLayer.fillColor = UIColor.clearColor().CGColor
        progressLayer.opacity = 1
        progressLayer.lineWidth = trackLayer.lineWidth
        progressLayer.lineCap = trackLayer.lineCap
        progressLayer.lineJoin = trackLayer.lineJoin
        self.layer.addSublayer(progressLayer)
    }
    
    /** 绘制路径 */
    func drawPathWithArcCenter() -> CGPathRef {
        let position_x = self.frame.width / 2
        let position_y = self.frame.height / 2
        
        return UIBezierPath(arcCenter: CGPointMake(position_x, position_y), radius: position_x - 10, startAngle: (CGFloat)(M_PI / -2), endAngle: (CGFloat)(M_PI * 3 / 2), clockwise: true).CGPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


























