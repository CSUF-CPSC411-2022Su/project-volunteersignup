//
//  MyEventsView.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//
 
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
                }.environmentObject(myAccount)
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
                    }.onDelete {
                        offset in
                        day.events.remove(atOffsets: offset)
                        if day.events.count == 0 {
                            // Removes day from list if the day no longer holds any events
                            myAccount.myAccount.myEvents.listEventsSigned = myAccount.myAccount.myEvents.listEventsSigned.filter { $0.date != day.date }
                        }
                        myAccount.objectWillChange.send()
                    }
                }
            }
        }
        .navigationBarTitle("My Events", displayMode: .inline)
    }
}
 
struct CreatedEventsView: View {
    @EnvironmentObject var myAccount: AccountInfoFile
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
                        .environmentObject(self.myAccount)
                    }.onDelete {
                        offset in
                        // Converts offset values into integers, so the events can be accessed for comparing events to global events
                        let indexes = offset.map { $0 }
                        for index in indexes {
                            // Removes created event from global list on deletion
                            // TODO: This will delete any values of the same name. So events of the same name are a nono
                            ZIP_LIST_EVENTS.zipList[day.events[index].zip] = ZIP_LIST_EVENTS.zipList[day.events[index].zip]!.filter { $0.eventName != day.events[index].eventName }
                            myAccount.myAccount.myEvents.DeleteSigned(event: day.events[index])
                            GLOBAL_EVENT_LIST.eventList = GLOBAL_EVENT_LIST.eventList.filter { $0.eventName != day.events[index].eventName }
                            GLOBAL_EVENT_LIST.saveHistory()
                            ZIP_LIST_EVENTS.saveHistory()
                        }
                        day.events.remove(atOffsets: offset)
                        
                        if day.events.count == 0 {
                            // Removes day from list if the day no longer holds any events
                            myAccount.myAccount.myEvents.listEventsCreated = myAccount.myAccount.myEvents.listEventsCreated.filter { $0.date != day.date }
                        }
                        myAccount.objectWillChange.send()
                        GLOBAL_EVENT_LIST.objectWillChange.send()
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
