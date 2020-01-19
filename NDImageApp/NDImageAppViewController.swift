//
//  NDImageAppViewController.swift
//  NDMediaPicker
//
//  Created by Dave Glassco on 1/17/20.
//  Copyright © 2020 Neone. All rights reserved.
//

import UIKit
import NDImageManager

class NDImageAppViewController: UIViewController, NDImagePickerDelegate {
 
 
    //MARK: Variables and Outlets
    var isRounded = false
    var isEditable = true
    
    
    @IBOutlet weak var frameView: UIViewX!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var roundedSwitch: UISwitch!
    @IBOutlet weak var editSwitch: UISwitch!
    
    //MARK: - Initializers and Actions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func roundedSwitchChanged(_ sender: Any) {
        if roundedSwitch.isOn {
            let roundness = frameView.frame.height / 2
            frameView.cornerRadius = roundness
            isRounded = true
        } else {
            frameView.cornerRadius = 5
            isRounded = false
        }
    }
    
    @IBAction func showEditingChanged(_ sender: Any) {
        if editSwitch.isOn {
            isEditable = true
        } else {
            isEditable = false
        }
    }
    
    
    @IBAction func chooseImageTapped(_ sender: Any) {
        if roundedSwitch.isOn {
            isRounded = true
        }
        
        let picker = NDImageManager()
        picker.imagePickerDelegate = self
        picker.setUpImageManager(pickImage: true, editable: isEditable, rounded: isRounded)
        present(picker, animated: true, completion: nil)
    }
    
    //NDImageManagerMethodsw
    func editedImageReturned(image: UIImage) {
        imageView.image = image
    }
    
    func pickerCancelled() {
     }
     
}
