//
//  ContentView.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/8/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var myAccount: AccountInfoFile = .init()
    
    var body: some View {
        NavigationView {
            HomeView()
        }
        .environmentObject(myAccount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            // CreateAccount()
            // CreateAccountCopy()
        }
    }
}
