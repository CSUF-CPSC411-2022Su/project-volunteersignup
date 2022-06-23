//
//  ListEvents.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//

import Foundation

struct ListEvents: Codable {
    
    var listEventsSigned: [EventInfo]
    var listEventsCreated: [EventInfo]
    
    init() {
        
        listEventsSigned = []
        listEventsCreated = []
        
    }
    
}

/*class ListEvents: p_ListEvents {
    var listEventsSigned: [EventInfo] = []
    var listEventsCreated: [EventInfo] = []
    
    // Replace this default constructor to what you need, but make sure this class contains a default constructor
    init() {
        
    }
    
    func EditList(_ list: [EventInfo]) throws -> p_ListEvents {
        return self
    }
    func DeleteEvent(at index: Int, in list: [EventInfo]) throws -> Bool {
        return true
    }
}*/
