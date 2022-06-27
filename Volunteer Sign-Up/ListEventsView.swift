//
//  MyEventsView.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//
// Please fix code

import SwiftUI

struct MyEventsView: View {
    @StateObject var myEvents: ListEvents

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
        .environmentObject(myEvents)
        // .environmentObject(listDays)
    }
}

struct SignedEventsView: View {
    @EnvironmentObject var myEvents: ListEvents
    var body: some View {
        List {
            ForEach(myEvents.listEventsSigned) {
                day in
                Section(header: Text(day.dateString)) {
                    ForEach(day.events) {
                        event in
                        NavigationLink(destination: EventInfoView(eventInfo: event)) {
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
    @EnvironmentObject var myEvents: ListEvents

    var body: some View {
        // WIPView()
        List {
            ForEach(myEvents.listEventsCreated) {
                day in
                Section(header: Text(day.dateString)) {
                    ForEach(day.events) {
                        event in
                        NavigationLink(destination: EventInfoView(eventInfo: event)) {
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
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView(myEvents: ListEvents())
    }
}
