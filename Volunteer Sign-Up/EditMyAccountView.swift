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
    
    var body: some View {
        
        VStack {
            
            //Text("My Account")
            
            Divider()
            
            VStack {
            
                Section(header: Text("Name").padding(.top)) {
                    
                    TextField("Full Name", text: $myAccountFile.myAccount.myInfo.name, prompt: Text("Enter your name"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        //.padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
            
            }
            //.padding(.top)
            //.padding(.bottom)
            
            VStack {
            
                Section(header: Text("Email").padding(.top)) {
                    
                    TextField("", text: $myAccountFile.myAccount.myInfo.email, prompt: Text("Enter your email"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        //.padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                
            }
            //.padding(.bottom)
            
            VStack {
            
                Section(header: Text("Phone").padding(.top)) {
                    
                    TextField("", text: $myAccountFile.myAccount.myInfo.phone, prompt: Text("Enter your phone number"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        //.padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                
            }
            //.padding(.bottom)
            
            VStack {
            
                Section(header: Text("Username").padding(.top)) {
                    
                    TextField("", text: $myAccountFile.myAccount.username, prompt: Text("Enter your username"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        //.padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                
            }
            //.padding(.bottom)
            
            VStack {
            
                Section(header: Text("Password").padding(.top)) {
                    
                    SecureField("", text: $myAccountFile.myAccount.password, prompt: Text("Enter your password"))
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        //.padding(.top, 5)
                        .padding()
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(10)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                
            }
            //.padding(.bottom)
            
            Spacer()
            
        }
        // TODO: When the "Save" button is clicked, I envision that the typed in information will be updated and the form entries will clear themselves.
        .navigationBarTitle("Edit My Profile", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: { self.presentationMode.wrappedValue.dismiss() }) { Text("Cancel") }, trailing: Button(action: { /* TODO: Figure out how to save the user input. */ }) { Text("Save") })
    }
}

struct EditMyAccountView_Previews: PreviewProvider {
    
    static let myAccount = AccountInfoFile()
    
    static var previews: some View {
        EditMyAccountView()
            .environmentObject(myAccount)
    }
}
