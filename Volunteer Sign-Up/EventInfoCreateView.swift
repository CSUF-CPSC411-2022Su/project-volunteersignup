//
//  EventInfoCreateView.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/26/22.
//

import SwiftUI

struct EventInfoCreateView: View {
    @StateObject var eventInfo: EventInfo
    // @StateObject var accountInfo: AccountInfo

    var body: some View {
        VStack {
            // Text(accountInfo.myEvents.listEventsSigned[0].eventName)
            Text("Create New Event").bold()
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
                Text("Create Event")
                    .bold()
                    .frame(width: 300, height: 50)
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct EventInfoCreateView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoCreateView(eventInfo: emptyEventInfo)
    }
}
