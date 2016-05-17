//
//  ViewController.swift
//  SnapShot
//
//  Created by Oliver Short on 5/17/16.
//  Copyright © 2016 Oliver Short. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var contentModeSegmentedControl: UISegmentedControl!
    @IBOutlet var imageView: UIImageView!
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        picker.delegate = self
    }

    @IBAction func ChooseButtonPressed() {
        picker.sourceType = .PhotoLibrary
        picker.allowsEditing = false
        presentViewController(picker, animated: true, completion: nil)
        
    }

    @IBAction func TakeButtonTapped() {
        
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            
        picker.sourceType = .Camera
        picker.allowsEditing = true
        presentViewController(picker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        [String : AnyObject]) {
        
//creating an object called photo to get a UIImage out of the dictionary presented from the Camera Roll. Not all objects from the camera roll at photos (urls, info, etc. Using an if let is like a guard statement, that makes sure the object can be defined as an image before we display it in the imageView
        
        if let edited = info[UIImagePickerControllerEditedImage ] as? UIImage{
            imageView.image = edited
        }
        else if let photo = info[UIImagePickerControllerOriginalImage ] as? UIImage {
            imageView.image = photo
        }
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func contentModeChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.imageView.contentMode = .ScaleAspectFit
            break
        case 1:
            self.imageView.contentMode = .ScaleAspectFill
            break
        case 2:
            self.imageView.contentMode = .ScaleToFill
            break
        default:
            break
        }
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

