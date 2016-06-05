//
//  ViewController.swift
//  L0104_通过GET方式与服务器通信
//
//  Created by TonyEarth on 16/4/21.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInput: UITextField!// 输入请求参数
    @IBOutlet weak var textShow: UITextView!// 展示请求会的结果
    // 发送请求
    @IBAction func btnRequestPressed(sender: AnyObject) {
        testPost()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /**
     发送 get 请求
     */
    func testGet()-> () {
        let name = textInput.text!
        // 创建一个线程发起请求，不占用主线程的资源
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: NSURL(string: "http://localhost:8080/MyServer/returnParas.jsp?name=\(name)")!), queue: NSOperationQueue(), completionHandler: {
            (resp:NSURLResponse?, data:NSData?, error:NSError?) -> () in
            if let d = data {
                // 交给主线程处理
                dispatch_sync(dispatch_get_main_queue(), {
                    () -> Void in
                    // self.textShow 是主线程的控件，因此必须在主线程中处理
                    self.textShow.text = NSString(data: d, encoding: NSUTF8StringEncoding)! as String
                })
            }
        })
    }
    
    /**
     发送post请求
     */
    func testPost()->() {
        let name = textInput.text!
        // 创建并设置请求
        let req = NSMutableURLRequest(URL: NSURL(string: "http://localhost:8080/MyServer/returnParas.jsp")!)
        req.HTTPMethod = "POST"
        req.HTTPBody = NSString(string: "name=\(name)").dataUsingEncoding(NSUTF8StringEncoding)
        
        // 发起请求
        NSURLConnection.sendAsynchronousRequest(req, queue: NSOperationQueue(), completionHandler: {
            (resp:NSURLResponse?, data:NSData?, error:NSError?) -> () in
            if let d = data {
                dispatch_sync(dispatch_get_main_queue(), {
                    self.textShow.text = NSString(data: d, encoding: NSUTF8StringEncoding)! as String
                })
            }
        })
        
    }
}

