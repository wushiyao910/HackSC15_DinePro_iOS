//
//  EventManager.swift
//  ProfileTest
//
//  Created by Jason Chen on 11/14/15.
//  Copyright © 2015 Jason Chen. All rights reserved.
//

import Foundation
import UIKit

class EventManager {
    var eventsList = [Event]()
    
    func archivePath() ->String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
            return documentsPath + "/Events"
        }
        assertionFailure("Could not determine where to save file.")
        return nil
    }
    
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(eventsList, toFile: theArchivePath) {
                print("Save successfully")
                /*let index = eventsList.count
                let str = eventsList[index-1].topic
                print("\(str)")*/
            }
            else {
                assertionFailure("Could not save data to \(theArchivePath)")
            }
        }
    }
    
    func unarchiveSavedItems() {
        if let theArchivePath = archivePath() {
            if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                eventsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as! [Event]
            }
        }
    }
    
    init() {
        unarchiveSavedItems()
    }
    
}