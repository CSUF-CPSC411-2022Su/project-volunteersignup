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
    
    /*
     switch (searchRadius) {
    case fiveMiles:
        let searchRadius = 5
    case tenMiles:
        let searchRedius = 10
    case fifteenMiles:
        let searchRadius = 15
    default:
        let searchRadius = 20
    }
     */
    
    init(searchLocation loc: String, searchRadius rad: Int){
        self.searchLocation = loc
        self.searchRadius = rad
    }
    
    func findEvent() throws -> eventSearch {
        return self
    }
}
