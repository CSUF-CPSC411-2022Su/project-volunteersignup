//
//  Eventinfo.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/11/22.
//

import Foundation

class EventInfo : p_Event{
    var eventName: String
    
    var location: String
    
    var dateTime: Date
    
    var eventNotes: String
    
    init(eventName n: String, at loc: String, timeAndDate dt: Date, notes: String){
        self.eventName = n
        self.location = loc
        self.dateTime = dt
        self.eventNotes = notes
    }
    
    func SaveEventInfo() throws -> p_Event {
        return self
    }
    
    func EditEventInfo() throws -> p_Event {
        return self
    }
    
    func DeleteEventInfo() throws -> Bool {
        return false
    }
    
    
}
