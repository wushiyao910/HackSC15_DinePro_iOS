//
//  Event.swift
//  DinePro
//
//  Created by WuShiyao on 11/14/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import Foundation
import CoreLocation

class Event: NSObject, NSCoding {
    
    var topic: String
    var date: NSDate
    var meal: String
    var isTop: Bool
    var food: String
    
    var tags: [String]?
    var location: CLLocation?
    var people: [Person]?
    
    let topicKey = "topic"
    let dateKey = "date"
    let mealKey = "meal"
    let foodKey = "food"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(topic, forKey: topicKey)
        aCoder.encodeObject(date, forKey: dateKey)
        aCoder.encodeObject(meal, forKey: mealKey)
        aCoder.encodeObject(food, forKey: foodKey)
    }
    
    required init?(coder aDecoder: NSCoder){
        topic = aDecoder.decodeObjectForKey(topicKey) as! String
        date = aDecoder.decodeObjectForKey(dateKey) as! NSDate
        meal = aDecoder.decodeObjectForKey(mealKey) as! String
        food = aDecoder.decodeObjectForKey(foodKey) as! String
        self.isTop = false
    }
    
    init(topic: String, date: NSDate, meal: String, food: String) {
        self.topic = topic
        self.date = date
        self.meal = meal
        self.food = food
        self.isTop = false
    }
    
}
