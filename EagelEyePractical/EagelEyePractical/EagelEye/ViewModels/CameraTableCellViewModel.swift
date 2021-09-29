//
//  CameraTableCellViewModel.swift
//  EagelEyePractical
//
//  Created by Vishal on 7/20/21.
//

import Foundation

final class CameraTableCellViewModel {
    
    var cameraModel: CameraModel
    
    init(cameraModel: CameraModel) {
        self.cameraModel = cameraModel
    }
    
    var cameraId: NSMutableAttributedString {
        NSMutableAttributedString().bold("Camera ID: ").normal("\(cameraModel.cameraId ?? 0)")
    }
    
    var name: NSMutableAttributedString {
        NSMutableAttributedString().bold(cameraModel.name ?? "", fontSize: 20)
    }
    
    var deviceTypeId: NSMutableAttributedString {
        NSMutableAttributedString().bold("Type ID: ").normal("\(cameraModel.deviceTypeId ?? 0)")
    }
    
    var ethMacAddress: NSMutableAttributedString {
        NSMutableAttributedString().bold(cameraModel.ethMacAddress ?? "", fontSize: 20)
    }
    
    var zoneId: NSMutableAttributedString {
        NSMutableAttributedString().bold("Zone ID: ").normal("\(cameraModel.zoneId ?? 0)")
    }
    
    var accountId: NSMutableAttributedString {
        NSMutableAttributedString().bold("Account ID: ").normal("\(cameraModel.accountId ?? 0)")
    }
}
