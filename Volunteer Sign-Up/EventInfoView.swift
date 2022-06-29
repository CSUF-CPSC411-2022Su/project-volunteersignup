//
//  EventInfoView.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/13/22.
//

import SwiftUI

struct EventInfoView: View {
    @StateObject var eventSearch = FindEvent()
    @StateObject var eventInfo: EventInfo
    @EnvironmentObject var accountInfoFile: AccountInfoFile
    @Environment(\.presentationMode) var presentationMode

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
                    HStack {
                        Balloon().frame(width: 15, height: 20, alignment: .leading).foregroundColor(.blue)
                        Text("\(eventInfo.location)")
                    }

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
            Button(action: {
                // TODO: insert action
                accountInfoFile.myAccount.myEvents.AddSigned(event: eventInfo)
                guard accountInfoFile.updateHistory() else {
                    print("account info was not updated")
                    return
                }
                self.presentationMode.wrappedValue.dismiss()

            }) {
                Text("Sign Up")
                    .bold()
                    .frame(width: 300, height: 50)
            }.buttonStyle(.borderedProminent)
        }
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoView(eventInfo: dummyEventInfo
            // , accountInfo: dummyAccountInfo
        )
    }
}
