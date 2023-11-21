//
//  Post.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/9/23.
//

import Foundation

//tumblr post
struct Blog: Codable{
    let response: Response
}

struct Response: Codable {
    let posts: [Post]
}

struct Post: Codable{
    let content: [Content]
    let post_url: URL
}

struct Content: Codable{
    let media: [Media]
    
}
struct Media: Codable{
    let url: URL
    
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
