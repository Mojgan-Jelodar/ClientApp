//
//  DashboardWorkerSpec.swift
//  GitClientTests
//
//  Created by Mozhgan on 9/26/21.
//

import Quick
import Nimble
import Mockingjay

@testable import GitClient
class DashboardWorkerSpec: QuickSpec {
    override func spec() {
        var sut : UserManager
        var networkStub: Stub!
        beforeEach {
            setupWorker()
        }
        
        afterEach {
            removeNetworkStub()
            sut = nil
        }
        
        
        describe("fetch user data") {
            typealias UserData = (name: String?, email: String?)
            var actual: UserData = ("", "")

            beforeEach {
                // given
                stubNetwork(as: ["name": Seeds.name, "email": Seeds.email])
                
                // when
                sut.fetchUserData(completion: { (name, email) in
                    actual.name = name
                    actual.email = email
                })
            }
            
            it("should display the fetched user name", closure: {
                // then
                expect(actual.name).toEventually(equal(Seeds.name))
            })

            it("should display the fetched user email", closure: {
                // then
                expect(actual.email).toEventually(equal(Seeds.email))
            })
        }
        
        
        
        
        
    }
    
}
// MARK: - Test Helpers
extension DashboardWorkerSpec {
   
    
    func setupWorker() {
        sut = MainWorker()
    }
    
    func stubNetwork(as response: [String: String] = [:], status: Int = 200) {
        networkStub = stub(everything, json(response, status: status))
    }
    
    func removeNetworkStub() {
        if let stub = networkStub {
            removeStub(stub)
            networkStub = nil
        }
    }
}
