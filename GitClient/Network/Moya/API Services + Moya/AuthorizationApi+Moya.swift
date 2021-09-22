//
//  UserAPIService+Moya.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import Moya
extension AuthorizationApi : TargetType {
    var baseURL: URL {
        return URL(string: APIServiceConstants.baseURL)!.appendingPathComponent("login/oauth/")
    }

    var path: String {
        switch self {
        case .accessToken:
            return "/access_token"
        }
    }

    var method: Moya.Method {
        switch self {
        case .accessToken:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .accessToken(let params):
            return .requestParameters(parameters: params.dictionary ?? [:], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        return nil
    }

}
