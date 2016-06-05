//
//  ViewController.swift
//  L08Compass
//
//  Created by TonyEarth on 16/2/24.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var pointeriv: UIImageView!
    /* 1. 声明方位管理器 */
    var lm:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /* 2. 初始化方位管理器 */
        lm = CLLocationManager()
        lm.delegate = self// 指定 delegate（需要采纳CLLocationManagerDelegate协议）
    }
    
    /* 3. view渲染时启动侦测 */
    override func viewWillAppear(animated: Bool) {
        // 启动任务：不断获取指南针数据
        lm.startUpdatingHeading()
    }
    
    /**
    * 采纳协议（CLLocationManagerDelegate）
    * 当方位发生变化时调用该方法
    */
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading)
        // 设置图片的角度（需要将小数转换为弧度）
        pointeriv.transform = CGAffineTransformMakeRotation(CGFloat(180.0 - newHeading.magneticHeading / 180.0 * 3.141592654))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

