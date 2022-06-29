//
//  EventInfo2.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/13/22.
//

import Foundation

var GLOBAL_EVENT_LIST = EventInfoList()

class EventInfo: p_Event, Codable, Identifiable, ObservableObject {
    enum CodingKeys: CodingKey {
        case eventName, location, dateTime, eventNotes, owner, zip, id
    }

    @Published var eventName: String
    @Published var location: String
    @Published var dateTime: Date
    @Published var eventNotes: String
    @Published var owner: String
    @Published var zip: String
    var id = UUID()

    init() {
        self.eventName = ""
        self.location = ""
        self.dateTime = Date()
        self.eventNotes = ""
        self.owner = ""
        self.zip = ""
    }

    init(eventName n: String, at loc: String, timeAndDate dt: Date, notes: String, user: String, zip: String) {
        self.eventName = n
        self.location = loc
        self.dateTime = dt
        self.eventNotes = notes
        self.owner = user
        self.zip = zip
    }

    init(eventName n: String, at loc: String, timeAndDate dt: Date, notes: String, user: String, zip: Int) {
        self.eventName = n
        self.location = loc
        self.dateTime = dt
        self.eventNotes = notes
        self.owner = user
        self.zip = String(zip)
    }

    // conform to codable
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.eventName = try container.decode(String.self, forKey: .eventName)
        self.location = try container.decode(String.self, forKey: .location)
        self.dateTime = try container.decode(Date.self, forKey: .dateTime)
        self.eventNotes = try container.decode(String.self, forKey: .eventNotes)
        self.owner = try container.decode(String.self, forKey: .owner)
        self.zip = try container.decode(String.self, forKey: .zip)
        self.id = try container.decode(UUID.self, forKey: .id)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(eventName, forKey: .eventName)
        try container.encode(location, forKey: .location)
        try container.encode(dateTime, forKey: .dateTime)
        try container.encode(eventNotes, forKey: .eventNotes)
        try container.encode(owner, forKey: .owner)
        try container.encode(zip, forKey: .zip)
        try container.encode(id, forKey: .id)
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
    var fileURL: URL

    func event(_ event: EventInfo) {
        // let newCopy = EventInfo(eventName: event.eventName, at: event.location, timeAndDate: event.dateTime, notes: event.eventNotes, user: event.owner, zip: event.zip)
        eventList.append(event)

        // eventList.append(EventInfo(eventName: "Food Drive", at: "Southlands Church Brea 2950 E Imperial Hwy, Brea, CA", timeAndDate: Date(), notes: "N/A", user: "Kate", zip: 92821))

        saveHistory()
    }

    init() {
        self.fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.fileURL = fileURL.appendingPathComponent("events").appendingPathExtension("plist")

        loadHistory()
    }

    func saveHistory() {
        let eventListEncoder = PropertyListEncoder()
        if let encodedEventList = try? eventListEncoder.encode(eventList) {
            try? encodedEventList.write(to: fileURL,
                                        options: .noFileProtection)
        }
    }

    func loadHistory() {
        let eventListDecoder = PropertyListDecoder()
        if let retrievedEventList = try? Data(contentsOf: fileURL),
           let decodedEventList = try?
           eventListDecoder.decode([EventInfo].self,
                                   from: retrievedEventList)
        {
            eventList = decodedEventList
        }
    }
}
