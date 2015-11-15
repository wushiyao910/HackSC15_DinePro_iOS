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
    let photoKey = "photo"
    let genderKey = "gender"
    let introKey = "intro"
    let tagsKey = "tags"
    let companyKey = "company"
    let positionKey = "position"
    let educationKey = "education"
    let majorKey = "major"
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: nameKey)
        aCoder.encodeObject(photo, forKey: photoKey)
        aCoder.encodeObject(gender, forKey: genderKey)
        aCoder.encodeObject(intro, forKey: introKey)
        aCoder.encodeObject(tags, forKey: tagsKey)
        aCoder.encodeObject(company, forKey: companyKey)
        aCoder.encodeObject(position, forKey: positionKey)
        aCoder.encodeObject(education, forKey: educationKey)
        aCoder.encodeObject(major, forKey: majorKey)
    }
    
    required init?(coder aDecoder: NSCoder){
        name = aDecoder.decodeObjectForKey(nameKey) as! String
        photo = aDecoder.decodeObjectForKey(photoKey) as! UIImage
        gender = aDecoder.decodeObjectForKey(genderKey) as! String
        intro = aDecoder.decodeObjectForKey(introKey) as! String
        tags = aDecoder.decodeObjectForKey(tagsKey) as! [String]
        company = aDecoder.decodeObjectForKey(companyKey) as! String
        position = aDecoder.decodeObjectForKey(positionKey) as! String
        education = aDecoder.decodeObjectForKey(educationKey) as! String
        major = aDecoder.decodeObjectForKey(majorKey) as! String
    }

    
    init(name: String, photo: UIImage?, gender: String?, intro: String?, tags: [String]?, company: String?, position: String?, education: String?, major: String?) {
        self.name = name
        self.photo = photo
        self.gender = gender
        self.intro = intro
        self.tags = tags
        self.company = company
        self.position = position
        self.education = education
        self.major = major
    }
    
}
