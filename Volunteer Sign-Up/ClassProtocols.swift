//
//  EventSearch.swift
//  Volunteer Sign-Up
//
//  Created by Tianna Cano on 6/12/22.
//

import Foundation

protocol eventSearch {
    var searchLocation: String {get set}
    var searchRadius: Int {get set}
    
    func findEvent() throws -> eventSearch
}
