//
//  User.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
struct UserResponse : Codable {
    let id : Int
    let avatarUrl : String
    let username : String
    let name : String
    let email : String
    let followers : Int
    let following : Int
    enum CodingKeys : String,CodingKey {
       case id
       case username = "login"
       case avatarUrl = "avatar_url"
       case name
       case email
       case followers
       case following
    }
}
