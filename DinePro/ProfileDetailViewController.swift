//
//  ViewController.swift
//  DinePro
//
//  Created by WuShiyao on 11/14/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import UIKit

class ProfileDetailViewController: UIViewController {
        
    var userCount = 0
    
    var theAccount: Person?
    
    let myPerson = PersonManager()

    @IBOutlet weak var imageField: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToList(segue: UIStoryboardSegue)
    {
        if segue.identifier == "SaveProfile"
        {
            let profileVC = segue.sourceViewController as! ProfileViewController
            if let theUser = profileVC.theUser
            {
                theAccount = theUser
                imageField.image = theAccount?.photo
                myPerson.peopleList += [theUser]
                myPerson.save()
            }
        }
    }

}

