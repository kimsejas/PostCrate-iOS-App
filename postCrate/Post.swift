//
//  Post.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/9/23.
//

import Foundation

//social media post

struct Post:Codable{
    
    var url: String
}

extension Post{
    static func isURL(url: String) -> Bool{
        let prefixToCheck = "https://"
        if url.hasPrefix(prefixToCheck) {
            return true
        } else {
            return false
        }
    }
}
