//
//  ViewController.swift
//  L0101_播放视频
//
//  Created by TonyEarth on 16/4/25.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    // 视频播放控制器
    var pc:MPMoviePlayerViewController!
    
    // 点击播放视频，开始播放视频文件
    @IBAction func playVideoBtnClicked(sender: AnyObject) {
        // 初始化视频播放控制器
        pc = MPMoviePlayerViewController(contentURL: NSBundle.mainBundle().URLForResource("video", withExtension: "mov"))
        // 开始播放
        presentViewController(pc, animated: true, completion: nil)
    }
}

