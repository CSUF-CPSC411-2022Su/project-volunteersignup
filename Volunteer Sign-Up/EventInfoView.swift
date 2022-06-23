//
//  EventInfoView.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/13/22.
//

import SwiftUI

struct EventInfoView: View {
    var EventName: String = "<Fake Event Name>"
    var dateTime: String = "1234"
    var location: String = "P. Sherman 42 Walabee Way Sydney"
    var body: some View {
        VStack {
            // Back and Event Name
            Text("\(EventName)")
            HStack { // 2 column
                VStack {
                    Text("Date :")
                    Text("Time :")
                    Text("Location :")
                }
                VStack {
                    Text(dateTime)
                    Text(dateTime)
                    Text("\(location)")
                }
            }
        }
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EventInfoView()
    }
}
