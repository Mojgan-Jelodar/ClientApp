//
//  File.swift
//  GitClient
//
//  Created by Mozhgan on 9/22/21.
//

import Foundation
import Combine
import SafariServices

final class  SafariViewControllerDelegate : NSObject,SFSafariViewControllerDelegate {
    let publisher = NotificationCenter.default.publisher(for: Notification.Name.OAuthtHandleCallbackURL)
    override init() {
        publisher.sink { _ in
            print("done")
        }
    }
}
