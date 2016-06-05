//
//  DrawBoardView.swift
//  L10_iOS绘图 API 绘制线条／文字／几何图形
//
//  Created by TonyEarth on 16/4/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class DrawBoardView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    let path = CGPathCreateMutable()
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let p = touches.first?.locationInView(self)
        CGPathMoveToPoint(path, nil, p!.x, p!.y)
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let p = touches.first?.locationInView(self)
        CGPathAddLineToPoint(path, nil, p!.x, p!.y)
        
        setNeedsDisplay()// 重绘当前view（触发drawRect）
    }
    override func drawRect(rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext()
        CGContextAddPath(context, path)
        CGContextStrokePath(context)
    }

}
