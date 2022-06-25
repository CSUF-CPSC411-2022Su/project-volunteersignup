//
//  EventSearchUI.swift
//  Volunteer Sign-Up
//
//  Created by Tianna Cano on 6/12/22.
//

import SwiftUI

struct EventSearchView: View {
    @State var searchString: String = ""
    @StateObject var event = FindEvent()
    @State var searchLocationInput: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            /*TextField("Location", text: $searchString)
                .modifier(TextEntry())
            
            Button(action: {
                event.find(searchString)
            }) {
                Text("Find events")
            }
            .modifier(ButtonDesign())
            .padding(.bottom, 20)*/
            
            EventList()
            
            Spacer()
        }.padding()
    }
}

struct EventList: View {
    @State var searchString: String = ""
    @StateObject var event = FindEvent()
    @StateObject var eventInfo = EventInfoList()
    
    var body: some View {
        VStack {
            ForEach(eventInfo.eventList) {
                event in
                List {
                    Section(){
                        NavigationLink(destination: EventMap()) {
                            Text("Event: \(event.eventName)")
                        }
                    }
                }
            }
        }
    }
}

struct EventMap: View {
    @State var searchString: String = ""
    @StateObject var event = FindEvent()
    @StateObject var eventInfo = EventInfoList()
    
    var body: some View {
        VStack {
            ForEach(eventInfo.eventList) {
                events in
                //events.location = searchString
                HStack {
                    Balloon().fill(.pink)
                        .frame(width: 40, height: 50)
                    Text(event.searchLocation)
                        .font(.body)
                }
                Button(action: {
                    event.find(searchString)
                }) {
                    Text("Find events")
                }
                Image(uiImage: event.image)
            }
        }
    }
}

struct EventSearchView_Previews: PreviewProvider {
    static var previews: some View {
        EventSearchView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
