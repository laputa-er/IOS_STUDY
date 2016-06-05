//
//  ViewController.swift
//  L0201_playSound
//
//  Created by TonyEarth on 16/4/26.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

    var aPlayer:AVAudioPlayer!
    // 播放
    @IBAction func playBtnClicked(sender: AnyObject) {
        aPlayer.play()
    }
    // 暂定
    @IBAction func pauseBtnClicked(sender: AnyObject) {
        aPlayer.pause()// 暂停后音乐仍然处在准备播放的状态
    }
    
    // 停止
    @IBAction func stopBtnClicked(sender: AnyObject) {
        aPlayer.stop()// 通知后音乐不会处在准备播放状态，但会记住停止时的位置
        aPlayer.currentTime = 0
    }
    
    // 另一种方式播放音乐
    @IBAction func playSongBtnClicked(sender: AnyObject) {
        // 初始化播放控制器
        let p = MPMoviePlayerViewController(contentURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sound", ofType: "mp3")!))
        // 开始播放
        presentViewController(p, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        do {
            // 初始化 AVAudioPlayer
            aPlayer = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sound", ofType: "mp3")!))
        }
        catch {
            print("failed")
        }
        
    }
}

