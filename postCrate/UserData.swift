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


