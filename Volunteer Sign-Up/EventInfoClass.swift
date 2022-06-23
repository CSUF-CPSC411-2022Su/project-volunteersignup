//
//  EventInfo2.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/13/22.
//

import Foundation

struct EventInfo: Codable {
    
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
    
}

/*class EventInfo : p_Event{
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
    
    func SaveEventInfo() throws -> p_Event {
        return self
    }
    
    func EditEventInfo() throws -> p_Event {
        return self
    }
    
    func DeleteEventInfo() throws -> Bool {
        return false
    }
    
    
}*/
