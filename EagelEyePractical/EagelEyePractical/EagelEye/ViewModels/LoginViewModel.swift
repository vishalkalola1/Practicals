//
//  LoginViewModel.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import Foundation

protocol LoginViewModelType {
    func authentication(_ username: String, password: String, completion: @escaping reloadView)
    func moveToHome()
}

class LoginViewModel: LoginViewModelType {
    
    private var loginServices : LoginServicesType
    private var loginCoordinator: LoginCoordinatorType
    var sessionModel : SessionModel?
    
    init(loginServices: LoginServicesType = LoginServices.shared, loginCoordinator: LoginCoordinatorType) {
        self.loginServices = loginServices
        self.loginCoordinator = loginCoordinator
    }
    
    /**
     * Name: authentication
     * Params:  credentials, completion
     * Return `reloadView`
     */
    func authentication(_ username: String, password: String, completion: @escaping reloadView) {
        self.loginServices.login(username, password: password) { results in
            switch results {
            case .success(let sessionModel):
                UserDefaults.standard.token = sessionModel.token
                self.sessionModel = sessionModel
                completion(nil)
                break;
            case .failure(let error):
                completion(error.localizedDescription)
            }
        }
    }
    
    func moveToHome() {
        loginCoordinator.navigateToCameraCoordinate()
    }
}
