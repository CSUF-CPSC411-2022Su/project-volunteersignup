//
//  EventSearch.swift
//  Volunteer Sign-Up
//
//  Created by Tianna Cano on 6/13/22.
//

import Foundation

class findEvent : eventSearch{
    var searchLocation: String
    var searchRadius: Int
    
    init(searchLocation loc: String, searchRadius rad: Int){
        self.searchLocation = loc
        self.searchRadius = rad
    }
    
    func findEvent() throws -> eventSearch {
        return self
    }
}
