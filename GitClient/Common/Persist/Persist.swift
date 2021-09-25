//
//  Persist.swift
//  GitClient
//
//  Created by Mozhgan on 9/25/21.
//

import Foundation
import Security

var keyChainTokenManager = KeyChainTokenCaretaker()

protocol Storage {
    var tag : String { get }
    var name : String { get }
    associatedtype T
    func save(data : T) throws
    func load() throws  -> T?
}

struct TokenMomento {
    var accessToken : String
    init(accessToken : String) {
        self.accessToken = accessToken
    }
}

class KeyChainTokenCaretaker : Storage {
    typealias T = TokenMomento
    var tag: String {
        return (Bundle.main.bundleIdentifier ?? "") + ".keys"
    }

    var name: String {
        return "GitHubAccessToken"
    }

    var keyName: String {
        return "GitHubAccessToken"
    }
    func save(data: TokenMomento) throws {
        guard let value = data.accessToken.data(using: .utf8) else {
            throw SecureStoreError.string2DataConversionError
        }
        var query = self.query
        query[String(kSecAttrAccount)] = name
        var status = SecItemCopyMatching(query as CFDictionary, nil)
        switch status {
        case errSecSuccess:
          var attributesToUpdate: [String: Any] = [:]
          attributesToUpdate[String(kSecValueData)] = value
          status = SecItemUpdate(query as CFDictionary,
                                 attributesToUpdate as CFDictionary)
          if status != errSecSuccess {
            throw error(from: status)
          }
        case errSecItemNotFound:
          query[String(kSecValueData)] = value
          status = SecItemAdd(query as CFDictionary, nil)
          if status != errSecSuccess {
            throw error(from: status)
          }
        default:
          throw error(from: status)
        }
    }

    func load() throws -> TokenMomento? {
        var query = self.query
        query[String(kSecMatchLimit)] = kSecMatchLimitOne
        query[String(kSecReturnAttributes)] = kCFBooleanTrue
        query[String(kSecReturnData)] = kCFBooleanTrue
        query[String(kSecAttrAccount)] = name
        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
          SecItemCopyMatching(query as CFDictionary, $0)
        }
        switch status {
        case errSecSuccess:
          guard
            let queriedItem = queryResult as? [String: Any],
            let valueData = queriedItem[String(kSecValueData)] as? Data,
            let token = String(data: valueData, encoding: .utf8)
            else {
              throw SecureStoreError.data2StringConversionError
          }
          return TokenMomento(accessToken: token)
        case errSecItemNotFound:
          return nil
        default:
          throw error(from: status)
        }
    }

    private func error(from status: OSStatus) -> SecureStoreError {
      let message = SecCopyErrorMessageString(status, nil) as String? ?? NSLocalizedString("Unhandled Error", comment: "")
      return SecureStoreError.unhandledError(message: message)
    }
}
