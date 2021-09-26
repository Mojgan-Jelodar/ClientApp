//
//  DashboardWorkerSpec.swift
//  GitClientTests
//
//  Created by Mozhgan on 9/26/21.
//

import Quick
import Nimble
import Combine

@testable import GitClientTDD

class DashboardWorkerSpec: QuickSpec {
    override func spec() {
        var profileWorker : UserManager
        var repoWorker : RepoManager
        var describer = Set<AnyCancellable>()
        var networkStub: Stub!
        beforeEach {
           profileWorker = MoyaUserManager()
           repoWorker = MoyaRepoManager()
        }
        afterEach {
            profileWorker = nil
            repoWorker = nil
        }
        self.fetchUserProfile()
        self.fetchRepos()
    }

}
extension DashboardWorkerSpec {
    func fetchUserProfile() {
        describe("fetch user data") {
            var actualUser: User?
            var fetchError: Error?

            beforeEach {
                profileWorker.getProfile().sink(receiveCompletion : { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        error = fetchError
                    }
                }, receiveValue: { response in
                    actualUser = response
                }).store(in: &describer)

            }
            it("should display the fetched user name", closure: {
                // then
                expect(actual.name).toEventually(equal(Seeds.User.name))
            })
            it("should display the fetched user email", closure: {
                // then
                expect(actual.email).toEventually(equal(Seeds.User.email))
            })
        }
    }

    func fetchRepos() {
        describe("fetch repos data") {
            var actualRepos: ReposResponse?
            var fetchError: Error?

            beforeEach {
                repoWorker.getRepos(params: RepoRequest(username: "mozhgan")).sink(receiveCompletion : { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        error = fetchError
                    }
                }, receiveValue: { response in
                    actualUser = response
                }).store(in: &describer)

            }
            it("should display the fetched first repo name", closure: {
                // then
                expect(actualRepos?.first?.name).toEventually(equal(Seeds.Repo.name))
            })
            it("should display the fetched first repo id", closure: {
                // then
                expect(actualRepos?.first?.id).toEventually(equal(Seeds.Repo.id))
            })
        }
    }
}
