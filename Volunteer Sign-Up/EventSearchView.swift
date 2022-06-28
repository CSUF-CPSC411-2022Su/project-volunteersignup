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
            TabView {
                ZipSearch()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                EventList(eventInfo: GLOBAL_EVENT_LIST)
                    .tabItem {
                        Image(systemName: "mappin.and.ellipse")
                        Text("View Events")
                    }
            }
            Spacer()
        }.padding()
    }
}

struct EventList: View {
    @StateObject var eventInfo: EventInfoList

    var body: some View {
        VStack {
            HStack {
                Text("View Events")
                    .bold()
                    .font(.largeTitle)
            }
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

struct ZipSearch: View {
    @SceneStorage("zipcode") var zipcode: String = ""
    @EnvironmentObject var eventInfo: EventInfoList

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Search by Zip Code")
                        .bold()
                        .font(.largeTitle)
                }
                .padding(.bottom, 30)
                HStack {
                    Text("Zipcode")
                        .bold()
                    Spacer()
                }
                .padding(.bottom, 5)
                HStack {
                    TextField("Zipcode", text: $zipcode)
                    Spacer()
                }
                .padding(.bottom, 20)
                Button(action: { ZIP_LIST_EVENTS.FindByZip(zipcode) }) {
                    Text("Search")
                }.modifier(SearchButtom()).onSubmit {
                    NavigationLink(destination: ZipListView()) {
                        Text("Search")
                    }
                }
            }
        }
    }
}

struct ZipListView: View {
    @SceneStorage("zipcode") var zipcode: String = ""
    @EnvironmentObject var eventInfo: EventInfoList

    var body: some View {
        Text("Hello")
    }
}

struct EventSearchView_Previews: PreviewProvider {
    static var previews: some View {
        EventSearchView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        EventList(eventInfo: GLOBAL_EVENT_LIST)
    }
}
