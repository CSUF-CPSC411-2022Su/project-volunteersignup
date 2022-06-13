//
//  CreateAccountClass.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/13/22.
//

import Foundation

class CreateAccount {
    
    var name: String = ""
    var email: String = ""
    var phone: String = ""
    var username: String = ""
    var password: String = ""
    
    init(name: String, email: String, phone: String, username: String, password: String)
    {
        self.name = name
        self.email = email
        self.phone = phone
        self.username = username
        self.password = password
    }
    
}
