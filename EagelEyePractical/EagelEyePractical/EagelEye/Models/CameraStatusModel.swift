//
//  CameraStatusModel.swift
//  CameraStatusModel
//
//  Created by Vishal on 7/21/21.
//

import Foundation

struct CameraStatusModel: Codable {
    let cameraId: Int?
    let online: Bool?
    let recordingOnCloud: Bool?
    let recordingOnSd: Bool?
    let audioEnabled: Bool?
    let passwordKnown: Bool?
    let passwordStatus: String?
    let firmwareStatus: String?
    let connectionType: String?
    let lastConnectionResult: String?
}
