//
//  User.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
struct User {
    let name : String
}
extension User : ModelMapping {
    typealias S = UserResponse
    init(object: UserResponse) {
        self.init(name: object.name)
    }
}
