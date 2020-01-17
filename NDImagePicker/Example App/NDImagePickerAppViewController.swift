//
//  NDImagePickerAppViewController.swift
//  NDMediaPicker
//
//  Created by Dave Glassco on 1/17/20.
//  Copyright © 2020 Neone. All rights reserved.
//

import UIKit

class NDImagePickerAppViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var frameView: UIViewX!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            if imageView != nil {
                imageInstrucitons.isHidden = true
            }
        }
    }
    
    @IBOutlet weak var imageInstrucitons: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func chooseImageTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
           guard let image = (info[.originalImage] as? UIImage) else { return }
        
        imageView.image = image
        picker.dismiss(animated: true) 
    }
}

