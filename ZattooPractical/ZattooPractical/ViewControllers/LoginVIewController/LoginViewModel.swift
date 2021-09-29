//
//  LoginViewModel.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import Foundation

typealias reloadView = (_ error: String?) -> Void

protocol LoginViewModelType {
    func authentication(_ credentials:[String:String], completion: @escaping reloadView)
    func startSession(_ sessionBody:[String:String], completion: @escaping reloadView)
    func startWatch(completion: @escaping reloadView)
    func startVideo()
}


class LoginViewModel: LoginViewModelType {
    
    private var loginServices : LoginServices
    private var appCoordinator: AppCoordinator
    var sessionModel : SessionModel?
    var watchModel: WatchModel?
    
    init(loginServices: LoginServices = .shared, appCoordinator: AppCoordinator) {
        self.loginServices = loginServices
        self.appCoordinator = appCoordinator
    }
    
    /**
     * Name: authentication
     * Params:  credentials, completion
     * Return `reloadView`
     */
    func authentication(_ credentials:[String:String], completion: @escaping reloadView){
        self.loginServices.login(credentials) { results in
            switch results {
            case .success(let sessionModel):
                self.sessionModel = sessionModel
                completion(nil)
                break;
            case .failure(let error):
                completion(error.localizedDescription)
            }
        }
    }
    
    /**
     * Name: startSession
     * Params:  sessionBody, completion
     * Return `reloadView`
     */
    func startSession(_ sessionBody:[String:String], completion: @escaping reloadView) {
        self.loginServices.startSession(sessionBody) { results in
            switch results {
            case .success(let sessionModel):
                self.sessionModel = sessionModel
                completion(nil)
                break;
            case .failure(let error):
                completion(error.localizedDescription)
                break;
            }
        }
    }
    
    /**
     * Name: startWatch
     * Params:  completion
     * Return `reloadView`
     */
    func startWatch(completion: @escaping reloadView) {
        let watchBody = [
            "cid":"dsf",
            "stream_type":"hls7"
        ]
        self.loginServices.startChannel(watchBody){ results in
            switch results {
            case .success(let watchModel):
                self.watchModel = watchModel
                completion(nil)
                break;
            case .failure(let error):
                completion(error.localizedDescription)
            }
        }
    }
    
    /**
     * Name: StartVideo
     */
    func startVideo() {
        guard let watchModel = watchModel else { return }
        let playerViewModel = PlayerViewModel(watchModel: watchModel, appCoordinator: appCoordinator)
        self.appCoordinator.VideoPlayer(playerViewModel: playerViewModel)
    }
}
