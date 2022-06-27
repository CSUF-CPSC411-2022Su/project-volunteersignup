//
//  MyEventsView.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//
// Please fix code

import SwiftUI

struct MyEventsView: View {
    @EnvironmentObject var myAccount: AccountInfoFile
    var body: some View {
        TabView {
            SignedEventsView()
                .tabItem {
                    Label("Signed Events", systemImage: "book")
                }
            CreatedEventsView()
                .tabItem {
                    Label("Created Events", systemImage: "person")
                }
        }
        .environmentObject(myAccount)
    }
}

struct SignedEventsView: View {
    @EnvironmentObject var myAccount: AccountInfoFile
    var body: some View {
        List {
            ForEach(myAccount.myAccount.myEvents.listEventsSigned) {
                day in
                Section(header: Text(day.dateString)) {
                    ForEach(day.events) {
                        event in
                        NavigationLink(destination: EventInfoFromSignedListView(eventInfo: event)) {
                            VStack(alignment: .leading) {
                                Text(event.eventName)
                                    .font(.headline)
                                Text(event.eventNotes)
                                    .font(.caption)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("My Events", displayMode: .inline)
    }
}

struct CreatedEventsView: View {
    @EnvironmentObject var myAccount: AccountInfoFile
    //@StateObject var myEvent = EventInfo()
    var body: some View {
        List {
            ForEach(myAccount.myAccount.myEvents.listEventsCreated) {
                day in
                Section(header: Text(day.dateString)) {
                    ForEach(day.events) {
                        event in
                        NavigationLink(destination: EventInfoFromCreatedListView(eventInfo: event)) {
                            VStack(alignment: .leading) {
                                Text(event.eventName)
                                    .font(.headline)
                                Text(event.eventNotes)
                                    .font(.caption)
                            }
                        }
                        .environmentObject(myAccount)
                    }
                }
            }
        }
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
}
