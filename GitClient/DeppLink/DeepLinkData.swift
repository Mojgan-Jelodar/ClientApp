//
//  DeepLinkData.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import Combine

final class GithubDeepLinkData: ObservableObject {
 @Published var somevar:String  = "code"

}
extension URL {
 func valueOf(_ queryParamaterName: String) -> String? {
    guard let url = URLComponents(string: self.absoluteString) else { return nil }
    return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value?.removingPercentEncoding?.removingPercentEncoding
 }
}


struct DeepLinkerManager {
    private init(){}
    static func handleDeepLinkUrl(_ url: URL?){
     guard let url = url else {return}
     if let source = url.valueOf(GithubDeepLinkData().somevar) {
        
     }
    }
}
