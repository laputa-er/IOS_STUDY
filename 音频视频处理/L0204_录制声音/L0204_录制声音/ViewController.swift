//
//  ViewController.swift
//  L0204_录制声音
//
//  Created by TonyEarth on 16/4/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var avRec:AVAudioRecorder!// 录音器
    var audioFileUrl:NSURL!// 保存地址
    var avPlayer:AVAudioPlayer!// 播放器
    
    // 开始录音
    @IBAction func startRectBtnClicked(sender: AnyObject) {
        print("start rec")
        avRec.record()
    }
    
    // 停止录音
    @IBAction func stopRecBtnClicked(sender: AnyObject) {
        print("stop rec")
        avRec.stop()
    }
    
    // 播放音乐
    @IBAction func playRectBtnClicked(sender: AnyObject) {
        print("play rec：\(audioFileUrl)")
        avPlayer = try? AVAudioPlayer(contentsOfURL: audioFileUrl)
        avPlayer.prepareToPlay()
        avPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        audioFileUrl = (NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentationDirectory, inDomains: NSSearchPathDomainMask.AllDomainsMask)[0] as NSURL).URLByAppendingPathComponent("rec")
        avRec = try? AVAudioRecorder(URL: audioFileUrl,
                                        settings: [:])
        avRec.prepareToRecord()

        // 查看文件路径
        let sp = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentationDirectory, inDomains: NSSearchPathDomainMask.AllDomainsMask)
        for item in sp {
            print("\(item)")
        }
    }
}

