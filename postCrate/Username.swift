//
//  Username.swift
//  postCrate
//
//  Created by Kimberly Sejas on 11/10/23.
//

import Foundation

class Username {
    static let shared = Username()

    var username: String?

    private init() {
        // Private initializer to enforce singleton pattern
    }
}

