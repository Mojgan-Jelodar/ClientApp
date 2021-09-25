//
//  RepoDetail.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
struct RepoDetail {

}
extension RepoDetail : ModelMapping {
    typealias S = RepoDetailResponse
    init(object: RepoDetailResponse) {
        self.init()
    }
}
