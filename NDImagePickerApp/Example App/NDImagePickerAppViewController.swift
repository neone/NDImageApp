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
    
    @IBOutlet weak var frameView: UIViewX!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func chooseImageTapped(_ sender: Any) {
        let picker = NDImagePickerViewController()
        picker.imagePickerDelegate = self
        picker.shouldCrop = true
        present(picker, animated: true, completion: nil)
    }
    
    func editedImageReturned(image: UIImage) {
        imageView.image = image
    }
    
}
