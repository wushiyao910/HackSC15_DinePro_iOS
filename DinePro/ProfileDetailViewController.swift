//
//  ViewController.swift
//  DinePro
//
//  Created by WuShiyao on 11/14/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ProfileDetailViewController: UIViewController {
    
    @IBOutlet weak var imageField: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Load the data from current user
        loadUserData()
//        if nameFieldParent.text == ""
//        {
//            performSegueWithIdentifier("NavToProfileVC", sender: nil)
//        }
    }
    
    func loadUserData()
    {
        var cUsr = PFUser.currentUser()
        cUsr?.fetchInBackground()
        
        //nameFieldParent.text = "Test"
        
//
//        if cUsr?["name"] == nil
//        {
//            nameFieldParent.text = ""
//        }
//        else
//        {
//            let nameTmp = cUsr?["name"] as? String
//            nameFieldParent.text = nameTmp
//        }
//        if let introTmp:String = cUsr?["intro"] as? String
//        {
//            introFieldParent.text = introTmp
//        }
//        if let universityTmp:String = cUsr?["university"] as? String
//        {
//            universityFieldParent.text = universityTmp
//        }
//        if let majorTmp:String = cUsr?["major"] as? String
//        {
//            majorFieldParent.text = majorTmp
//        }
//        if let companyTmp:String = cUsr?["company"] as? String
//        {
//            companyFieldParent.text = companyTmp
//        }
//        if let positionTmp:String = cUsr?["position"] as? String
//        {
//            positionFieldParent.text = positionTmp
//        }
        
//        nameFieldParent.text = cUsr?["name"] as? String
//        introFieldParent.text = cUsr?["intro"] as? String
//        universityFieldParent.text = cUsr?["university"] as? String
//        majorFieldParent.text = cUsr?["major"] as? String
//        companyFieldParent.text = cUsr?["company"] as? String
//        positionFieldParent.text = cUsr?["position"] as? String
    }
    
//    override func viewDidAppear(animated: Bool) {
//        let cUsr = PFUser.currentUser()
//        
//        nameFieldParent.text = cUsr?["name"] as? String
//                introFieldParent.text = cUsr?["intro"] as? String
//                universityFieldParent.text = cUsr?["university"] as? String
//                majorFieldParent.text = cUsr?["major"] as? String
//                companyFieldParent.text = cUsr?["company"] as? String
//                positionFieldParent.text = cUsr?["position"] as? String
//    }

    @IBOutlet weak var nameFieldParent: UILabel!
    @IBOutlet weak var genderFieldParent: UILabel!
    @IBOutlet weak var introFieldParent: UILabel!
    @IBOutlet weak var industryFieldParent: UILabel!
    @IBOutlet weak var universityFieldParent: UILabel!
    @IBOutlet weak var majorFieldParent: UILabel!
    @IBOutlet weak var companyFieldParent: UILabel!
    @IBOutlet weak var positionFieldParent: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func unwindSaveProfile(segue:UIStoryboardSegue)
    {
        loadUserData()
        
        
    }
    
    @IBAction func cancelEditProfile(segue:UIStoryboardSegue)
    {
        
        
    }
    

    

}

