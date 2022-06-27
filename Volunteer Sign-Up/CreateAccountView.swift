//
//  CreateAccountIView.swift
//  Volunteer Sign-Up
//
//  Created by Steven on 6/11/22.
//

import SwiftUI

// This is the latest working version of CreateAccount!
// TODO: Figure out if "Create Account" can be created slightly bigger
// TODO: Setup the capability to go back to HomePage (This may not be something I have to do, but rather something Nathan has to do when he creates the HomePage)
// TODO: (The hard part) Find a way to store the Form information in a database
// TODO: Tie this page to Nathan's page (VolunteerMenu) when he finishes it
struct CreateAccountView: View {
    @EnvironmentObject var myAccountFile: AccountInfoFile
    @State var didSaveHistory: Bool = false
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Divider()
            
            // I debated whether or not to incorporate Form() either instead of or along with VStack, but this didn't work since the "Username" and "Password" text above the text entry fields would appear with a border
            
            Form {
                Section(header: Text("Full Name")) {
                    /* TextField("Full Name", text: $myAccount.myInfo.name, prompt: Text("Enter your name")) */
                    
                    TextField("Full Name", text: $name, prompt: Text("Enter your name"))
                }
                
                Section(header: Text("Email")) {
                    TextField("Email", text: $email, prompt: Text("Enter your email"))
                }
                
                Section(header: Text("Phone")) {
                    TextField("Phone", text: $phone, prompt: Text("Enter your phone number"))
                }
                
                Section(header: Text("Username")) {
                    TextField("Username", text: $username, prompt: Text("Enter a username"))
                }
                
                Section(header: Text("Password")) {
                    SecureField("Password", text: $password, prompt: Text("Enter a password"))
                }
                
                // Note: There's an onSubmit() function that may be something to consider replacing this with if it doesn't integrate into the project accordingly
                
                /* NavigationLink(destination: VolunteerMenuView()) {
                    
                     //Text("Create Account")
                     Button("Create Account", action: {
                        
                         if !myAccountFile.saveHistory() {
                            
                             print("Error! Account info not saved!")
                            
                         }
                        
                     })
                    
                 }
                 .disabled(myAccountFile.myAccount.username == "" || myAccountFile.myAccount.password == "" || myAccountFile.myAccount.myInfo.name == "" || myAccountFile.myAccount.myInfo.phone == "" || myAccountFile.myAccount.myInfo.email == "" || myAccountFile.saveHistory()) */
                
                /* Button("Create Account", action: {
                    
                     if didSaveHistory {
                        
                         didSaveHistory = myAccountFile.updateHistory()
                        
                     }
                     else {
                    
                         didSaveHistory = myAccountFile.saveHistory()
                        
                     }
                    
                 })
                 .disabled(myAccountFile.myAccount.username == "" || myAccountFile.myAccount.password == "" || myAccountFile.myAccount.myInfo.name == "" || myAccountFile.myAccount.myInfo.phone == "" || myAccountFile.myAccount.myInfo.email == "")
                
                 NavigationLink(destination: VolunteerMenuView()) {
                    
                     Text("Next Page")
                    
                 }
                 .disabled(!didSaveHistory) */
                
                Button("Create Account", action: {
                    // Assign the user-typed credentials into the myAccount object
                    myAccountFile.myAccount.myInfo.name = name
                    myAccountFile.myAccount.myInfo.email = email
                    myAccountFile.myAccount.myInfo.phone = phone
                    myAccountFile.myAccount.username = username
                    myAccountFile.myAccount.password = password
                    
                    if myAccountFile.saveHistory() {
                        didSaveHistory = true
                    }
                    else {
                        // TODO: This line needs to be replaced with some type of notification that an account couldn't be created due to the username already existing
                        print("Unable to create account! (Username taken)")
                    }
                    
                })
                .disabled(username == "" || password == "" || name == "" || phone == "" || email == "")
                
                if didSaveHistory {
                    NavigationLink(destination: VolunteerMenuView(), isActive: $didSaveHistory) {
                        EmptyView()
                    }
                    .disabled(!didSaveHistory)
                }
                
                // Note: The main thing that made this button align correctly is the fact that maxWidth was set to .infinity
                // Button("Create Account", action: {})
                // .frame(maxWidth: .infinity, alignment: .center)
            }
            
            // The following code that's commented out is an inferior way to output the text without a Form
            
            /* VStack(alignment: .leading) {
                    
                 Text("Username")
                
                 // Note: RoundedBorderTextFieldStyle() is used because by default the text field doesn't have borders
                 TextField("Username", text: $username, prompt: Text("Enter a username"))
                 .textFieldStyle(RoundedBorderTextFieldStyle())
                
                 // Note: The padding on the line below only pads the left, top and right respectively for the given VStack
             }.padding([.leading, .top, .trailing])
            
             VStack(alignment: .leading) {
                
                 Text("Password")
                
                 SecureField("Password", text: $password, prompt: Text("Create a passowrd"))
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                
             }.padding() */
            
            // Spacer()
        }
        .navigationBarTitle("Create Account", displayMode: .inline)
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var myAccount = AccountInfoFile()
    
    static var previews: some View {
        CreateAccountView()
            .environmentObject(myAccount)
    }
}
