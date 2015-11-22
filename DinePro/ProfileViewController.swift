//
//  ProfileViewController.swift
//  DinePro
//
//  Created by WuShiyao on 11/14/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import Foundation
import UIKit
import Parse
import Bolts

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
    
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "imageTapped:")
        
        
        photoField.addGestureRecognizer(tapGesture)
        
        self.photoField.layer.cornerRadius = self.photoField.frame.size.width / 2
        self.photoField.clipsToBounds = true
        
//        let barButtonAppearanceDict = [NSForegroundColorAttributeName: UIColor.whiteColor()]
//        tabBarItem.setTitleTextAttributes(barButtonAppearanceDict, forState: .Normal)
        
        let currentUser = PFUser.currentUser()
        
        
        if currentUser != nil
        {
            nameField.text = currentUser?["name"] as? String
            introField.text = currentUser?["intro"] as? String
            universityField.text = currentUser?["university"] as? String
            majorField.text = currentUser?["major"] as? String
            companyField.text = currentUser?["company"] as? String
            positionField.text = currentUser?["position"] as? String
        }
        else
        {
            self.nameField.text = nil
            self.introField.text = nil
            self.universityField.text = nil
            self.majorField.text = nil
            self.companyField.text = nil
            self.positionField.text = nil
        }
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "SaveProfile"
//        {
//            let name: String = nameField.text!
//            let photo: UIImage? = photoField.image
//            let gender: String? = genderField.titleForSegmentAtIndex(genderField.selectedSegmentIndex)
//            let intro: String? = introField.text
//            let tags: [String]? = parsetag(tagField.text!)
//            let company: String? = companyField.text
//            let position: String? = positionField.text
//            let education: String? = universityField.text
//            let major: String? = majorField.text
//            if !name.isEmpty
//            {
//                theUser = Person (name: name, photo: photo, gender: gender, intro: intro, tags: tags, company: company, position: position, education: education, major: major)
//            }
//        }
//    }
    
    @IBAction func saveButtonAction(sender: AnyObject) {
        var currentUser = PFUser.currentUser()
        currentUser?["name"] = nameField.text
        currentUser?["intro"] = introField.text
        currentUser?["university"] = universityField.text
        currentUser?["major"] = majorField.text
        currentUser?["company"] = companyField.text
        currentUser?["position"] = positionField.text
        
        if genderField.selectedSegmentIndex == 0
        {
            currentUser?["gender"] = "M"
        }
        else
        {
            currentUser?["gender"] = "F"
        }
        currentUser?.saveInBackgroundWithBlock{
            (success: Bool, error: NSError?) -> Void in
            if (success)
            {
                if self.nameField.text != "" {
                    
                    self.performSegueWithIdentifier("UnwindControllerConditional", sender: self)
                }
            }
            else
            {
                
            }
            
        }
        
        
    }
    
    func parsetag(tags: String) -> [String]{
        //var tagsarr: [String]?
        //return tagsarr = tags.componentsSeparatedByString(",")
        
        //return tagsarr
        if let tagsarr: [String] = tags.componentsSeparatedByString(",")
        {
            return tagsarr
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
    
        
    
}
