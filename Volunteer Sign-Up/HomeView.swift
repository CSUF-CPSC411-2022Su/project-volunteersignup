//
//  HomeView.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/13/22.
//

import SwiftUI

// TODO: Link Sign In and Create Account to their respective pages

struct HomeView: View {
    var body: some View {
        // NavigationView{
        VStack {
            NavigationLink("Sign In") {
                LoginPageView()
            }
            .buttonStyle(GreenButton())

            NavigationLink("Create Account") {
                CreateAccountView()
            }
            .buttonStyle(GreenButton())
        }
        .navigationBarTitle("Welcome")
        .navigationBarBackButtonHidden(true)
        // }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
