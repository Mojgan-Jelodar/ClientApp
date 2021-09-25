//
//  MoyaNetworkManager.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import Moya
let sharedNetworkProvider = MoyaProvider<MultiTarget>(
    plugins: [
        NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),
        AccessTokenPlugin {_ in
            ""
            //GitHubAuthenticator.shared.accessToken ?? ""
        },
        HeaderPlugin()
    ]
)
let sharedMockNetworkProvider = MoyaProvider<MultiTarget>(
    stubClosure: MoyaProvider.immediatelyStub
)
