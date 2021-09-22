//
//  MoyaNetworkManager.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import Moya

let sharedNetworkProvider = MoyaProvider<MultiTarget>(
    /*
    session: Session(
        delegate: MoyaSessionDelegate(publicKeyHashes: [])
    ),
    */
    plugins: [
        NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
    ]
)

let sharedMockNetworkProvider = MoyaProvider<MultiTarget>(
    stubClosure: MoyaProvider.immediatelyStub
)
