//
//  LoginViewController.swift
//  GitClient
//
//  Created by Mozhgan on 9/25/21.
//

import UIKit
import SafariServices

class LoginVC: SFSafariViewController {
    var router : (LoginRouterDataPassing & LoginRouterLogic)?
    var interactor : (LoginBusinessLogic & LoginDataStore)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension LoginVC : LoginDisplayLogic {
    func show(error: Login.ViewModel) {
        self.router?.show(message: error.message ?? "")

    }

    func fetched(token: Login.ViewModel) {
        self.router?.navigateToDashboard()
    }
}
