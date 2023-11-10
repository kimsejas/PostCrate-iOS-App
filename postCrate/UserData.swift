//
//  UserData.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/6/23.
//

import Foundation

struct UserData: Codable{
    var user: User
    
    var categories: [Category]
    
    init(user: User, categories: [Category] = []) {
        self.user = user
        self.categories = categories
    }
    
}
extension UserData{
    // save userData to userdefaults
        static func saveUserData(_ userData: UserData){
        let defaults = UserDefaults.standard
        let userKey = Username.shared.username!
        let encodedData = try! JSONEncoder().encode(userData)
        defaults.set(encodedData, forKey: userKey)
        
        
    }
    
    // get userData to userDefaults
    static func getUserdata() -> UserData{
        let defaults = UserDefaults.standard
        let userKey = Username.shared.username!
        let userData = defaults.data(forKey: userKey)
        var decodedUserData = try! JSONDecoder().decode(UserData.self, from: userData!)
        return decodedUserData
        
    }
}


