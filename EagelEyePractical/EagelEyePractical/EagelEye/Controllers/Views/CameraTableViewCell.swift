//
//  CameraTableViewCell.swift
//  EagelEyePractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

final class CameraTableViewCell: UITableViewCell {

    @IBOutlet private weak var backgroundViews: UIView!
    @IBOutlet private weak var cameraIdLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var deviceTypeIdLabel: UILabel!
    @IBOutlet private weak var ethMacAddressLabel: UILabel!
    @IBOutlet private weak var zoneIdLabel: UILabel!
    @IBOutlet private weak var accountIdLabel: UILabel!
    
    func config(_ viewModel: CameraTableCellViewModel) {
        cameraIdLabel.attributedText = viewModel.cameraId
        nameLabel.attributedText = viewModel.name
        deviceTypeIdLabel.attributedText = viewModel.deviceTypeId
        ethMacAddressLabel.attributedText = viewModel.ethMacAddress
        zoneIdLabel.attributedText = viewModel.zoneId
        accountIdLabel.attributedText = viewModel.accountId
    }
}
