//
//  UserInfo.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/13/22.
//

import Foundation

class UserInfo: p_UserInfo {
    var firstName: String
    var lastName: String
    var address: String
    var email: String
    var phoneNumer: String
    
    init(firstName: String, lastName: String, address: String, email: String, phoneNumber: String){
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.email = email
        self.phoneNumer = phoneNumber
    }
}
