//
//  ClassProtocols.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/11/22.
//

import Foundation

protocol p_Event {
    var eventName: String {get set}
    var location: String {get set}
    var dateTime: Date {get set}
    var eventNotes: String {get set}
    
    func SaveEventInfo() throws -> p_Event
    func EditEventInfo() throws -> p_Event
    func DeleteEventInfo() throws -> Bool
}
