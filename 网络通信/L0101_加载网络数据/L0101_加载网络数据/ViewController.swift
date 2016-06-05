//
//  ViewController.swift
//  L0101_加载网络数据
//
//  Created by TonyEarth on 16/4/20.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadJKPageByNSString()
    }
    
    /**
     同步方式请求极客学院首页（通过 NSString）
     */
    func loadJKPageByNSString() -> () {
        do {
            let str = try NSString(contentsOfURL: NSURL(string: "http://jikexueyuan.com")!, encoding: NSUTF8StringEncoding)
            
            let data = NSData(contentsOfURL: NSURL(string: "http://jikexueyuan.com")!)

            print(str)
            print(data)
        }
        catch {
            print("无法连接网络")
        }
    }
    
    /**
     同步方式请求极客学院首页（通过 NSURLConnection）
     */
    func loadJKPageByNSURLConnection() -> () {
        do {
            var resp:NSURLResponse?
            let data = try NSURLConnection.sendSynchronousRequest(NSURLRequest(URL: NSURL(string: "http://hikexueyuan.com")!), returningResponse: &resp)

            print(resp)
            print(data)
        }
        catch {
            print("无法连接网络")
        }
    }
}

