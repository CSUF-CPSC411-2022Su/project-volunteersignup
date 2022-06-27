//
//  DummyDemoObjects.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/25/22.
//

/* / **** Description *****************************************************
 The purpose of this file is to help with testing by

 */ // *********************************************************************

import Foundation

/* / **** extensions ******************************************************
 This section of the file is to extend the classes that already exist.
 If a class is missing part of its implementation it can be extended
 here without the tampering of other team members files.
 */ // *********************************************************************
extension AccountInfo {
    convenience init(testFlag: Bool) {
        self.init(username: "psherman", password: "password")
        fakeInit()
    }

    func fakeInit() {
        let dummyEvent = EventInfo(eventName: "Free Teeth Cleaning", at: "42 Walabee Way Sydney, Australia", timeAndDate: Date.now, notes: "Need volunteers to help our Dental Hygenist students practice.", user: "P. Sherman", zip: 90015)
        let dummyList = [dummyEvent]
        myEvents.listEventsSigned = dummyList
        myEvents.listEventsCreated = dummyList
    }
}

extension EventInfoList {
    
    convenience init(testFlag: Bool){
        self.init()
        self.event(dummyEventInfo)
    }
    
}


/* / **** Objects **********************************************************/

// dummy event used to pass to preview for testing
var dummyEventInfo = EventInfo(eventName: "Free Teeth Cleaning", at: "42 Walabee Way Sydney, Australia", timeAndDate: Date.now, notes: "Need volunteers to help our Dental Hygenist students practice.", user: "P. Sherman", zip: 90015)
var emptyEventInfo = EventInfo()
// dummy account used to pass to preview for testing
var dummyAccountInfo = AccountInfo(testFlag: true)

var dummySearchList = EventInfoList(testFlag: true)
