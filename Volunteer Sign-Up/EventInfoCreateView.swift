//
//  EventInfoCreateView.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/26/22.
//

import SwiftUI

struct EventInfoCreateView: View {
    //var eventInfo: EventInfo
    @EnvironmentObject var accountInfoFile: AccountInfoFile
    @State var eventName: String = ""
    @State var location: String = ""
        @State var city: String = ""
        @State var state: String = ""
        @State var zip: String = ""
    @State var dateTime: Date =  Date.now
    @State var eventNotes: String = ""

    var body: some View {
        VStack {
            // Text(accountInfo.myEvents.listEventsSigned[0].eventName)
            Text("Create New Event").bold()
            // EventInfo
            List {
                // Coordinator
                Section(header: Text("Event Name")) {
                    TextField("Event Name", text: $eventName)
                }

                // address
                Section(header: Text("Address")) {
                    TextField("Street Addr.", text: $location)
                    TextField("City", text: $city)
                    TextField("State", text: $state)
                    TextField("Zip", text: $zip)
                }

                // date and time
                Section(header: Text("date and time")) {
                    DatePicker("Enter Date and Time", selection: $dateTime, in: Date.now...).labelsHidden()
                }

                // Event Notes/Details
                Section(header: Text("Event Details")) {
                    TextField("Event Details", text: $eventNotes)
                }
            } // end list
            Button(action: {
                // create EventInfo Object
                let tempZip = zip
                let tempLoc = location + " " + city + " " + state + " " + zip
                let eventInfo: EventInfo = .init(eventName: eventName, at: tempLoc, timeAndDate: dateTime, notes: eventNotes, user: accountInfoFile.myAccount.username, zip: tempZip)
                
                //write to listEventsCreated, gloabl and zip list
                accountInfoFile.myAccount.myEvents.AddCreated(event: eventInfo)
                saveToGlobalandZipList(eventInfo)
                
                //call func to update .plist files
                
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
        EventInfoCreateView(/*eventInfo: emptyEventInfo*/)
    }
}
