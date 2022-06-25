//
//  EventInfo2.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/13/22.
//

import Foundation

class EventInfo: p_Event, Codable, Identifiable {
    var eventName: String
    var location: String
    var dateTime: Date
    var eventNotes: String
    var owner: String
    var zip: Int
    
    init() {
        self.eventName = ""
        self.location = ""
        self.dateTime = Date()
        self.eventNotes = ""
        self.owner = ""
        self.zip = -1
    }
    
    init(eventName n: String, at loc: String, timeAndDate dt: Date, notes: String, user: String, zip: Int) {
        self.eventName = n
        self.location = loc
        self.dateTime = dt
        self.eventNotes = notes
        self.owner = user
        self.zip = zip
    }
    
    func saveEventInfo() throws -> Bool {
        return true
    }
    
    func editEventInfo() throws -> Bool {
        return true
    }
    
    func deleteEventInfo() throws -> Bool {
        return false
    }
}

class EventInfoList: ObservableObject, Identifiable {
    @Published var eventList: [EventInfo] = []
    
    func event(_ event: EventInfo) {
        let newCopy = EventInfo(eventName: event.eventName, at: event.location, timeAndDate: event.dateTime, notes: event.eventNotes, user: event.owner, zip: event.zip)
        eventList.append(newCopy)
        
        //eventList.append(EventInfo(eventName: "Food Drive", at: "Southlands Church Brea 2950 E Imperial Hwy, Brea, CA", timeAndDate: "2016/10/08 22:31", notes: "N/A", user: "Kate", zip: 92821))
    }
    
    init() {
    }
    
}
