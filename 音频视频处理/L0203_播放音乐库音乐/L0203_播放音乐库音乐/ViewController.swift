//
//  ViewController.swift
//  L0203_播放音乐库音乐
//
//  Created by TonyEarth on 16/4/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {
    var picker:MPMediaPickerController!// 选择音乐控制器
    var player:MPMusicPlayerController!// 播放音乐控制器
    
    // 选择音乐
    @IBAction func btnSelectMusicClicked(sender: AnyObject) {
        presentViewController(picker, animated: true, completion: nil)
    }
    
    // 选择音乐完成后调用
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        // 关闭视频选择控制器
        mediaPicker.dismissViewControllerAnimated(true, completion: nil)
        // 将选中的音乐加入到播放列表
        player.setQueueWithItemCollection(mediaItemCollection)
        // 开始播放
        player.play()
        
        // 获取选中的第一首歌的名字
        let firstName:AnyObject = mediaItemCollection.items[0].valueForProperty(MPMediaItemPropertyTitle)!
        print("\(firstName)")
    }
    
    // 取消播放时调用
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        print("Cancel")
        mediaPicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        picker = MPMediaPickerController(mediaTypes: MPMediaType.Music)
        picker.allowsPickingMultipleItems = true// 可以选择多个
        picker.delegate = self
        
        player = MPMusicPlayerController.systemMusicPlayer()// 创建全局音乐播放器(程序退出后仍可以播放)
    }
}