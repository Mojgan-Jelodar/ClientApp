//
//  QueryParamEncoder.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation

struct QueryParamEncoder {
    func encode<T: Encodable>(_ item: T) throws -> String {
        let dictionary = item.dictionary
        let queryParams = encodeDictionary(dictionary ?? [:])
        return "?\(queryParams)"
    }
    
    private func encodeDictionary(_ dictionary: [String: Any]) -> String {
        return dictionary
            .compactMap { (key, value) -> String? in
                if value is [String: Any] {
                    if let dictionary = value as? [String: Any] {
                        return encodeDictionary(dictionary)
                    }
                }
                else {
                    return "\(key)=\(value)"
                }
                
                return nil
            }
            .joined(separator: "&")
    }
}
