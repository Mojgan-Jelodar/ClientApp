//
//  File.swift
//  GitClient
//
//  Created by Mozhgan on 9/22/21.
//

import Foundation
struct GithubConstants {
    static let  authorizeUrl = "https://github.com/login/oauth/authorize"
    static let accessTokenUrl = "https://github.com/login/oauth/access_token"
    static let clientId = "7585078a1d8e1607ad8e"
    static let clienrSecret = "437467bfda2578e17cad27749973da2895f22fee"
    static let scope = "read:user,user:email,repo"

//    static let CLIENT_ID = "7585078a1d8e1607ad8e"
//    static let CLIENT_SECRET = "437467bfda2578e17cad27749973da2895f22fee"
//    static let REDIRECT_URI = "http://GitHubClient"
//    static let SCOPE = "read:user,user:email"
//    static let TOKENURL = "https://github.com/login/oauth/access_token"
}

//▿ oauth-swift://oauth-callback/github?code=d2a4da44da0e987d3305&state=H5ByCl0OYEFJ2WFuPzaR
//  - _url : oauth-swift://oauth-callback/github?code=d2a4da44da0e987d3305&state=H5ByCl0OYEFJ2WFuPzaR
