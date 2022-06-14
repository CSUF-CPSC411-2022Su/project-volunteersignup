//
//  UserInfoClass.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/13/22.
//

import Foundation

class UserInfo {
    
    var name: String
    var email: String
    var phone: String
    
    init() {
        
        name = ""
        email = ""
        phone = ""
        
    }
    
    init(name: String, email: String, phone: String) {
        
        self.name = name
        self.email = email
        self.phone = phone
        
    }
    
}
