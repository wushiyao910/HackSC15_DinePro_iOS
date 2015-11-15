//
//  ProfileViewController.swift
//  DinePro
//
//  Created by WuShiyao on 11/14/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: ProfileDetailViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoField: UIImageView!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var genderField: UISegmentedControl!
    
    @IBOutlet weak var introField: UITextField!
    
    @IBOutlet weak var tagField: UITextField!
    
    @IBOutlet weak var universityField: UITextField!
    
    @IBOutlet weak var majorField: UITextField!
    
    @IBOutlet weak var companyField: UITextField!
    
    @IBOutlet weak var positionField: UITextField!
    
    
    var theUser: Person?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "imageTapped:")
        
        photoField.addGestureRecognizer(tapGesture)
//        let barButtonAppearanceDict = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//        tabBarItem.setTitleTextAttributes(barButtonAppearanceDict, forState: .Normal)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveProfile"
        {
            if let name = nameField.text
            {
                if !name.isEmpty
                {
                    theUser = Person (name: name)
                    theUser?.photo = photoField.image
                }
            }
        }
    }
    
    func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if let _ = gesture.view as? UIImageView {
            print("Image Tapped")
            //Here you can initiate your new ViewController
            
            let imagePicker = UIImagePickerController()
            
            if UIImagePickerController.isSourceTypeAvailable(.Camera)
            {
                imagePicker.sourceType = .Camera
            }
            else
            {
                imagePicker.sourceType = .PhotoLibrary
            }
            
            imagePicker.delegate = self
            presentViewController(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoField.image = photo
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func Cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    
}
