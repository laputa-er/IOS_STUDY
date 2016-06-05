//
//  ViewController.swift
//  L0402_Swift解析XML格式的数据
//
//  Created by TonyEarth on 16/4/17.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSXMLParserDelegate {
    // 当前解析出的节点
    var currentNodeName:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 通过 xml 文件获取 NSXMLParser
        let parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("testData", ofType: "xml")!))
        // 设置代理
        parser?.delegate = self
        // 解析数据
        parser?.parse()
    }
    
    /**
     @ 采纳协议
     每解析到一个节点的开标签时调用一次
     */
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        currentNodeName = elementName
        
        // 打印 person 节点的 age 属性
        if elementName == "person" {
            if let age:AnyObject = attributeDict["age"] {
                print("age:\(age)")
            }
        }
    }
    
    /**
     @ 采纳协议
     每发现一个叶子节点包裹的字符串时调用一次
     */
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        let str = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        
        // 过滤掉空白符号(包括换行符)
        if str != "" {
            print("current node: \(currentNodeName), value:\(str)")
        }
    }
    
}

