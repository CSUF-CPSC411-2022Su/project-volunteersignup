//
//  EventSearchUI.swift
//  Volunteer Sign-Up
//
//  Created by Tianna Cano on 6/12/22.
//

import MapKit
import SwiftUI

struct EventSearchView: View {
    @StateObject var event = FindEvent(searchLocation: "", searchRadius: 0)
    @State var searchLocationInput: String
    @State var searchRadiusInput: String
    // @StateObject var searchResults = SearchResults()
    
    //@EnvironmentObject var EventResults: SearchResults
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Search for Events")
                    .font(.headline)
                VStack {
                    HStack {
                        Text("Location:").padding(.leading)
                        TextField("Location", text: $searchLocationInput)
                        Spacer()
                    }
                    HStack {
                        Text("Radius:").padding(.leading)
                        TextField("Radius", text: $searchRadiusInput)
                        Spacer()
                    }
                    NavigationLink(destination: FindEvents()) {
                        Text("Search!")
                            .bold().padding(10).background(.green).cornerRadius(10).foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct FindEvents: View {
    /*
     @StateObject var event = FindEvent(searchLocation: "", searchRadius: 0)
    @State var searchLocationInput: String
    @State var searchRadiusInput: Int
    */
    @StateObject var searchResults = SearchResults()
    
    var body: some View {
        VStack {
            Text("Results: ")
            Text(searchResults.locationList)
        }
    }
}

struct EventSearchView_Previews: PreviewProvider {
    static var previews: some View {
        EventSearchView(searchLocationInput: "", searchRadiusInput: "")
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

