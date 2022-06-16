//
//  ListEvents.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//

import Foundation

class ListEvents: p_ListEvents {
    var listEventsSigned: [EventInfo] = []
    var listEventsCreated: [EventInfo] = []
    
    func EditList(_ list: [EventInfo]) throws -> p_ListEvents {
        return self
    }
    func DeleteEvent(at index: Int, in list: [EventInfo]) throws -> Bool {
        return true
    }
}
