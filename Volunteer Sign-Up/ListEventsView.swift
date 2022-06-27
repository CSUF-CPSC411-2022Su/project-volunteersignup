//
//  MyEventsView.swift
//  Volunteer Sign-Up
//
//  Created by Nathan Mayne on 6/13/22.
//
// Please fix code

import SwiftUI

struct MyEventsView: View {
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
    }
}
struct SignedEventsView: View{
    var body: some View {
        List {
            Section(header: Text("June 30")){
                NavigationLink(destination: WIPView()) {
                    Text("Event 1")
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
        }
        .navigationBarTitle("My Events", displayMode: .inline)
    }
}
struct CreatedEventsView: View{
    var body: some View {
        List {
            Section(header: Text("February 10")){
                Text("Event 1")
            }
            Section(header: Text("August 9")){
                Text("Event 2")
            }
            Section(header: Text("December 24")){
                Text("Event 3")
            }
        }
        .navigationBarTitle("My Events", displayMode: .inline)
    }
}

struct MyEventsView_Previews: PreviewProvider {
    static var previews: some View {
        MyEventsView()
    }
}
