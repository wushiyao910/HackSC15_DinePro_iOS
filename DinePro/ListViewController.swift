//
//  ListViewController.swift
//  DinePro
//
//  Created by WuShiyao on 11/14/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import Foundation
import UIKit

let myEvent = EventManager()

class ListViewController: UIViewController, UINavigationControllerDelegate {
    
    @IBAction func unwindToList(segue: UIStoryboardSegue)
    {
        if segue.identifier == "SubmitNewEvent"
        {
            let addEventVC = segue.sourceViewController as! AddEventController
            if let newEvent = addEventVC.newEvent
            {
                myEvent.eventsList += [newEvent]
                myEvent.save()
            }
        }
    }
}
