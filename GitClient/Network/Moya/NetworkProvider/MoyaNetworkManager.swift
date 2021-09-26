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
    var accessToken : String? = nil {
        didSet {
            guard let value = accessToken else {
                return
            }
            try? keyChainTokenManager.save(data: TokenMomento(accessToken: value))
        }
    }
    private init() {
      self.accessToken = try? keyChainTokenManager.load()?.accessToken ?? nil
    }
}

#if TDD
   let sharedNetworkProvider = MoyaProvider<MultiTarget>(stubClosure : MoyaProvider.delayedStub(1.0),
                                                          plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),
                                                                    AccessTokenPlugin {_ in
                                                                        GitHubCredintial.shared.accessToken ?? ""
                                                                    },
                                                                    HeaderPlugin()
                                                          ])
#else
    let sharedNetworkProvider = MoyaProvider<MultiTarget>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose)),
                                                                        AccessTokenPlugin {_ in
                                                                            GitHubCredintial.shared.accessToken ?? ""
                                                                        },
                                                                        HeaderPlugin()])
#endif
