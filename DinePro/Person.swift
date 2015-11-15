//
//  Person.swift
//  DinePro
//
//  Created by WuShiyao on 11/14/15.
//  Copyright © 2015 WuShiyao. All rights reserved.
//

import Foundation
import UIKit

class Person: NSObject {
    
    var name: String
    
    var photo: UIImage?
    var gender: String?
    var intro: String?
    var tags: [String]?
    var company: String?
    var position: String?
    var education: String?
    var major: String?
    
    let nameKey = "name"
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
    }
    
    required init?(coder aDecoder: NSCoder){
        name = aDecoder.decodeObjectForKey(nameKey) as! String
    }

    
    init(name: String) {
        self.name = name
    }
    
}
