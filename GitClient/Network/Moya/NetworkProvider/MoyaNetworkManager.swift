//
//  MoyaNetworkManager.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import Moya

final class Token {
    static let shared : Token = Token()
    var accessToken : String = ""
}
let authPlugin = AccessTokenPlugin { _ in Token.shared.accessToken }
let sharedNetworkProvider = MoyaProvider<MultiTarget>(
    /*
    session: Session(
        delegate: MoyaSessionDelegate(publicKeyHashes: [])
    ),
    */
    plugins: [
        NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),
        authPlugin
    ]
)
let sharedMockNetworkProvider = MoyaProvider<MultiTarget>(
    stubClosure: MoyaProvider.immediatelyStub
)
