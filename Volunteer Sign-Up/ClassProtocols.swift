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
    
    func saveEventInfo() throws -> p_Event
    func editEventInfo() throws -> p_Event
    func deleteEventInfo() throws -> Bool
}

protocol p_UserInfo {
    var firstName: String {get set}
    var lastName: String {get set}
    var address: String {get set}
    var email: String {get set}
    var phoneNumer: String {get set}
}
