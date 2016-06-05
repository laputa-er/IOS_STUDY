//
//  ViewController.swift
//  GetPhoto
//
//  Created by TonyEarth on 16/2/27.
//  Copyright © 2016年 TonyEarth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var iv: UIImageView!

    @IBAction func getPhotoPressed(sender: AnyObject) {
        let c = UIImagePickerController()
        c.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        c.delegate = self
        self.presentViewController(c, animated: true, completion: nil)
    }
    
    //  采纳UIImagePickerControllerDelegate协议:选好照片时调用
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image:UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        iv.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
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

