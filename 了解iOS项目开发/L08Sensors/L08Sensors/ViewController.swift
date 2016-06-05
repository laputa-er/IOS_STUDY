//
//  ViewController.swift
//  L08Sensors
//
//  Created by TonyEarth on 16/2/22.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {
    // 1. 声明传感器控制器
    var cmm: CMMotionManager!
    var q: NSOperationQueue!
    // 2. 载入视图时初始化加速度传感器
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cmm = CMMotionManager()
        q = NSOperationQueue()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
    * 开始获取减速器数据的任务
    */
    func startAccelerateremoterUpdate() {
        /* 加速度 */
        cmm.accelerometerUpdateInterval = 1// 每秒获取的次数
        if cmm.accelerometerAvailable && !cmm.accelerometerActive {
            // start后一定要stop
            cmm.startAccelerometerUpdatesToQueue(q, withHandler: {
                (data:CMAccelerometerData?, err:NSError?) in
                print("AccesslateData: \(data)")
            })
        }
        else {
            print("加速器传感器不可用！")
        }
    }
   
    /**
    * 开始获取陀螺仪数据的任务
    */
    func startGyroUpdate() {
        /* 陀螺仪 */
        cmm.gyroUpdateInterval = 1
        if cmm.gyroAvailable && !cmm.gyroActive {
            cmm.startGyroUpdatesToQueue(q, withHandler: {
                (data:CMGyroData?, err: NSError?) in
                print("Gyno data: \(data)")
            })
        }
        else {
            print("陀螺仪传感器不可用！")
        }
    }
    /**
     * 开始侦听距离传感器
     */
    func startListenProximity() {
        UIDevice.currentDevice().proximityMonitoringEnabled = true// 是否侦听距离传感器
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("proximityChanged"), name: UIDeviceProximityStateDidChangeNotification, object: nil)// 将距离传感器侦测到的变化通知到proximityChanged方法
    }
    
    /**
     * 距离变化被侦测到时调用的方法
     */
    func proximityChanged() {
        print("\(UIDevice.currentDevice().proximityState)")// 距离传感器前是否有障碍物
    }
    
    /**
     * 停止侦测距离传感器
     */
    func stopListenProximity() {
        // NSNotificationCenter.defaultCenter().removeObserver(self)// 移除绑定在当前类上的所有类型的侦听任务
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIDeviceProximityStateDidChangeNotification, object: nil)// 移除当前view中的所有距离侦听任务
    }
    
    /**
    * 开始侦听电量
    */
    func startListenLevel() {
        UIDevice.currentDevice().batteryMonitoringEnabled = true// 是否侦听电量
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "levelChanged", name: UIDeviceBatteryLevelDidChangeNotification, object: nil)// 将距离传感器侦测到的变化通知到levelChanged方法
    }
    
    /**
     * 电量变化被侦测到时调用的方法
     */
    func levelChanged() {
        print("\(UIDevice.currentDevice().batteryLevel)")// 0～1

    }
    /**
    * 停止侦听电量
    */
    func stopListenLevel() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIDeviceBatteryLevelDidChangeNotification, object: nil)// 移除当前view中的所有电量侦听任务
    }
    
    /**
    * 停止侦测加速度
    */
    func stopAccelerateremoterUpdate() {
        if cmm.accelerometerActive && cmm.accelerometerActive {
            cmm.stopAccelerometerUpdates()
        }
    }
    
    /**
     * 停止侦测陀螺仪
     */
    func stopGyroUpdate() {
        /* 陀螺仪 */
        if cmm.gyroActive && cmm.gyroActive {
            cmm.stopGyroUpdates()
        }
    }
    
    // 3. 页面展现时开始侦测
    override func viewWillAppear(animated: Bool) {
        startAccelerateremoterUpdate()
        startGyroUpdate()
        startListenProximity()
        startListenLevel()
        
    }
    // 4. 页面退出时停止侦测
    override func viewWillDisappear(animated: Bool) {
        stopAccelerateremoterUpdate()
        stopGyroUpdate()
        stopListenProximity()
        stopListenLevel()
    }
}

