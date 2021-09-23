//
//  LoginBuilder.swift
//  GitClient
//
//  Created by Mozhgan on 9/22/21.
//

import Foundation
import SafariServices

protocol SceneBuilder {
    associatedtype Output
    associatedtype Input
    static func build(with : Input) -> Output
}
extension SceneBuilder where Input == Void {

    static func build() -> Output {
        return Self.build(with: ())
    }

}

extension Login {
    struct Builder : SceneBuilder {
        typealias Output = SFSafariViewController
        typealias Input = Void

        static func build(with : Input) -> SFSafariViewController {
            var path = APIServiceConstants.baseURL.appending("login/oauth/authorize")
            let queryParamEncoder = QueryParamEncoder()
            path.append((try? queryParamEncoder.encode(AuthorizeRequest())) ?? "")
            let url = URL(string: path)!
            let webView = SFSafariViewController(url: url ,
                                            configuration: SFSafariViewController.Configuration())
            return webView
        }
    }

}
