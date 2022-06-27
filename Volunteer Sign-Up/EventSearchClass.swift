//
//  EventSearch.swift
//  Volunteer Sign-Up
//
//  Created by Tianna Cano on 6/13/22.
//

import Foundation
import SwiftUI

class MapsAPIResult: Codable {
    var type: String
    var query: [String]
    var features: [Event]
    var attribution: String
}

class Event: Codable {
    var text: String
    var place_name: String
    var center: [Double]
}

class FindEvent: ObservableObject {
    // var loggedIn: Bool // TC: Bool to check when or if a user is logged in?
    @Published var searchLocation: String = ""
    @Published var image = UIImage()
    
    private var accessToken = "pk.eyJ1IjoidGlhbm5hLWMiLCJhIjoiY2w0cDZ4NDI5MDR4dDNibWZuZWZ1OXFkeiJ9.-uuUKT483Ii6l8s24sS5Mg"
    
    func find(_ searchString: String) {
        guard searchString != "" else {
            return
        }
        
        let mapboxSearchURL = "https://api.mapbox.com/geocoding/v5/mapbox.places/\(searchString).json?access_token=\(accessToken)"
    
        if let urlString = mapboxSearchURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
           let url = URL(string: urlString)
        {
            // Creates a task that retrieves the contents of the specified URL, then calls a handler upon completion.
            let task = URLSession.shared.dataTask(with: url) {
                data, _, _ in
                
                // Run the code asynchronously so the UI can be updated while we wait for a reply from the server and decode the JSON.
                DispatchQueue.main.async {
                    let jsonDecoder = JSONDecoder()
                    // Decode the JSON and store in result
                    if let validData = data, let result = try? jsonDecoder.decode(MapsAPIResult.self, from: validData) {
                        if result.features.count > 0 {
                            self.searchLocation = result.features[0].place_name
                            
                            let long = result.features[0].center[0]
                            
                            let lat = result.features[0].center[1]
                            
                            self.loadMapImage(long: long, lat: lat)
                        } else {
                            self.searchLocation = "No results found"
                        }
                    } else {
                        self.searchLocation = "No results found"
                    }
                }
            }
            // Runs the task (open the URL)
            task.resume()
        }
    }
    
    func loadMapImage(long: Double, lat: Double) {
        let zoom = 15
        let rotation = 0
        let mapboxImageURL = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/\(long),\(lat),\(zoom),\(rotation)/300x200?access_token=\(accessToken)"
        
        if let url = URL(string: mapboxImageURL) {
            let task = URLSession.shared.dataTask(with: url) {
                data, _, _ in
                
                DispatchQueue.main.async {
                    if let validData = data, let result = UIImage(data: validData) {
                        self.image = result
                    } else {
                        self.searchLocation = "No results found"
                    }
                }
            }
            task.resume()
        }
    }
}
