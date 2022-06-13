//
//  HomeView.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/13/22.
//

import SwiftUI

struct GreenButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(50)
            .background(.green)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct HomeView: View {
    
    var body: some View {
        // TODO: Remove NavigationView instance when merging with main to avoid multiple instances of NavigationView
        NavigationView{
        
        VStack {
            NavigationLink("Find Events"){
                WIPView()
            }
            .buttonStyle(GreenButton())
            
            NavigationLink("Create Event"){
                WIPView()
            }
            .buttonStyle(GreenButton())
            
            NavigationLink("My Events"){
                MyEventsView()
            }
            .buttonStyle(GreenButton())
            
            NavigationLink("My Profile"){
                WIPView()
            }
            .buttonStyle(GreenButton())
        }
        
        .navigationBarTitle("Home")
        .navigationBarBackButtonHidden(true)
        }
    }
    
}

struct WIPView: View {
    var body: some View {
        Text("This Page is Under Development")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
