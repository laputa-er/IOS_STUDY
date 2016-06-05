//
//  ViewController.swift
//  L10Call
//
//  Created by TonyEarth on 16/2/25.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // ime
    @IBAction func callImePressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "ime://i.loce.you?h=Hello&b=world")!)
    }
    // 发短信
    @IBAction func sendSMSBtnPressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "sms://10086")!)
    }
    
    // 打电话
    @IBAction func makeCallBtnPressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://10086")!)
    }

    // 发邮件
    @IBAction func sendMailBtnPressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "mailto://xx@jikexueyuan.com")!)
    }
    
    // 打开网址
    @IBAction func openJikexueyuanPressed(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://jikexueyuan.com")!)
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

