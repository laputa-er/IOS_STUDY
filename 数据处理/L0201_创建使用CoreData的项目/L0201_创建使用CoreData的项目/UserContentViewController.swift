//
//  UserContentViewController.swift
//  L0201_创建使用CoreData的项目
//
//  Created by TonyEarth on 16/4/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import CoreData

class UserContentViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!// 姓名
    @IBOutlet weak var tfAge: UITextField!// 年龄
    var data:NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfName.text = data.valueForKey("name") as? String
        let age:AnyObject! = data.valueForKey("age")
        tfAge.text = "\(age)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 点击提交按钮
    @IBAction func submitBtnPressed(sender: AnyObject) {
        // 更新数据
        data.setValue(tfName.text, forKey: "name")
        data.setValue(Int(tfAge.text!), forKey: "age")
        do {
            try data.managedObjectContext?.save()
            dismissViewControllerAnimated(true, completion: nil)
        }
        catch {
            print("save failed")
        }
    }
    
    // 点击取消按钮
    @IBAction func cancelBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
