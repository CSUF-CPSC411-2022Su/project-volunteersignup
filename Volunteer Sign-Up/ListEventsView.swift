//
//  MyEventsView.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//

import SwiftUI

struct MyEventsView: View {
    @StateObject var myEvents: ListEvents
    //@StateObject var listDays: ListDays
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
        //.environmentObject(listDays)
    }
}

struct SignedEventsView: View {
    @EnvironmentObject var myEvents: ListEvents
    //@EnvironmentObject var listDays: ListDays
    

    //sortList()
    //convertDays(list: myEvents.listEventsSigned)
        var body: some View {
        List {

            ForEach(myEvents.listEventsSigned) {
                day in
                Section(header: Text(day.dateString)) {
                    ForEach(day.events) {
                        event in
                        NavigationLink(destination: WIPView()) {
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
            /*var prev = Date()
            ForEach(myEvents.listEventsSigned.indices, id: \.self) {
                index in
                //var date = myEvents.listEventsSigned[index].dateTime
                if myEvents.listEventsSigned[index].dateTime != prev {
                    Section(header: Text(myEvents.listEventsSigned[index].dateTime.formatted(date: .abbreviated, time: .omitted))) {
                        NavigationLink(destination: WIPView()) {
                            VStack(alignment: .leading) {
                                Text(myEvents.listEventsSigned[index].eventName)
                                    .font(.headline)
                                Text(myEvents.listEventsSigned[index].eventNotes)
                                    .font(.caption)
                            }
                        }
                    }
                }
            }*/
            /*
            Section(header: Text("June 30")){
                NavigationLink(destination: WIPView()) {
                    Text(myEvents.listEventsSigned[0].eventName)
                }
            }
            Section(header: Text("July 4")){
                NavigationLink(destination: WIPView()) {
                    Text("Event 2")
                }
            }
            Section(header: Text("July 8")){
                NavigationLink(destination: WIPView()) {
                    Text("Event 3")
                }
            }
             */
        }
        .navigationBarTitle("My Events", displayMode: .inline)
    }
}
struct CreatedEventsView: View{
    @EnvironmentObject var myEvents: ListEvents
    
    var body: some View {
        //WIPView()
        List {
            ForEach(myEvents.listEventsCreated) {
                day in
                Section(header: Text(day.dateString)) {
                    ForEach(day.events) {
                        event in
                        NavigationLink(destination: WIPView()) {
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
         /*List {
            ForEach(myEvents.listEventsCreated.indices, id: \.self) {
                index in
                Section(header: Text(myEvents.listEventsCreated[index].dateTime.formatted(date: .abbreviated, time: .omitted))) {
                    NavigationLink(destination: WIPView()) {
                        VStack(alignment: .leading) {
                            Text(myEvents.listEventsCreated[index].eventName)
                                .font(.headline)
                            Text(myEvents.listEventsCreated[index].eventNotes)
                                .font(.caption)
                        }
                    }
                }
            }
            /*
            Section(header: Text("February 10")){
                NavigationLink(destination: WIPView()) {
                    Text(myEvents.listEventsCreated[0].eventName)
                }
            }
            Section(header: Text("August 9")){
                NavigationLink(destination: WIPView()) {
                    Text("Event 2")
                }
            }
            Section(header: Text("December 24")){
                NavigationLink(destination: WIPView()) {
                    Text("Event 3")
                }
            }
             */
        }*/
        //.navigationBarTitle("My Events", displayMode: .inline)
    }
}

/*
struct MyEventsView_Previews: PreviewProvider {
    some View {
        MyEventsView()
    }
}
*/
