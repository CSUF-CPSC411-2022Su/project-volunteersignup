//
//  EventSearch.swift
//  Volunteer Sign-Up
//
//  Created by Tianna Cano on 6/13/22.
//

import Foundation

/*
 class findEvent : p_eventSearch {
    @Published var searchLocation: String
    @Published var searchRadius: Int
    
    var choiceOfSearchRadius: Int {
        switch searchRadius {
            case 5: return 5
            case 10: return 10
            case 15: return 15
            default: return 20
        }
    }
    
    init(searchLocation loc: String, searchRadius rad: Int){
        self.searchLocation = loc
        self.searchRadius = rad
    }
    
    func findEvent() throws -> p_eventSearch {
        return self
    }
}
*/


// TC: Just fiddling with stuff for check-in 3
class FindEvent : ObservableObject {
    //var loggedIn: Bool // TC: Bool to check when or if a user is logged in?
    @Published var searchLocation: String
    @Published var searchRadius: Int
    
    var choiceOfSearchRadius: Int {
        switch searchRadius {
            case 5: return 5
            case 10: return 10
            case 15: return 15
            default: return 20
        }
    }
    
    init(searchLocation: String, searchRadius: Int) {
        self.searchLocation = searchLocation
        self.searchRadius = searchRadius
    }
}

// TC: Need to figure out how the search results would grab the data
 class SearchResults : ObservableObject {
    @Published var results: [FindEvent] = []
    
     var locationList: String {
         var list: String = ""
         if !results.isEmpty {
             for result in results {
                 list += result.searchLocation + " "
             }
         } else {
             list = "No results"
         }
         return list
     }
    
     init() {
    }
}
