//
//  ViewController.swift
//  L0103_plist字典解析
//
//  Created by TonyEarth on 16/4/16.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        let dict = NSDictionary(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TestDic", ofType: "plist")!));
        
        print(dict)
    }
}

