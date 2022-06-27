//
//  EditMyAccountView.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/16/22.
//

import SwiftUI

struct EditMyAccountView: View {
    @EnvironmentObject var myAccountFile: AccountInfoFile
    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            // Text("My Account")
            
            Divider()
            
            /* VStack {
                
                 Image(systemName: "person.circle.fill")
                     .font(Font.system(.largeTitle))
                     //.resizable()
                     .scaledToFit()
                     //.frame(width: 175)
                     .padding()
                     .foregroundColor(.blue)
                     .shadow(radius: 5)
             } */
            
            VStack {
                Section(header: Text("Name")) {
                    TextField("Full Name", text: $name, prompt: Text("\(myAccountFile.myAccount.myInfo.name)"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        // .padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            // .padding(.top)
            // .padding(.bottom)
            
            VStack {
                Section(header: Text("Email").padding(.top)) {
                    TextField("Email", text: $email, prompt: Text("\(myAccountFile.myAccount.myInfo.email)"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        // .padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            // .padding(.bottom)
            
            VStack {
                Section(header: Text("Phone").padding(.top)) {
                    TextField("Phone", text: $phone, prompt: Text("\(myAccountFile.myAccount.myInfo.phone)"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        // .padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            // .padding(.bottom)
            
            VStack {
                Section(header: Text("Username").padding(.top)) {
                    TextField("Username", text: $username, prompt: Text("\(myAccountFile.myAccount.username)"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        // .padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            // .padding(.bottom)
            
            VStack {
                Section(header: Text("Password").padding(.top)) {
                    SecureField("Password", text: $password, prompt: Text("\(myAccountFile.myAccount.password)"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        // .padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            // .padding(.bottom)
            
            Spacer()
        }
        // TODO: When the "Save" button is clicked, I envision that the typed in information will be updated and the form entries will clear themselves.
        .navigationBarTitle("Edit My Profile", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button("Cancel", action: { self.presentationMode.wrappedValue.dismiss() }), trailing: Button("Save", action: {
            if username != "" {
                // Try to rename the old username file to a new username
                
                if myAccountFile.updateUsername(username: username) {
                    // Reassign the new username to myAccount
                    myAccountFile.myAccount.username = username
                    print("Success! I was able to change your username!")
                }
                else {
                    print("Error! Unable to change username!")
                }
                    
                // Check if the data from the new username file can be loaded into myAccountFile
                /* if myAccountFile.loadHistory(username: username, password: myAccountFile.myAccount.password) {
                         print("Successfully updated the username to \(username) and transferred and loaded the data from \(username).plist into myAccountFile!")
                     }
                     else {
                         print("Error! I was able to create a new username file, but I was unable to read that data into myAccountFile!")
                     }
                 }
                 else {
                     print("Error! Unable to update the username file!")
                 } */
            }
            
            if password != "" {
                myAccountFile.myAccount.password = password
            }
            
            if name != "" {
                myAccountFile.myAccount.myInfo.name = name
            }
            
            if email != "" {
                myAccountFile.myAccount.myInfo.email = email
            }
            
            if phone != "" {
                myAccountFile.myAccount.myInfo.phone = phone
            }
            
            // Update the current account information
            if myAccountFile.updateHistory() {
                print("Account history saved!")
                self.presentationMode.wrappedValue.dismiss()
            }
            else {
                print("Error! Account history was unable to be saved!")
            }
            
        }))
    }
}

struct EditMyAccountView_Previews: PreviewProvider {
    static let myAccount = AccountInfoFile()
    
    static var previews: some View {
        EditMyAccountView()
            .environmentObject(myAccount)
    }
}
