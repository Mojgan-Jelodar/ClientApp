//
//  DashboardRouter.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import UIKit
protocol DashboardRoutingLogic {
    func routeToDetail(index : Int)
}
protocol DashboardDataPassing {
    var dataStore : DashboardDataStore? { get }
}
extension Dashboard {
    final class Router : DashboardRoutingLogic,DashboardDataPassing {
        var dataStore: DashboardDataStore?
        weak var viewcontroller : UIViewController?
        init(viewcontroller : UIViewController) {
            self.viewcontroller = viewcontroller
        }
        func routeToDetail(index: Int) {
            //let vc = RepoDetail.builder.build(dataStore?.repos[index])
            //viewcontroller?.showDetailViewController(vc, sender: nil)

        }

    }
}
