//
//  ViewController.swift
//  Photo Machine Learning
//
//  Created by Peter Jenkin on 19/04/2019.
//  Copyright © 2019 Peter Jenkin. All rights reserved.
//

import UIKit
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    var chosenImage = CIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imageView.isUserInteractionEnabled = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeBtnClicked(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    /*
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?   // workaround to get original image https://stackoverflow.com/a/53219069
        
        // postImage.image = info[UIImagePickerControllerEditedImage] as? UIImage // didn't work as original image slipped through unused - no edited image to use
        
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage
        {   // NB Any type from dictionary - try to cast to UIImage
            selectedImageFromPicker = editedImage
        }
        else if let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            selectedImageFromPicker = originalImage
        }
        
        // cautious approach here!
        if let selectedImage = selectedImageFromPicker
        {
            imageView.image = selectedImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
*/
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        // colossal flag name - typed in nearly all before auto-complete
        // then UIImage auto-completed to huge name!
        // (happening on video too !)
        // get (hopefully) Image from picker cast as UIIMage
        //self.dismiss(animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
        self.dismiss(animated: true, completion: nil)
        
        if let ciImage = CIImage(image: imageView.image!)    // pass image into a Core Image instance
        {
            self.chosenImage = ciImage
        }
        
        recogniseImage(image: chosenImage)
        // info is a dictionary
    }

    // function in which to do ML-based recognition in image
    func recogniseImage(image: CIImage)     // NB CIImage (Core Image) not UIImage
    {
        
    }
    
    
}

