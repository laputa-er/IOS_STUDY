//
//  ViewController.swift
//  L0102_录制视频
//
//  Created by TonyEarth on 16/4/25.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit
import MobileCoreServices// 录制视频使用到的库
import MediaPlayer// 播放视频用到的库

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 图片选择器
    var picker:UIImagePickerController!// 可以选择从图库或摄像头中选择图片或视频（源为摄像头意味着拍照或视频）
    
    var videoUrl:NSURL?
    var player:MPMoviePlayerViewController!
    
    // 开始录制
    @IBAction func recVideoBtnClicked(sender: AnyObject) {
        picker = UIImagePickerController()
        picker.mediaTypes = [kUTTypeMovie as String]
        picker.sourceType = UIImagePickerControllerSourceType.Camera// 设置源通过摄像头
        picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureMode.Video// 设置摄像头为录制视频模式
        picker.delegate = self
        presentViewController(picker, animated: true, completion: nil)
    }
    
    // 开始播放
    @IBAction func playVideoBtnClicked(sender: AnyObject) {
        if let url = videoUrl {
            player = MPMoviePlayerViewController(contentURL: url)
            presentViewController(player, animated: true, completion: nil)
        }
    }
    
    // 选中了视频时（录制完成后）被调用
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        // 获取录制好的视频资源的url地址
        videoUrl = editingInfo![UIImagePickerControllerMediaURL] as? NSURL
        // 关闭录制视频的视图控制器
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 取消录制视频时被调用
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // 关闭录制视频的视图控制器
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
}
