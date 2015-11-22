//
//  EventDetailViewController.swift
//  DinePro
//
//  Created by Jason Chen on 11/15/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import Foundation
import UIKit

class EventDetailViewController: UITableViewController {
    
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var mealText: UILabel!
    @IBOutlet weak var topicText: UILabel!
    @IBOutlet weak var tagText: UILabel!
    @IBOutlet weak var foodText: UILabel!
    
    
    var eventDetail: Event?
    let myPerson = PersonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealText.text = eventDetail?.meal
        topicText.text = eventDetail?.topic
        //[tagText.text] = event.tags
        foodText.text = eventDetail?.food
        
        //titleLabel.text = myPerson.peopleList[myPerson.peopleList.count-1].intro
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPerson.peopleList.count
    }*/

    
}
