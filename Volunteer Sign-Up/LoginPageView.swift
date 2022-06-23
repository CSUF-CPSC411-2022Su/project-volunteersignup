//
//  LoginPageView.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/17/22.
//

import SwiftUI

struct LoginPageView: View {
    
    @StateObject var myAccount: AccountInfo = AccountInfo()
    
    var body: some View {
        
        VStack {
            
            Divider()
            
            // I debated whether or not to incorporate Form() either instead of or along with VStack, but this didn't work since the "Username" and "Password" text above the text entry fields would appear with a border
            
            Form {
                
                Section(header: Text("Username")) {
                    
                    TextField("Username", text: $myAccount.username, prompt: Text("Enter your username"))
                    
                }
                
                Section(header: Text("Password")) {
                    
                    SecureField("Password", text: $myAccount.password, prompt: Text("Enter a password"))
                    
                }
                
                // Note: There's an onSubmit() function that may be something to consider replacing this with if it doesn't integrate into the project accordingly
                NavigationLink(destination: VolunteerMenuView()) {
                    
                    Text("Sign in")
                    
                }
                
            }

        }
        .navigationBarTitle("Login", displayMode: .inline)
        
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
