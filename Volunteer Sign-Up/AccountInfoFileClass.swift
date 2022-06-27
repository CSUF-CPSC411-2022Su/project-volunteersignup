//
//  AccountInfoFileClass.swift
//  Volunteer Sign-Up
//
//  Created by csuftitan on 6/23/22.
//

import Foundation
import SwiftUI

class AccountInfoFile: ObservableObject {
    @Published var myAccount: AccountInfo = .init()
    @Published var fileURL: URL? = nil
    
    // This default constructor is called only at the CreateAccount page when username and password aren't available
    init() {
        myAccount.username = ""
        myAccount.password = ""
        myAccount.myInfo.phone = ""
        myAccount.myInfo.email = ""
        myAccount.myInfo.address = ""
        myAccount.myInfo.name = ""
    }

    // This type constructor is called from any page that already has access to username and password
    /* init(username: String, password: String) {
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
     } */

    /* func addSearchString(_ searchString: String) {
         if searchStrings.count == maxsearches {
             searchStrings.remove(at: maxsearches - 1)
         }
         searchStrings.insert(searchString, at: 0)
         saveHistory()
     } */

    func saveHistory() -> Bool {
        // TODO: Save the searchStrings array into a file
        
        // The issue with this function is that if the user provides a username that already exists, then that information will be overwritten
        
        // self.myAccount.username = username
        // self.myAccount.password = password
        
        // Check if the <username>.plist file exists or not
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("\(myAccount.username).plist") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print("The \(myAccount.username).plist file exists: Cannot create a new account!")
                return false
            }
        } else {
            print("\(myAccount.username).plist is an invalid file path name!")
            return false
        }

        // Get the Documents folder path
        let documentsDirectory = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!

        // Get the directory of the <username>.plist file
        fileURL = documentsDirectory
            .appendingPathComponent("\(myAccount.username)")
            .appendingPathExtension("plist")
        
        // Make sure that fileURL isn't nil (otherwise when we say "fileURL!" below, the code has a chance of failing)
        guard fileURL != nil else {
            print("Error! fileURL is nil!")
            return false
        }
        
        // Attempt to encode data and write it to fileURL
        let propertyListEncoder = PropertyListEncoder()
        if let encodedAccount = try? propertyListEncoder.encode(myAccount) {
            try? encodedAccount.write(to: fileURL!,
                                      options: .noFileProtection)
            return true
        } else {
            print("Cannot write to \(myAccount.username).plist file!")
            return false
        }
    }
    
    func updateHistory() -> Bool {
        // Check if the <username>.plist file exists or not
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent("\(myAccount.username).plist") {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if !fileManager.fileExists(atPath: filePath) {
                print("The \(myAccount.username).plist file does NOT exist: Cannot update the account!")
                return false
            }
        } else {
            print("\(myAccount.username).plist is an invalid file path name!")
            return false
        }

        // Get the Documents folder path
        let documentsDirectory = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!

        // Get the directory of the <username>.plist file
        fileURL = documentsDirectory
            .appendingPathComponent("\(myAccount.username)")
            .appendingPathExtension("plist")
        
        // Make sure that fileURL isn't nil (otherwise when we say "fileURL!" below, the code has a chance of failing)
        guard fileURL != nil else {
            print("Error! fileURL is nil!")
            return false
        }
        
        // Attempt to encode data and write it to fileURL
        let propertyListEncoder = PropertyListEncoder()
        if let encodedAccount = try? propertyListEncoder.encode(myAccount) {
            try? encodedAccount.write(to: fileURL!,
                                      options: .noFileProtection)
            return true
        } else {
            print("Cannot write to \(myAccount.username).plist file!")
            return false
        }
    }

    func loadHistory(username: String, password: String) -> Bool {
        // TODO: Load data from the file and store it in searchStrings
        
        // Note: This function assumes that username and password are NOT empty strings
        
        // 1) Load the AccountInfo object from <username>.plist into myAccount (return false if the file doesn't exist)
        
        // Get the documents directory
        let documentsDirectory = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!

        // Get the address of the <username>.plist file
        fileURL = documentsDirectory
            .appendingPathComponent("\(username)")
            .appendingPathExtension("plist")
        
        // Make sure that the filename isn't nil before proceeding
        guard fileURL != nil else {
            print("Error! fileURL is nil!")
            return false
        }
        
        // Attempt to decode the file (this process will return false if the file doesn't exist/can't be decoded)
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedAccount = try? Data(contentsOf: fileURL!),
           let decodedAccount = try?
           propertyListDecoder.decode(AccountInfo.self,
                                      from: retrievedAccount)
        {
            myAccount = decodedAccount
        } else {
            print("Error! The \(username).plist file could not be decoded! (The file likely doesn't exist)")
            return false
        }
        
        // 2) Check to see if myAccount.password is the same as the password loaded from <username>.plist (return false if passwords do NOT match)
        
        if myAccount.password != password {
            // This means that the username exists, but the password doesn't match the AccountInfo object
            print("Error! The password in \(username).plist does not match the password: \(password) provided")
            return false
        }
        
        // Assuming 1) and 2) didn't return false, myAccount is the new object to be used within the program so we return true
        
        return true
    }
    
    func fileExists(at file: String) -> Bool {
        let fileNameToDelete = file
        var filePath = ""
        // Fine documents directory on device
        let dirs: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        if dirs.count > 0 {
            let dir = dirs[0] // documents directory
            filePath = dir.appendingFormat("/" + fileNameToDelete)
            // print("Local path = \(filePath)")
        } else {
            // print("Could not find local directory to store file")
            return false
        }
        let fileManager = FileManager.default
        // Check if file exists
        if fileManager.fileExists(atPath: filePath) {
            // print("File exists")
            return true
        } else {
            // print("File does not exist")
            return false
        }
    }
    
    func moveItem(at oldPath: String, to newPath: String) -> Bool {
        let fileNameToDelete = oldPath
        let fileNameToMove = newPath
        var filePathToDelete = ""
        var filePathToMove = ""
        // Find documents directory on device
        let dirs: [String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        if dirs.count > 0 {
            let dir = dirs[0] // documents directory
            filePathToDelete = dir.appendingFormat("/" + fileNameToDelete)
            filePathToMove = dir.appendingFormat("/" + fileNameToMove)
            // print("Local path = \(filePath)")
        } else {
            // print("Could not find local directory to store file")
            return false
        }
        
        let fileManager = FileManager.default
        
        // Check to see if the file exists
        if fileManager.fileExists(atPath: fileNameToMove) {
            print("Error! The file at \(newPath).plist already exists!")
            return false
        } else {
            // Move file
            if let success = try? fileManager.moveItem(atPath: filePathToDelete, toPath: filePathToMove) {
                print("Successfully moved \(fileNameToDelete).plist to \(fileNameToMove).plist! (Code: \(success)")
                return true
            } else {
                print("Error! Unable to complete the move of \(fileNameToDelete).plist to \(fileNameToMove).plist!")
                return false
            }
        }
    }
    
    func updateUsername(username: String) -> Bool {
        // Check to make sure that the new username doesn't already exist
        if fileExists(at: username + ".plist") {
            print("Error! \(username).plist already exists! Unable to update the current username!")
            return false
        }
        
        // Get the documents directory
        let documentsDirectory = FileManager
            .default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!

        // Get the address of the <username>.plist file
        fileURL = documentsDirectory
            .appendingPathComponent("\(myAccount.username)")
            .appendingPathExtension("plist")
        
        // Copy the old file into the new file
        /* var rv = URLResourceValues()
         rv.name = username + ".plist"
         if let myFile = try? fileURL!.setResourceValues(rv) {
             print("Success! File converted to \(username).plist! (File name: \(myFile))")
             return true
         }
         else {
             print("Error! Unable to convert \(myAccount.username).plist to \(username).plist!")
             return false
         } */
        
        if moveItem(at: myAccount.username + ".plist", to: username + ".plist") {
            print("Successfully moved the file at \(myAccount.username).plist to \(username).plist!")
            return true
        } else {
            print("Error! Unable to move the file at \(myAccount.username).plist to \(username).plist!")
            return false
        }
    }
    
    // This function is used to find your local Documents directory
    func clearDocuments() {
        let documentsDirectory =
            FileManager.default.urls(for: .documentDirectory,
                                     in: .userDomainMask).first!

        print(documentsDirectory)
    }
}
