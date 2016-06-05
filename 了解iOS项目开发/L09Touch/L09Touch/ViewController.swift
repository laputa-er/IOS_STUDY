//
//  ViewController.swift
//  L09Touch
//
//  Created by TonyEarth on 16/2/24.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var lastDistance: Float = 0.0
    
    @IBOutlet var iv: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.multipleTouchEnabled = true// 启动多点触摸
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        lastDistance = 0.0
        
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // 判断是不是两点触控
        if touches.count == 2 {
            // 对 Set 排序，才能通过下标进行索引
            var touchesSorted = touches.sort({s1, s2 in s1.tapCount.bigEndian > s1.tapCount.bigEndian})
            // 通过勾股定理计算两点之间的距离
            let p1 = touchesSorted[0].locationInView(self.view)
            let p2 = touchesSorted[1].locationInView(self.view)
            let xx = p1.x - p2.x
            let yy = p1.y - p2.y
            
            let curDistance = Float(sqrt(xx * xx + yy * yy))
            
            // 首次缩放触摸操作
            if lastDistance == 0.0 {
                lastDistance = curDistance
            }
            else {
                // 缩小
                if lastDistance - curDistance > 5 {
                    print("缩小")
                    lastDistance = curDistance
                    iv.transform = CGAffineTransformScale(iv.transform, 0.9, 0.9)
                }
                // 放大
                else if lastDistance - curDistance < -5{
                    print("放大")
                    lastDistance = curDistance
                    iv.transform = CGAffineTransformScale(iv.transform, 1.1, 1.1)
                }
            }
            
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesEnded")
    }
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print("touchesCancelled")
    }

}

