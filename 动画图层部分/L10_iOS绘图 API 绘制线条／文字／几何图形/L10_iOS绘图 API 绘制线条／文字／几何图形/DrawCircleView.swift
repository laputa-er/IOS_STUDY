//
//  DrawCircleView.swift
//  L10_iOS绘图 API 绘制线条／文字／几何图形
//
//  Created by TonyEarth on 16/4/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class DrawCircleView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func drawRect(rect: CGRect) {
        // 1. 获取上下文
        let context = UIGraphicsGetCurrentContext()
        
        // 2. 画圆
        /*-- 方案一 --*/
        // 内部用来填充的圆
        CGContextAddArc(context, 150, 200, 100, 0, 3.141592653 * 2, 0)
        CGContextSetRGBFillColor(context, 1, 0, 0, 1)
        CGContextFillPath(context)
        // 外部作为边的圆
        CGContextAddArc(context, 150, 200, 100, 0, 3.141592653 * 2, 0)
        CGContextSetLineWidth(context, 10)
        CGContextStrokePath(context)
        
        /*-- 方案二 --*/
        CGContextAddEllipseInRect(context, CGRectMake(50, 400, 200, 100))
        CGContextStrokePath(context)

        CGContextStrokePath(context)
    }

}
