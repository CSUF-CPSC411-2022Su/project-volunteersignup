//
//  ListEvents.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//

import Foundation

class ListEvents: p_ListEvents, ObservableObject {
    @Published var listEventsSigned: [EventInfo] = []
    @Published var listEventsCreated: [EventInfo] = []
    
    // Replace this default constructor to what you need, but make sure this class contains a default constructor
    init() {
        listEventsSigned = [EventInfo(eventName: "Milk Day", at: "Epic Dr.", timeAndDate: Date(), notes: "Bring sandiwches"), EventInfo(eventName: "Milk Maid", at: "Pog Ch.", timeAndDate: Date(), notes: "Lol Nerd")]
        listEventsCreated = [EventInfo(eventName: "Ray William Johnson Meet and Greet", at: "Doinyur, Mom CA.", timeAndDate: Date(), notes: "Meet Ray, the creator of the hit youtube song \"Doin Your Mom\"!!!")]
    }
    
    func EditList(_ list: [EventInfo]) throws -> p_ListEvents {
        return self
    }
    func DeleteEvent(at index: Int, in list: [EventInfo]) throws -> Bool {
        return true
    }
}
