//
//  AccountInfoFileClass.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/23/22.
//

import Foundation
import SwiftUI

class AccountInfoFile: ObservableObject {
    @Published var myAccount: AccountInfo = AccountInfo()
    @Published var fileURL: URL? = nil
    
    // This default constructor is called only at the CreateAccount page when username and password aren't available
    init() {
        
    }

    // This type constructor is called from any page that already has access to username and password
    init(username: String, password: String) {
        // TODO: Create a path to a file named crosswalks.plist and store in fileURL
        
        self.myAccount.username = username
        self.myAccount.password = password

        let documentsDirectory = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!

        fileURL = documentsDirectory
            .appendingPathComponent("\(self.myAccount.username)")
            .appendingPathExtension("plist")

        loadHistory()
    }

    /*func addSearchString(_ searchString: String) {
        if searchStrings.count == maxsearches {
            searchStrings.remove(at: maxsearches - 1)
        }
        searchStrings.insert(searchString, at: 0)
        saveHistory()
    }*/

    func saveHistory() {
        // TODO: Save the searchStrings array into a file
        
        // Make sure that fileURL isn't nil (otherwise when we say "fileURL!" below, the code has a chance of failing)
        guard fileURL != nil else {
            print("Error! fileURL is nil!")
            return
        }
        
        let propertyListEncoder = PropertyListEncoder()
        if let encodedAccount = try? propertyListEncoder.encode(myAccount) {
            try? encodedAccount.write(to: fileURL!,
                                        options: .noFileProtection)
        }
    }

    func loadHistory() {
        // TODO: Load data from the file and store it in searchStrings
        
        // Make sure that fileURL isn't nil (otherwise when we say "fileURL!" below, the code has a chance of failing)
        guard fileURL != nil else {
            print("Error! fileURL is nil!")
            return
        }
        
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedAccount = try? Data(contentsOf: fileURL!),
           let decodedAccount = try?
           propertyListDecoder.decode(AccountInfo.self,
                                      from: retrievedAccount)
        {
            myAccount = decodedAccount
        }
    }
}
