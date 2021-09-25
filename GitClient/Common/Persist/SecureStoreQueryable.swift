//
//  SecureStoreQueryable.swift
//  GitClient
//
//  Created by Mozhgan on 9/25/21.
//

import Foundation
public protocol SecureStoreQueryable {
  var query: [String: Any] { get }
}

extension KeyChainTokenCaretaker : SecureStoreQueryable {
    var query: [String: Any] {
        var query: [String: Any] = [:]
        query[String(kSecClass)] = kSecClassGenericPassword
        query[String(kSecAttrService)] = tag
//        // Access group if target environment is not simulator
//        #if !targetEnvironment(simulator)
//        if let accessGroup = accessGroup {
//          query[String(kSecAttrAccessGroup)] = accessGroup
//        }
//        #endif
        return query
    }
}
