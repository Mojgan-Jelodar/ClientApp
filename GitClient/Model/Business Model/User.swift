//
//  User.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
struct User {
    let id : Int
    let avatarUrl : String
    let username : String
    let name : String
    let email : String
    let followers : Int
    let following : Int
}
extension User : ModelMapping {
    typealias S = UserResponse
    init(object: UserResponse) {
        self.init(id: object.id,
                  avatarUrl: object.avatarUrl,
                  username: object.username,
                  name: object.name,
                  email: object.email,
                  followers: object.followers,
                  following: object.following)
    }
}
