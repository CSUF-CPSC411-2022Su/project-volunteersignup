//
//  CreateAccountClass.swift
//  Volunteer Sign-Up
//
//  Created by Steven on 6/13/22.
//

import Foundation

struct AccountInfo: Codable {
    var username: String
    var password: String
    var myEvents: ListEvents
    var myInfo: UserInfo
    
    init() {
        username = ""
        password = ""
        myEvents = ListEvents()
        myInfo = UserInfo()
    }
}

/* class AccountInfo: ObservableObject {
    
     @Published var username: String
     @Published var password: String
    
     @Published var myEvents: ListEvents
     @Published var myInfo: UserInfo
     //var mySettings: UserSettings?
    
     // This initializer is used first when CreateAccount is filled out
     init() {
        
         self.username = ""
         self.password = ""
         myEvents = ListEvents()
         myInfo = UserInfo()
         //mySettings = nil
        
     }
    
     // This initializer is used first when LoginPage is filled out
     init(username: String, password: String) {
        
         self.username = username
         self.password = password
         myEvents = ListEvents()
         myInfo = UserInfo()
         //mySettings = nil
        
     }
    
 } */
