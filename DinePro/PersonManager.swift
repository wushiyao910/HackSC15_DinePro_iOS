//
//  PersonManager.swift
//  ProfileTest
//
//  Created by Jason Chen on 11/14/15.
//  Copyright © 2015 Jason Chen. All rights reserved.
//

import Foundation
import UIKit

class PersonManager {
    var peopleList = [Person]()
    
    func archivePath() ->String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
            return documentsPath + "/People"
        }
        assertionFailure("Could not determine where to save file.")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(peopleList, toFile: theArchivePath) {
                print("Save successfully")
                let index = peopleList.count
                let str = peopleList[index-1].name
                print("\(str)")
            }
            else {
                assertionFailure("Could not save data to \(theArchivePath)")
            }
        }
    }
    
    func unarchiveSavedItems() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                peopleList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Person]
            }
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
    
}