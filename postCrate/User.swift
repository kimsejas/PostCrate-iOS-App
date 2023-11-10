//
//  User.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/6/23.
//

import Foundation
import UIKit

//The user model
struct User: Codable{
    
    //The user's username
    var username: String
    
    //The user's password
    var password: String
    
    // Initalize user
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
}

// User and UserDefaults
extension User{
    
    static func registerUser(username: String, password: String) -> Bool{
        
        let defaults = UserDefaults.standard
        if defaults.data(forKey: username) != nil{
            // username already exists
            print("user already exists ❌")
            return false
        }
        else{
            let user = User(username: username, password: password)
            let userData = UserData(user: user, categories: [])
            let encodedData = try! JSONEncoder().encode(userData)
            defaults.setValue(encodedData, forKey: user.username)
            print("user created ✅")
            return true
        }
    }
    
    static func loginUser(username: String, password: String) -> Bool{
        let defaults = UserDefaults.standard
        if let data = defaults.data(forKey: username){
            let decodedUserData = try! JSONDecoder().decode(UserData.self, from: data)
            if decodedUserData.user.password == password{
                //correct password
                print("correct user and pass✅")
                Username.shared.username = username
                return true
            }
            else{
                //wrong password
                print("incorrect pass❌")
                return false
            }
        }
        else{
            // username doesn't exist
            print("user DNE❌")
            return false
        }
        
    }
    
}
