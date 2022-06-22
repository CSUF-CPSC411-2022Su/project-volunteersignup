//
//  EventInfo2.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/13/22.
//

import Foundation

class EventInfo : p_Event{
    var eventName: String
    
    var location: String
    
    var dateTime: Date
    
    var eventNotes: String
    
    init() {
        
        self.eventName = ""
        self.location = ""
        self.dateTime = Date()
        self.eventNotes = ""
        
    }
    
    init(eventName n: String, at loc: String, timeAndDate dt: Date, notes: String){
        self.eventName = n
        self.location = loc
        self.dateTime = dt
        self.eventNotes = notes
    }
    
    func saveEventInfo() throws -> p_Event {
        return self
    }
    
    func editEventInfo() throws -> p_Event {
        return self
    }
    
    func deleteEventInfo() throws -> Bool {
        return false
    }
    
    
}
