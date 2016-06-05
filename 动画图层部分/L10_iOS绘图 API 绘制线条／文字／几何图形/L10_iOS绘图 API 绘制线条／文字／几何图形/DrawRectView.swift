//
//  DrawRectView.swift
//  L10_iOS绘图 API 绘制线条／文字／几何图形
//
//  Created by TonyEarth on 16/4/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class DrawRectView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func drawRect(rect: CGRect) {
        // 1. 获取绘图上下文
        let context = UIGraphicsGetCurrentContext()
        
        // 2. 矩形
        CGContextAddRect(context, CGRectMake(100, 100, 100, 100))
        
        // 3. 设置绘图上下文
        CGContextSetRGBFillColor(context, 1, 0, 0, 1)
        CGContextFillPath(context)
        CGContextSetLineWidth(context, 5)
        CGContextSetRGBStrokeColor(context, 0, 1, 0, 1)
        
        // 4. 绘制出矩形
        CGContextStrokeRect(context, CGRectMake(100, 100, 100, 100))
    }
}
