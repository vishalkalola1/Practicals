//
//  CameraViewModel.swift
//  EagelEyePractical
//
//  Created by Vishal on 7/20/21.
//

import Foundation

protocol CameraViewModelType {
    var cameraId: Int? { get }
    var name: String? { get }
    var deviceTypeId: Int? { get }
    var ethMacAddress: String? { get }
    var zoneId: Int? { get }
    var accountId: Int? { get }
    
    var online: Bool? { get }
    var recordingOnCloud: Bool? { get }
    var recordingOnSd: Bool? { get }
    var audioEnabled: Bool? { get }
    var passwordKnown: Bool? { get }
    var passwordStatus: String? { get }
    var firmwareStatus: String? { get }
    var connectionType: String? { get }
    var lastConnectionResult: String? { get }
    
    func cameraStatus(_ completion: @escaping reloadView)
}

class CameraViewModel: CameraViewModelType {
    
    private var cameraServices : CameraServicesType
    private var cameraCoordinator: CameraCoordinator
    private var cameraModel: CameraModel
    private var cameraStatus: CameraStatusModel?
    
    init(cameraServices: CameraServicesType = CameraServices.shared, cameraCoordinator: CameraCoordinator, cameraModel: CameraModel) {
        self.cameraServices = cameraServices
        self.cameraCoordinator = cameraCoordinator
        self.cameraModel = cameraModel
    }
    
    var cameraId: Int? {
        cameraModel.cameraId
    }
    
    var name: String? {
        cameraModel.name
    }
    
    var deviceTypeId: Int? {
        cameraModel.deviceTypeId
    }
    
    var ethMacAddress: String? {
        cameraModel.ethMacAddress
    }
    
    var zoneId: Int? {
        cameraModel.zoneId
    }
    
    var accountId: Int? {
        cameraModel.accountId
    }
    
    var online: Bool? {
        cameraStatus?.online
    }
    
    var recordingOnCloud: Bool? {
        cameraStatus?.recordingOnCloud
    }
    
    var recordingOnSd: Bool? {
        cameraStatus?.recordingOnSd
    }
    
    var audioEnabled: Bool? {
        cameraStatus?.audioEnabled
    }
    
    var passwordKnown: Bool? {
        cameraStatus?.passwordKnown
    }
    
    var passwordStatus: String? {
        cameraStatus?.passwordStatus
    }
    
    var firmwareStatus: String? {
        cameraStatus?.firmwareStatus
    }
    
    var connectionType: String? {
        cameraStatus?.connectionType
    }
    
    var lastConnectionResult: String? {
        cameraStatus?.lastConnectionResult
    }
    
    
    func cameraStatus(_ completion: @escaping reloadView) {
        guard let id = cameraModel.cameraId else { return }
        cameraServices.cameraStatus("\(id)") { results in
            switch results {
            case .success(let cameraStatus):
                self.cameraStatus = cameraStatus
                completion(nil)
                break;
            case .failure(let error):
                completion(error.localizedDescription)
                break;
            }
        }
    }
}
