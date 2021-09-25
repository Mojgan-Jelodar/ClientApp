//
//  DashboardViewModel.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
extension Dashboard {
    final class ViewModel {
        var user : User?
        var repos : [Repo]?
        var message : String = ""
    }
}
