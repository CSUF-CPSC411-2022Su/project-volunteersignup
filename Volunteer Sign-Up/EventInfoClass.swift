//
//  EventInfo2.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/13/22.
//

import Foundation

class EventInfo: p_Event, /*Codable,*/ Identifiable, ObservableObject {
    @Published var eventName: String
    @Published var location: String
    @Published var dateTime: Date
    @Published var eventNotes: String
    @Published var owner: String
    @Published var zip: Int
    
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
