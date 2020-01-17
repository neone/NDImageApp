//
//  NDImagePickerAppViewController.swift
//  NDMediaPicker
//
//  Created by Dave Glassco on 1/17/20.
//  Copyright © 2020 Neone. All rights reserved.
//

import UIKit

class NDImagePickerAppViewController: UIViewController, NDImagePickerDelegate {
 
    var cropperState: CropperState?
    var isRounded = false
    var shouldCrop = false
    
    @IBOutlet weak var frameView: UIViewX!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var roundedSwitch: UISwitch!
    @IBOutlet weak var cropSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func roundedSwitchChanged(_ sender: Any) {
        if roundedSwitch.isOn {
            let roundness = frameView.height / 2
            frameView.cornerRadius = roundness
            isRounded = true
        } else {
            frameView.cornerRadius = 5
            isRounded = false
        }
    }
    
    @IBAction func chooseImageTapped(_ sender: Any) {
        let picker = NDImageManager()
        picker.imagePickerDelegate = self
        
        if roundedSwitch.isOn {
            picker.isRounded = true
        } else {
            picker.isRounded = false
        }
        
        if cropSwitch.isOn {
            picker.shouldCrop = true
        } else {
            picker.shouldCrop = false
        }
        
        present(picker, animated: true, completion: nil)
    }
    
    func editedImageReturned(image: UIImage) {
        imageView.image = image
    }
    
}
