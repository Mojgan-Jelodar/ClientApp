//
//  MoyaNetworkManager.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import Moya
final class GitHubCredintial {
    static let shared = GitHubCredintial()

    private let keyChainTokenManager = KeyChainTokenCaretaker()
    let accessToken : String?
    private init() {
      self.accessToken = try? keyChainTokenManager.load()?.accessToken ?? ""
    }
}
let sharedNetworkProvider = MoyaProvider<MultiTarget>(
    plugins: [
        NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),
        AccessTokenPlugin {_ in
            GitHubCredintial.shared.accessToken ?? ""
        },
        HeaderPlugin()
    ]
)
let sharedMockNetworkProvider = MoyaProvider<MultiTarget>(
    stubClosure: MoyaProvider.immediatelyStub
)
