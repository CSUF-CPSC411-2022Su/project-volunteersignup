//
//  LoginPageView.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/17/22.
//

import SwiftUI

struct LoginPageView: View {
    @EnvironmentObject var myAccountFile: AccountInfoFile
    @State var didLoadHistory: Bool = false
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Divider()
            
            // I debated whether or not to incorporate Form() either instead of or along with VStack, but this didn't work since the "Username" and "Password" text above the text entry fields would appear with a border
            
            Form {
                Section(header: Text("Username")) {
                    TextField("Username", text: $username, prompt: Text("Enter your username"))
                }
                
                Section(header: Text("Password")) {
                    SecureField("Password", text: $password, prompt: Text("Enter a password"))
                }
                
                // Note: There's an onSubmit() function that may be something to consider replacing this with if it doesn't integrate into the project accordingly
                /* NavigationLink(destination: VolunteerMenuView()) {
                    
                     //Text("Sign in")
                     Button("Sign in", action: {
                        
                         if !myAccountFile.loadHistory(username: myAccountFile.myAccount.username, password: myAccountFile.myAccount.password) {
                            
                             print("Error! Account info not saved!")
                            
                         }
                        
                     })
                    
                 }
                 .disabled(myAccountFile.myAccount.username == "" || myAccountFile.myAccount.password == "") */
                
                Button("Sign in", action: {
                    // Assign the values typed in by the user to the myAccount variable
                    myAccountFile.myAccount.username = username
                    myAccountFile.myAccount.password = password
                    
                    if myAccountFile.myAccount.username != "", myAccountFile.myAccount.password != "" {
                        if myAccountFile.loadHistory(username: myAccountFile.myAccount.username, password: myAccountFile.myAccount.password) {
                            didLoadHistory = true
                        }
                        else {
                            print("Error! The account with username: \(username) and password: \(password) does not exist!")
                        }
                    }
                    
                })
                
                if didLoadHistory {
                    NavigationLink(destination: VolunteerMenuView(), isActive: $didLoadHistory) {
                        EmptyView()
                    }
                    .disabled(!didLoadHistory)
                }
            }
        }
        .navigationBarTitle("Login", displayMode: .inline)
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var myAccount = AccountInfoFile()
    
    static var previews: some View {
        LoginPageView()
            .environmentObject(myAccount)
    }
}
