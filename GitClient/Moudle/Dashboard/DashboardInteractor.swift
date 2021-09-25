//
//  DashboardInteractor.swift
//  GitClient
//
//  Created by Mozhgan on 9/23/21.
//

import Foundation
import Combine

protocol DashboardBusinessLogic {
    func getUserProfile()
    func getAllPublicRepos()
}

protocol DashboardDataStore {
    var repo : Repo? {get set}
}
extension Dashboard {
    final class Interactor : DashboardBusinessLogic,DashboardDataStore {
        var repo: Repo?

        private var userManager : UserManager?
        private var repoManager : RepoManager?
        private var presenter : DashboardPresentationLogic?

        private var subscriber = Set<AnyCancellable>()

        init(userManager : UserManager,
             repoManager : RepoManager,
             presenter : DashboardPresentationLogic) {
            self.presenter = presenter
            self.userManager = userManager
            self.repoManager = repoManager
        }

        func getUserProfile() {
            userManager?.getProfile().sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.presenter?.fetched(user: .failure(error: error))
                }

            }, receiveValue: { [weak self] response in
                self?.presenter?.fetched(user: .success(value: response))
            }).store(in: &subscriber)

        }
        func getAllPublicRepos() {
            repoManager?.getRepos().sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.presenter?.fetched(repos: .failure(error: error))
                }
            }, receiveValue: { [weak self] response in
                self?.presenter?.fetched(repos: .success(value: response))
            }).store(in: &subscriber)
        }
    }

}
//extension Dashboard.Interactor : DashboardDataStore {
//    var user: User? {
//        get {
//
//        }
//        set {
//
//        }
//    }
//
//    var repo: [Repo] {
//        get {
//
//        }
//        set {
//
//        }
//    }
//
//
//}
