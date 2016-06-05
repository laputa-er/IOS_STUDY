//
//  ViewController.swift
//  L03_操作JSON数据
//
//  Created by TonyEarth on 16/4/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        readJSON()
        createJSON()
    }
    
    func readJSON() -> Void {
        do {
            // 从json文件中读取 json 格式数据
            let json:AnyObject? = try NSJSONSerialization.JSONObjectWithData(NSData(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("obj", ofType: "json")!))!, options: NSJSONReadingOptions())
            
            // 索引 json 内容
            if let lang:AnyObject = json?.objectForKey("language") {
                print(lang)
            }
        }
        catch {
            print("json 文件读取失败")
        }
    }
    
    func createJSON() -> Void {
        // 字典
        let dict = ["name":"lixiangguo", "age": "-1"];
        do {
            // 将字典转化为 json 格式的NSData
            let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions())
            // 将 NSData 转换为 NSString
            let jsonStr  = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
            print(jsonStr)
        }
        catch {
            print("字典解析为json格式字符串失败")
        }

    }
}

