//
//  EventInfoFromCreatedListView.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/27/22.
//

import SwiftUI

struct EventInfoFromCreatedListView: View {
    @StateObject var eventSearch = FindEvent()
    @StateObject var eventInfo: EventInfo
    @EnvironmentObject var myAccount: AccountInfoFile

    var body: some View {
        VStack {
            // Event Name
            // Text(accountInfo.myEvents.listEventsSigned[0].eventName)
            Text(eventInfo.eventName).bold()
            // EventInfo
            List {
                // Coordinator
                Section(header: Text("Coordinator")) {
                    Text(eventInfo.owner)
                }

                // address
                Section(header: Text("Address")) {
                    // location
                    Text("\(eventInfo.location)")

                    // Image(eventInfo.mapImage)
                    Button(action: {
                        // TODO: insert action
                        let searchString = eventInfo.location
                        eventSearch.find(searchString)
                    }) {
                        Text("Load map")
                            .bold()
                    }
                    Image(uiImage: eventSearch.image)
                    // Rectangle()
                    // .frame(width: 300, height: 300)
                }

                // date and time
                Section(header: Text("date and time")) {
                    Text(eventInfo.dateTime
                        .formatted(date: .long, time: .shortened))
                }

                // Event Notes/Details
                Section(header: Text("Event Details")) {
                    Text(eventInfo.eventNotes)
                }
            } // end list
            NavigationLink(destination:
                            EventInfoFromCreatedListEditView(eventInfo: eventInfo)){
                Text("Edit")
                .bold()
                .frame(width: 300, height: 50)
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct EventInfoFromCreatedListEditView: View {
    @StateObject var eventInfo: EventInfo
    // @StateObject var accountInfo: AccountInfo

    var body: some View {
        VStack {
            // Text(accountInfo.myEvents.listEventsSigned[0].eventName)
            Text("Editing Event").bold()
            // EventInfo
            List {
                // Coordinator
                Section(header: Text("Event Name")) {
                    TextField("Event Name", text: $eventInfo.eventName)
                }

                // address
                Section(header: Text("Address")) {
                    TextField("123 Goofy Ln Dump Town, CA USA", text: $eventInfo.location)
                }

                // date and time
                Section(header: Text("date and time")) {
                    DatePicker("Enter Date and Time", selection: $eventInfo.dateTime, in: Date.now...).labelsHidden()
                }

                // Event Notes/Details
                Section(header: Text("Event Details")) {
                    TextField("Event Details", text: $eventInfo.eventNotes)
                }
            } // end list
            Button(action: {
                // TODO: insert action
            }) {
                Text("Save")
                    .bold()
                    .frame(width: 300, height: 50)
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct EventInfoFromCreatedListView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoFromCreatedListView(eventInfo: dummyEventInfo
            // , accountInfo: dummyAccountInfo
        )
    }
}

struct EventInfoFromCreatedListEditView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoFromCreatedListEditView(eventInfo: dummyEventInfo)
    }
}
