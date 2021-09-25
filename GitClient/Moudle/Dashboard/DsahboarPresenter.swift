//
//  DsahboarPresenter.swift
//  GitClient
//
//  Created by Mozhgan on 9/24/21.
//

import Foundation
enum ServiceResult<T : Codable> {
    case success(value : T)
    case failure(error : Error)
}
protocol  DashboardPresentationLogic : AnyObject {
    func fetched(user: ServiceResult<UserResponse>)
    func fetched(repos : ServiceResult<RepoResponse>)
}

protocol DashboardDisplayLogic : AnyObject {
    func show(error : Dashboard.ViewModel)
    func show(user : Dashboard.ViewModel)
    func show(repos : Dashboard.ViewModel)
}

extension Dashboard {

    final class Presenter : DashboardPresentationLogic {

        weak var viewController: DashboardDisplayLogic?
        private var viewModel : Dashboard.ViewModel = Dashboard.ViewModel()

        func fetched(user: ServiceResult<UserResponse>) {
            switch user {
            case .success(let value):
                viewModel.user = User.init(object: value)
                viewController?.show(error: self.viewModel)
            case .failure(let error):
                viewModel.message = error.localizedDescription
                viewController?.show(error: self.viewModel)
            }

        }

        func fetched(repos: ServiceResult<RepoResponse>) {
            switch repos {
            case .success(let value):
                //viewModel.repos = RepoResponse.init(object: value)
                viewController?.show(error: self.viewModel)
            case .failure(let error):
                viewModel.message = error.localizedDescription
                viewController?.show(error: self.viewModel)
            }
        }

    }

}
