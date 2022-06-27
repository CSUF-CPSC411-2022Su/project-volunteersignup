//
//  EventSearchUI.swift
//  Volunteer Sign-Up
//
//  Created by Tianna Cano on 6/12/22.
//

import SwiftUI

struct EventSearchView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Find Events").bold()
            /* TextField("Location", text: $searchString)
                 .modifier(TextEntry())
            
             Button(action: {
                 event.find(searchString)
             }) {
                 Text("Find events")
             }
             .modifier(ButtonDesign())
             .padding(.bottom, 20) */
            
            EventList(eventInfo: dummySearchList)
            Spacer()
            /*
             List {
                 Section(){
                     NavigationLink(destination: EventMap()) {
                         //Text("Event 1")
                     }
                 }
                 Section(){
                     NavigationLink(destination: EventMap()) {
                         Text("Event 2")
                     }
                 }
             } */
        }.padding()
    }
}

struct EventList: View {
    @StateObject var eventInfo: EventInfoList
    
    var body: some View {
        VStack {
            List {
                ForEach(eventInfo.eventList) {
                    event in
                    Section {
                        NavigationLink(destination: EventInfoView(eventInfo: event)) {
                            Text("Event: \(event.eventName)")
                        }
                    }
                }
            }
        }
    }
}

/* changed to EventInfoView
 struct EventMap: View {
     //@State var searchString: String = ""
     @StateObject var eventSearch = FindEvent()
     @StateObject var eventInfo = EventInfoList(testFlag: true)
    
     var body: some View {
         VStack {
             HStack {
                 Balloon().fill(.pink)
                     .frame(width: 40, height: 50)
                
                 Text("Hello")
             }
             ForEach(eventInfo.eventList) {
                 event in
                 let searchString = event.location
                 HStack {
                     Balloon().fill(.pink)
                         .frame(width: 40, height: 50)
                     Text(eventSearch.searchLocation)
                         .font(.body)
                 }
                 Button(action: {
                     eventSearch.find(searchString)
                 }) {
                     Text("View Location")
                 }
                 Image(uiImage: eventSearch.image)
                 NavigationLink(destination: EventInfoView(eventInfo: dummyEventInfo)) {
                     Text("Sign up to volunteer")
                 }
             }
         }
     }
 }
 */
struct EventSearchView_Previews: PreviewProvider {
    static var previews: some View {
        EventSearchView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList(eventInfo: dummySearchList)
    }
}

/*
 struct EventMap_Previews: PreviewProvider {
     static var previews: some View {
         EventMap()
            
     }
 }
 */
