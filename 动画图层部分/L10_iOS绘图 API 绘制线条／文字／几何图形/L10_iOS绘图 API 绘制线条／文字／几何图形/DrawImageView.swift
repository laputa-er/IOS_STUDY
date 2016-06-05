//
//  DrawImageView.swift
//  L10_iOS绘图 API 绘制线条／文字／几何图形
//
//  Created by TonyEarth on 16/4/14.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class DrawImageView: UIView {
    var uiImage:CGImageRef?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        uiImage = UIImage(named: "walle.jpg")?.CGImage
    }
    override func drawRect(rect: CGRect) {
        // 获取上下文
        let context = UIGraphicsGetCurrentContext()
        
        /* 绘制图片 */
        // 1. 保留之前的上下文信息（设置暂存点）
        CGContextSaveGState(context)
        
        // 2. 设置当前上下文
        CGContextTranslateCTM(context, 10, 400)// 移动
        CGContextScaleCTM(context, 1, -1)// 缩放（翻转坐标系）
        // 3. 呈现图片
        CGContextDrawImage(context, CGRectMake(0, 0, 200, 200), uiImage)
        
        
        /* 绘制矩形 */
        CGContextRestoreGState(context)// 恢复暂存点之前的上下文
        CGContextStrokeRect(context, CGRectMake(50, 80, 100, 100))
    }
}
