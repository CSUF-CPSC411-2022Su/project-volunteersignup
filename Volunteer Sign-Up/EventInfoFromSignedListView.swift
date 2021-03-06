//
//  EventInfoFromSignedListView.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/27/22.
//

import SwiftUI

struct EventInfoFromSignedListView: View {
    @StateObject var eventSearch = FindEvent()
    @StateObject var eventInfo: EventInfo
    // @StateObject var accountInfo: AccountInfo

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
            /*
             Button(action: {
                 // TODO: insert action
             }) {
                 Text("Sign Up")
                     .bold()
                     .frame(width: 300, height: 50)
             }.buttonStyle(.borderedProminent)
             */
        }
    }
}

struct EventInfoFromSignedListView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoFromSignedListView(eventInfo: dummyEventInfo
            // , accountInfo: dummyAccountInfo
        )
    }
}
