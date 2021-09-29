//
//  LoginViewController.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.

import UIKit

final class LoginViewController: UIViewController {
    
    var loginViewModel : LoginViewModelType?
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func actionLogin(_ sender: UIButton) {
        if txtUsername.text == "" {
            print("Please enter username")
        } else if txtPassword.text == "" {
            print("Please enter password")
        } else {
            startSession()
        }
    }
    
    private func login() {
        let credentials = ["login":self.txtUsername.text!,
                           "password":self.txtPassword.text!]
        self.loginViewModel?.authentication(credentials){ error in
            if let error = error {
                print("🤬🤬🤬", error)
            } else {
                self.watch()
            }
        }
    }
    
    private func startSession() {
        let session = [
            "app_tid" : "8a302808-6433-4960-967c-920192a835be",
            "uuid" : "\(UUID())",
            "lang":"en",
            "format":"json"
        ]
        loginViewModel?.startSession(session) { error in
            if let error = error {
                print("🤬🤬🤬", error)
            } else {
                DispatchQueue.main.async {
                    self.login()
                }
            }
        }
    }
    
    private func watch(){
        loginViewModel?.startWatch { error in
            if let error = error {
                print("🤬🤬🤬", error)
            }else{
                print("📶📶📶 Streaming Watch Start 📶📶📶")
                DispatchQueue.main.async {
                    self.loginViewModel?.startVideo()
                }
            }
        }
    }
}
