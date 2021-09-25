//
//  Repo.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
struct Repo {

}

extension Repo : ModelMapping {
    typealias S = RepoResponse
    init(object: RepoResponse) {
        self.init()
    }
}
