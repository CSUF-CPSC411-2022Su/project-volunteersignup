//
//  UserInfoClass.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/16/22.
//

import Foundation

class UserInfo: p_UserInfo {
    var name: String
    var address: String
    var email: String
    var phone: String
    
    init(){
        self.name = ""
        self.address = ""
        self.email = ""
        self.phone = ""
    }
    init(name: String, address: String, email: String, phone: String){
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone
    }
}
