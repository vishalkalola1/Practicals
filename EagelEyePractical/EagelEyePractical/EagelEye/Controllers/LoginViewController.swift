//
//  LoginViewController.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.

import UIKit

final class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModelType?
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionLogin(_ sender: UIButton) {
        if txtUsername.text == "" {
            print("Please enter username")
        } else if txtPassword.text == "" {
            print("Please enter password")
        } else {
            login()
        }
    }
    
    private func login() {
        let username = self.txtUsername.text!
        let password = self.txtPassword.text!
        self.showLoader()
        viewModel?.authentication(username, password: password){ error in
            DispatchQueue.main.async {
                self.hideLoader {
                    if let error = error {
                        self.showAlert(title: "Error", message: error)
                    } else {
                        self.viewModel?.moveToHome()
                    }
                }
            }
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
