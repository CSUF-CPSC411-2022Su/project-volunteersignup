//
//  HomeView.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//

import SwiftUI

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(50)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct VolunteerMenuView: View {
    @StateObject var myEvents = ListEvents()
    //@StateObject var listDays = ListDays()

    
    var body: some View {
        // TODO: Link Find Events, Create Event, and My Profile to their respective pages
        VStack {
            NavigationLink("Find Events"){
                EventSearchView()
            }
            .buttonStyle(GreenButton())
            
            NavigationLink("Create Event"){
                WIPView()
            }
            .buttonStyle(GreenButton())
            
            NavigationLink("My Events"){
                MyEventsView(myEvents: myEvents)
            }.onTapGesture(perform: { myEvents.sortList() })
            .buttonStyle(GreenButton())
            
            NavigationLink("My Profile"){
                WIPView()
            }
            .buttonStyle(GreenButton())
        }
        .navigationBarTitle("Home", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .environmentObject(myEvents)
        //.environmentObject(listDays)
    }

}

struct WIPView: View {
    var body: some View {
        Text("This Page is Under Development")
            .navigationBarTitle("WIP", displayMode: .inline)
    }
}

struct VolunteerMenuView_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerMenuView()
    }
}
