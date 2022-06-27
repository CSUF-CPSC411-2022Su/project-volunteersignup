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

class EventInfoList: ObservableObject, Identifiable {
    @Published var eventList: [EventInfo] = []
    
    func event(_ event: EventInfo) {
        let newCopy = EventInfo(eventName: event.eventName, at: event.location, timeAndDate: event.dateTime, notes: event.eventNotes, user: event.owner, zip: event.zip)
        eventList.append(newCopy)
        
        eventList.append(EventInfo(eventName: "Food Drive", at: "Southlands Church Brea 2950 E Imperial Hwy, Brea, CA", timeAndDate: Date(), notes: "N/A", user: "Kate", zip: 92821))
    }
    
    init() {
    }
    
}


class EventPList: ObservableObject, Identifiable {
    @Published var events: [String] = []
    var maxsearches: Int = 5
    var fileURL: URL
    
    init() {
        // TODO: Create a path to a file named crosswalks.plist and store in fileURL
        fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileURL = fileURL.appendingPathComponent("events").appendingPathExtension("plist")
        
        // fileURL = URL(string: \(archiveURL))! // Delete this line and replace with your code
        
        loadHistory()
    }
    
    func addEventString(_ searchString: String) {
        if events.count == maxsearches {
            events.remove(at: maxsearches - 1)
        }
        events.insert(searchString, at: 0)
        saveHistory()
    }
    
    func saveHistory() {
        // TODO: Save the searchStrings array into a file
        let searchStringListEncoder = PropertyListEncoder()
        if let encodedSearchStrings = try? searchStringListEncoder.encode(events) {
            try? encodedSearchStrings.write(to: fileURL,
                                            options: .noFileProtection)
        }
    }
    
    func loadHistory() {
        // TODO: Load data from the file and store it in searchStrings
        let searchStringListDecoder = PropertyListDecoder()
        if let retrievedSearchString = try? Data(contentsOf: fileURL),
           let decodedSearchStrings = try?
           searchStringListDecoder.decode([String].self,
                                          from: retrievedSearchString)
        {
            events = decodedSearchStrings
        }
    }
}
