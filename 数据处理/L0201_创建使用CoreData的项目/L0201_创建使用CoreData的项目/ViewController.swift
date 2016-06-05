//
//  ViewController.swift
//  L0201_创建使用CoreData的项目
//
//  Created by TonyEarth on 16/4/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        // 1. 获取操作sqlite的上下文环境
        let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        // 2. 为 Users 表插入一行数据
        // 创建一行（字段为默认值）
        let row:AnyObject = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext:context)
        // 设置 name 字段
        row.setValue("jikexueyuan", forKey:"name")
        // 设置 age 字段
        row.setValue(10, forKey: "age")
        
        //3. 持久化
        do {
            try context.save()
        }
        catch {
            print("insert Error")
        }
    }
}

