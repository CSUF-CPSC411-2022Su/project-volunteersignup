//
//  MyAccountView.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/16/22.
//

import SwiftUI

struct MyAccountView: View {
    @EnvironmentObject var myAccountFile: AccountInfoFile
    
    var body: some View {
        VStack {
            // Text("My Account")
            
            Divider()
            
            VStack {
                Section(header: Text("Name").padding(.top)) {
                    Text("\(myAccountFile.myAccount.myInfo.name)")
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
                    Text("\(myAccountFile.myAccount.myInfo.email)")
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
                    Text("\(myAccountFile.myAccount.myInfo.phone)")
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
                    Text("\(myAccountFile.myAccount.username)")
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
                    Text("\(myAccountFile.myAccount.password)")
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
            
            /*VStack {
                NavigationLink(destination: EditMyAccountView()) {
                    Text("Edit")
                }
            }
            .padding()*/
            
            HStack {
                
                VStack {
                    
                    NavigationLink(destination: HomeView()) {
                        
                        Text("Sign out")
                        
                    }
                    .navigationBarBackButtonHidden(true)
                    
                }
                .padding(.leading, 40)
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: EditMyAccountView()) {
                        
                        Text("Edit")
                        
                    }
                    
                }
                .padding(.trailing, 40)
                    
            }
            
            Spacer()
        }
        // .navigationBarTitle("My Profile", displayMode: .inline)
        // .navigationBarTitle(Image(systemName: "person.circle.fill").frame(maxWidth: .infinity, alignment: .center).cornerRadius(20), displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Image(systemName: "person.circle.fill").scaledToFit().foregroundColor(.blue)
            }
        }
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static let myAccountFile = AccountInfoFile()
    
    static var previews: some View {
        MyAccountView()
            .environmentObject(myAccountFile)
    }
}
