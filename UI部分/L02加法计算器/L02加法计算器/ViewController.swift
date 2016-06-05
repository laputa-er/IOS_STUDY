//
//  ViewController.swift
//  L02加法计算器
//
//  Created by TonyEarth on 16/2/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var text1: UITextField!// 操作数1控件
    @IBOutlet var text2: UITextField!// 操作数2控件
    @IBOutlet var result: UILabel!// 结果控件
    // 计算
    @IBAction func calculate() {
        let num1 = Int(self.text1.text!) ?? 0
        let num2 = Int(self.text2.text!) ?? 0

        let resultNum = num1 + num2
        
        let resultString = "\(resultNum)"//String(resultNum)
        self.result.text = resultString
        
        // 使输入框失去焦点
        self.text1.endEditing(true)
        self.text2.endEditing(true)
    }
    
    // 清零
    @IBAction func reset() {
        self.result.text = "0"
        self.text1.text = ""
        self.text2.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

