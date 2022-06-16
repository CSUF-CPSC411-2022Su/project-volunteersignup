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
    var address: String
    var phone: String
    
    init() {
        
        name = ""
        email = ""
        address = ""
        phone = ""
        
    }
    
    init(name: String, email: String, address: String, phone: String) {
        
        self.name = name
        self.email = email
        self.address = address
        self.phone = phone
        
    }
    
}
