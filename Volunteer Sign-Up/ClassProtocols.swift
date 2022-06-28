//
//  EventSearch.swift
//  Volunteer Sign-Up
//
//  Created by Tianna Cano on 6/12/22.
//
//  ClassProtocols.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/11/22.
//

import Foundation

/*
protocol p_eventSearch {
    var searchLocation: String { get set }
    var searchRadius: Int { get }

    func findEvent() throws -> p_eventSearch
}
 */

protocol p_Event: Codable, Identifiable {
    var eventName: String { get set }
    var location: String { get set }
    var dateTime: Date { get set }
    var eventNotes: String { get set }
    var owner: String { get set }
    var zip: String { get set }

    func saveEventInfo() throws -> Bool
    func editEventInfo() throws -> Bool
    func deleteEventInfo() throws -> Bool
}

protocol p_ListEvents {
    var listEventsCreated: [EventInfo] { get set }
    var listEventsSigned: [EventInfo] { get set }

    func EditList(_ list: [EventInfo]) throws -> p_ListEvents
    func DeleteEvent(at index: Int, in list: [EventInfo]) throws -> Bool
}

protocol p_UserInfo {
    var name: String { get set }
    var address: String { get set }
    var email: String { get set }
    var phone: String { get set }
}

// Note: Additional protocols will be added here when my other group members fill this out
