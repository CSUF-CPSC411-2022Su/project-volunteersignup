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
class ZipListEvents : Codable {
    var zipList: [String: [EventInfo]]

    init() {
        self.zipList = [:]
    }

    // FindByZip(_ zip: Int) -> Any?  =========================================
    // Description  - Search function that returns array of events if zip is
    //                not nil
    // input        - Int; the key for the dictionary
    // output       - Array<EventInfo>; the list of events for that zipcode
    //              - nil; key was invalid
    func FindByZip(_ zip: String) -> Any? {
        if let keyExists = zipList[zip] {
            return keyExists
        } else {
            return nil
        }
    }

    
    func addEvent(_ event: EventInfo) {
        var added = false
        if zipList[event.zip] != nil {
            zipList[event.zip]!.append(event)
            print("Added event to existing key \(event.zip)")
            added = true
        }
        if !added {
            zipList[event.zip] = [event]
            print("Added event to new key \(event.zip)")
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

// add to global and zip lists
func saveToGlobalandZipList(_ event:EventInfo){
    ZIP_LIST_EVENTS.addEvent(event)
    //TODO: replace dummySearchlist with the GLOBAL_EVENT_LIST when created
    dummySearchList.eventList.append(event)
}
