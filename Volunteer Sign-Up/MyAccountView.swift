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
            
            //Text("My Account")
            
            Divider()
            
            VStack {
            
                Section(header: Text("Name").padding(.top)) {
                    
                    Text("\(myAccountFile.myAccount.myInfo.name)")
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
                    
                    Text("<Insert Email Here>")
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
                    
                    Text("<Insert Phone Here>")
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
                    
                    Text("<Insert Username Here>")
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
                    
                    Text("<Insert Password Here>")
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
            
            VStack {
            
                NavigationLink(destination: EditMyAccountView()) {
                    
                    Text("Edit")
                    
                }
                
            }
            .padding()
            
            Spacer()
            
        }
        .navigationBarTitle("My Profile", displayMode: .inline)
    }
}

struct MyAccountView_Previews: PreviewProvider {
    static var previews: some View {
        MyAccountView()
    }
}
