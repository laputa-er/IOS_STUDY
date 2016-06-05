//
//  DrawLinesView.swift
//  L10_iOS绘图 API 绘制线条／文字／几何图形
//
//  Created by TonyEarth on 16/4/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class DrawLinesView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        // 1. 获取绘图上下文
        let context = UIGraphicsGetCurrentContext()
        
        // 2. 描绘线条
        CGContextMoveToPoint(context, 100, 100)
        CGContextAddLineToPoint(context, 100, 200)
        CGContextAddLineToPoint(context, 200, 200)
        
        CGContextMoveToPoint(context, 100, 300)
        CGContextAddLineToPoint(context, 100, 400)
        CGContextAddLineToPoint(context, 200, 500)
        
        // 3. 设置上下文
        CGContextSetRGBStrokeColor(context, 1, 0, 1, 1)
        CGContextSetLineWidth(context, 5)
        
        // 4. 绘制出来
        CGContextStrokePath(context)
    }
}
