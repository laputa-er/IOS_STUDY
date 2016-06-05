//
//  ViewController.swift
//  L0102_异步加载网络数据
//
//  Created by TonyEarth on 16/4/20.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadJKPage()
    }

    func loadJKPage() -> () {
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: NSURL(string: "http://jikexueyuan.com")!), queue: NSOperationQueue()) {(resp:NSURLResponse?, data:NSData?, error:NSError?) -> Void in
            if let e = error {
                print("请求失败:\(e)")
            }
            else {
                print(NSString(data: data!, encoding: NSUTF8StringEncoding))
            }
        }
    }
}

