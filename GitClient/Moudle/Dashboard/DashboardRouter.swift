//
//  DashboardRouter.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import UIKit
protocol DashboardRoutingLogic {
    func routeToDetail(id : String)
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
        func routeToDetail(id: String) {
           // self.viewcontroller?.show(<#T##vc: UIViewController##UIViewController#>, sender: <#T##Any?#>)
        }
    }
}
