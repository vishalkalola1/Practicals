//
//  PlayerViewModel.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import UIKit

protocol PlayerViewModelType: AnyObject  {
    var url: String { get }
    func stopWatch()
    func stopSession()
    func pop()
}

final class PlayerViewModel: PlayerViewModelType {

    var watchModel : WatchModel
    private var playerServices: PlayerServicesType
    private var appCoordinator: AppCoordinator
    
    init(watchModel: WatchModel, playerServices: PlayerServicesType = PlayerServices.shared, appCoordinator: AppCoordinator) {
        self.watchModel = watchModel
        self.playerServices = playerServices
        self.appCoordinator = appCoordinator
    }
    
    var url: String {
        watchModel.stream?.url ?? ""
    }
    
    /**
     * Name: StopChannelAPI
     * Params:  completion
     * Return `reloadView`
     */
    func stopWatch() {
        self.playerServices.stopChannel(completion: { results in
            switch results {
            case .success(let watchModel):
                self.watchModel = watchModel
                break;
            case .failure(_):
                break;
            }
        })
    }
    
    /**
     * Name: stopSession
     * Params:  completion
     * Return `reloadView`
     */
    func stopSession() {
        self.playerServices.stopSession{ results in
            switch results {
            case .success(_):
                break;
            case .failure(_):
                break;
            }
        }
    }
    
    func pop() {
        appCoordinator.pop()
    }
}
