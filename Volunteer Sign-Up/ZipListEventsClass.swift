//
//  ZipListEventsClass.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/23/22.
//

import Foundation

// global var
var ZIP_LIST_EVENTS = ZipListEvents()

// class used to store Events by Zip to assist with searching
class ZipListEvents/*:Codable*/ {
    var zipList: [Int: [EventInfo]]

    init() {
        self.zipList = [:]
    }
    
    // FindByZip(_ zip: Int) -> Any?  =========================================
    // Description  - Search function that returns array of events if zip is
    //                not nil
    // input        - Int; the key for the dictionary
    // output       - Array<EventInfo>; the list of events for that zipcode
    //              - nil; key was invalid
    func FindByZip(_ zip: Int) -> Any? {
        if let keyExists = zipList[zip] {
            return keyExists
        } else {
            return nil
        }
    }

    func Save() -> Bool {
        // TODO: implement encoder
        return false
    }

    func Load() -> Bool {
        // TODO: implement decoder
        return false
    }
}
