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

class ListViewController:  UITableViewController, UINavigationControllerDelegate {
    
    @IBAction func unwindToList(segue: UIStoryboardSegue)
    {
        if segue.identifier == "SubmitNewEvent"
        {
            let addEventVC = segue.sourceViewController as! AddEventController
            if let newEvent = addEventVC.newEvent
            {
                myEvent.eventsList += [newEvent]
                myEvent.save()
                let indexPath = NSIndexPath(forItem: 0, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }
        }
    }
    
    
    let myEvent = EventManager()
    // MARK: - Table view data source
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfSec: Int = myEvent.eventsList.count
        return numberOfSec
    }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath) as! LabelCell
        //        let numberOfCells: Int = myEvent.eventsList.count - 1
        
        let event = myEvent.eventsList[myEvent.eventsList.count - 1 - indexPath.row]
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        cell.DateLabel.text = dateFormatter.stringFromDate(event.date)
        cell.MealLabel.text = event.meal
        cell.TopicLabel.text = event.topic
        cell.FoodLabel.text = event.food
        /*if indexPath.row % 2 == 1
        {
        cell.contentView.backgroundColor = UIColorFromRGB("f8f8f8")
        
        }
        else
        {
        cell.contentView.backgroundColor = UIColorFromRGB("ffffff")
        }*/
        //let mgCell = tableView.dequeueReusableCellWithIdentifier("marginCell", forIndexPath: indexPath) as! marginCell
        
        
        
        return cell
    }
    
    func UIColorFromRGB(colorCode: String, alpha: Float = 1.0) -> UIColor {
        var scanner = NSScanner(string:colorCode)
        var color:UInt32 = 0;
        scanner.scanHexInt(&color)
        
        let mask = 0x000000FF
        let r = CGFloat(Float(Int(color >> 16) & mask)/255.0)
        let g = CGFloat(Float(Int(color >> 8) & mask)/255.0)
        let b = CGFloat(Float(Int(color) & mask)/255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
    
    var eventPass: Event?
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        eventPass = myEvent.eventsList[myEvent.eventsList.count - 1 - indexPath.row]
        self.performSegueWithIdentifier("eventDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "eventDetail" {
            let eventTemp = segue.destinationViewController as! UINavigationController
            let eventDest = eventTemp.viewControllers.first as! EventDetailController
            eventDest.theEvent = eventPass

            
        }
    }
    
    let myPerson = PersonManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
