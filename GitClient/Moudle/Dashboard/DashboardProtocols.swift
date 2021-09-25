//
//  DashboardProtocols.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
extension Dashboard {
    struct Builder : SceneBuilder {
        typealias Output = DashboardVC
        typealias Input = String

        static func build(with : String) -> DashboardVC {
            let vc  = DashboardVC()
            let presenter = Dashboard.Presenter()
            presenter.viewController = vc
//            let interactor = Dashboard.Interactor(userManager: Moya,
//                                                  repoManager: <#T##RepoManager#>,
//                                                  presenter: Presenter)
//            vc.interactor =
            return vc

        }

    }
}
