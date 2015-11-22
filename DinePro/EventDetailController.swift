//
//  EventDetailController.swift
//  DinePro
//
//  Created by Jason Chen on 11/15/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import Foundation
import UIKit

class EventDetailController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mealLabel: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    
    var theEvent: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        self.dateLabel.text = dateFormatter.stringFromDate((theEvent?.date)!)
        self.mealLabel.text = theEvent?.meal
        self.topicLabel.text = theEvent?.topic
       /*
        let tagArr: [String]? = theEvent!.tags
        var tagStr = ""
        for tagIndex in 0...tagArr?.count-1
        {
            tagStr += tagArr[tagIndex]
        }
*/
        self.foodLabel.text = theEvent?.food
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}