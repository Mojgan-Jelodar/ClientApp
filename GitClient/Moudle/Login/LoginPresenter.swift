//
//  LoginPresenter.swift
//  GitClient
//
//  Created by Mozhgan on 9/25/21.
//

import Foundation
protocol  LoginPresentationLogic : AnyObject {
    func fetched(accessToken: ServiceResult<AccessTokenResponse>)
}

protocol LoginDisplayLogic : AnyObject {
    func show(error : Login.ViewModel)
    func fetched(token : Login.ViewModel)
}

extension Login {
    final class Presenter  : LoginPresentationLogic {
        weak var viewcontroller : LoginDisplayLogic?
        var viewModel = Login.ViewModel()
        func fetched(accessToken: ServiceResult<AccessTokenResponse>) {
            switch accessToken {
            case .failure(let error):
                viewModel.message = error.localizedDescription
                viewcontroller?.show(error: viewModel)
            case .success(let value):
                viewModel.token = value.asccessToken
                viewcontroller?.fetched(token: viewModel)
            }
        }
    }
}
