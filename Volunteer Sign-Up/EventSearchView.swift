//
//  EventSearchUI.swift
//  Volunteer Sign-Up
//
//  Created by Tianna Cano on 6/12/22.
//

import MapKit
import SwiftUI

struct EventSearchView: View {
    //@State var findEvent: EventSearch
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Find an Event").font(.title.weight(.bold))
                Text("Start searching for events in your area to volunteer for!").multilineTextAlignment(.center)
            }.padding().frame(maxWidth: .infinity, maxHeight: .infinity).foregroundColor(.gray).navigationTitle("Search")
        }.searchable(text: $searchText)
    }
}

struct EventSearchView_Previews: PreviewProvider {
    static var previews: some View {
        EventSearchView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
