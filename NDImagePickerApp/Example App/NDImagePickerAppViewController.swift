//
//  NDImagePickerAppViewController.swift
//  NDMediaPicker
//
//  Created by Dave Glassco on 1/17/20.
//  Copyright © 2020 Neone. All rights reserved.
//

import UIKit

class NDImagePickerAppViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropperViewControllerDelegate {

    var cropperState: CropperState?
    
    @IBOutlet weak var frameView: UIViewX!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func chooseImageTapped(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    
}

//MARK: ImagePickerDelegate
extension NDImagePickerAppViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
           guard let image = (info[.originalImage] as? UIImage) else { return }
        
        let cropper = CropperViewController(originalImage: image)

        cropper.delegate = self

        
//        imageView.image = image
        picker.dismiss(animated: true) {
            self.present(cropper, animated: true, completion: nil)
        }
    }
}


//MARK: CropperViewDelegate
extension NDImagePickerAppViewController {
    func cropperDidConfirm(_ cropper: CropperViewController, state: CropperState?) {
        cropper.dismiss(animated: true, completion: nil)

        if let state = state,
            let image = cropper.originalImage.cropped(withCropperState: state) {
            cropperState = state
            imageView.image = image
            print(cropper.isCurrentlyInInitialState)
            print(image)
        }
    }
}
