//
//  ViewController.swift
//  L0102_操作plist数据
//
//  Created by TonyEarth on 16/4/16.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 取出plist中的数据（数组）
        let arr = NSArray(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TestArr", ofType: "plist")!));
        
        print(arr)
    }
}

