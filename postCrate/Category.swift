//
//  Category.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/6/23.
//

import Foundation

// categories will hold posts 
struct Category:Codable{
    
    var name: String
    var posts: [Post]
    
    
    init(name: String, posts: [Post] = []) {
        self.name = name
        self.posts = posts
    }
}


