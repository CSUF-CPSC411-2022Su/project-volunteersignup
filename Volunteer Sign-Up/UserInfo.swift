//
//  UserInfo.swift
//  Volunteer Sign-Up
//
//  Created by Kai Eusebio on 6/13/22.
//

import Foundation

class UserInfo: p_UserInfo {
    var name: String
    var address: String
    var email: String
    var phoneNumer: String
    
    init(name: String, address: String, email: String, phoneNumber: String){
        self.name = name
        self.address = address
        self.email = email
        self.phoneNumer = phoneNumber
    }
}
