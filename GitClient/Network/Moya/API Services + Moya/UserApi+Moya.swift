//
//  UserApi+Moya.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import Moya
extension UserApi : TargetType,AccessTokenAuthorizable {
    var baseURL: URL {
        return URL(string: APIServiceConstants.baseURL)!.appendingPathComponent("user")
    }

    var path: String {
        switch self {
        case .getProfile:
            return "/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getProfile:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .getProfile:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        return nil
    }

    var authorizationType: AuthorizationType? {
        return .bearer
    }

}
