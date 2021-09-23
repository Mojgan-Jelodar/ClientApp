//
//  GitHubAuthenticator.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
final class GitHubAuthenticator {
    let publisher = NotificationCenter.default.publisher(for: Notification.Name.OAuthtHandleCallbackURL)
    init() {
        publisher.sink { _ in
            print("done")
        }
    }

}
