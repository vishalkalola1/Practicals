//
//  LoginViewModel.swift
//  ZattooPractical
//
//  Created by Vishal on 7/2/21.
//

import Foundation

typealias reloadView = (_ error: String?) -> Void

protocol CamerasViewModelType {
    var numberOfSections: Int { get }
    var numberOfRows: Int { get }
    func getCameras(_ completion: @escaping reloadView)
    func camera(at index: Int) -> CameraTableCellViewModel
    func camera(didSelectAt index: Int)
    func logout()
}

class CamerasViewModel: CamerasViewModelType {
    
    private var cameraServices: CameraServicesType
    private var coordinator: CamerasCoordinatorType
    private var cameras: [CameraModel] = []
    
    init(cameraServices: CameraServicesType = CameraServices.shared, coordinator: CamerasCoordinatorType) {
        self.cameraServices = cameraServices
        self.coordinator = coordinator
    }
    
    var numberOfRows: Int {
        cameras.count
    }
    
    var numberOfSections: Int {
        1
    }
    
    /**
     * Name: authentication
     * Params:  credentials, completion
     * Return `reloadView`
     */
    func getCameras(_ completion: @escaping reloadView) {
        self.cameraServices.cameras{ results in
            switch results {
            case .success(let cameras):
                self.cameras = cameras
                completion(nil)
                break;
            case .failure(let error):
                completion(error.localizedDescription)
                break;
            }
        }
    }
    
    func camera(at index: Int) -> CameraTableCellViewModel {
        let camera = cameras[index]
        return CameraTableCellViewModel(cameraModel: camera)
    }
    
    func camera(didSelectAt index: Int) {
        let camera = cameras[index]
        coordinator.navigateToCameraCoordinate(camera)
    }
    
    func getCamera(using id:String, completion: @escaping reloadView) {
        self.cameraServices.cameras{ results in
            switch results {
            case .success(let cameras):
                self.cameras = cameras
                completion(nil)
                break;
            case .failure(let error):
                completion(error.localizedDescription)
                break;
            }
        }
    }
    
    func logout() {
        UserDefaults.standard.token = nil
        coordinator.pop()
    }
}
