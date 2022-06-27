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
            .buttonStyle(.borderedProminent)
            .padding(50)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(16)
            //.bold()
            //.clipShape(Capsule())
    }
}

/*
 .bold()
 .frame(width: 300, height: 50)
}.buttonStyle(.borderedProminent)
 */

struct VolunteerMenuView: View {
    //@StateObject var myEvents = ListEvents()

    @EnvironmentObject var myAccountFile: AccountInfoFile
    @State var listEvents = ListEvents()

    var body: some View {
        // TODO: Link Find Events, Create Event, and My Profile to their respective pages
        VStack {
            Text("Hello, \(myAccountFile.myAccount.username)")
            NavigationLink("Find Events") {
                EventSearchView()
            }
            .buttonStyle(GreenButton())

            NavigationLink("Create Event") {
                EventInfoCreateView(eventInfo: emptyEventInfo)
            }
            .buttonStyle(GreenButton())

            NavigationLink("My Events") {
                MyEventsView(myAccount: _myAccountFile)
            }
            .buttonStyle(.borderedProminent)
            
            NavigationLink("My Profile") {
                MyAccountView()
            }
            .buttonStyle(GreenButton())
        }
        .navigationBarTitle("Home", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .environmentObject(myAccountFile)
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
