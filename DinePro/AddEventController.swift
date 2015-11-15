//
//  AddEventController.swift
//  DinePro
//
//  Created by WuShiyao on 11/14/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import Foundation
import UIKit

class AddEventController: UIViewController
{
    @IBOutlet weak var DateSB: UISegmentedControl!
    @IBOutlet weak var MealSB: UISegmentedControl!
    @IBOutlet weak var TopicText: UITextField!
    @IBOutlet weak var FoodText: UITextField!
    @IBOutlet weak var DPNavBar: UINavigationBar!
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    var newEvent: Event?
    
    @IBAction func DateSB1(sender: UISegmentedControl) {
        switch DateSB.selectedSegmentIndex
        {
        case 0:
            self.FoodText.resignFirstResponder()
            self.TopicText.resignFirstResponder()
            hide()
            break
        case 1:
            self.FoodText.resignFirstResponder()
            self.TopicText.resignFirstResponder()
            show()
            break
        default:
            break
        }
    }
    @IBAction func DoneBtn(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let str: String = dateFormatter.stringFromDate(DatePicker.date)
        DateSB.setTitle(str, forSegmentAtIndex: 1)
        hide()
    }
    
    func hide()
    {
        DPNavBar.hidden = true
        DatePicker.hidden = true
    }
    
    func show()
    {
        DPNavBar.hidden = false
        DatePicker.hidden = false
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SubmitNewEvent"
        {
            if FoodText.text != "" && TopicText.text != ""{
                let topic: String? = TopicText.text
                var date = NSDate()
                if DateSB.selectedSegmentIndex == 1 {
                    date = DatePicker.date
                }
                let meal: String? = MealSB.titleForSegmentAtIndex(MealSB.selectedSegmentIndex)
                let food: String? = FoodText.text
                newEvent = Event(topic: topic!, date: date, meal: meal!, food: food!)
            }
            // set the properties of newEvent
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hide()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
