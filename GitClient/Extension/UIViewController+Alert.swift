//
//  File.swift
//  GitClient
//
//  Created by Mozhgan on 9/25/21.
//

import UIKit
extension  UIViewController {
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { _ in
        })
        let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { _ in
        })
        alert.addAction(ok)
        alert.addAction(cancel)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
}
