//
//  CameraDetailsViewController.swift
//  EagelEyePractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

class CameraDetailsViewController: UIViewController {

    var viewModel: CameraViewModelType?
    
    @IBOutlet private weak var cameraIdLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var deviceTypeIdLabel: UILabel!
    @IBOutlet private weak var ethMacAddressLabel: UILabel!
    @IBOutlet private weak var zoneIdLabel: UILabel!
    @IBOutlet private weak var accountIdLabel: UILabel!

    ///Camera Status
    @IBOutlet private weak var onlineLabel: UILabel!
    @IBOutlet private weak var recordingOnCloudLabel: UILabel!
    @IBOutlet private weak var recordingOnSdLabel: UILabel!
    @IBOutlet private weak var audioEnabledLabel: UILabel!
    @IBOutlet private weak var passwordKnownLabel: UILabel!
    @IBOutlet private weak var passwordStatusLabel: UILabel!
    @IBOutlet private weak var firmwareStatusLabel: UILabel!
    @IBOutlet private weak var connectionTypeLabel: UILabel!
    @IBOutlet private weak var lastConnectionResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.fetchCameraStatus()
        }
    }
    
    private func fetchCameraStatus() {
        showLoader()
        viewModel?.cameraStatus { error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.hideLoader {
                    if let error = error {
                        self.showAlert(title: "Error", message: error)
                    } else {
                        self.loadData()
                    }
                }
            })
        }
    }
    
    private func loadData() {
        
        guard let viewModel = viewModel else {
            return
        }
        
        cameraIdLabel.attributedText = NSMutableAttributedString().bold("Camera ID: ").normal("\(viewModel.cameraId ?? 0)")
        nameLabel.attributedText = NSMutableAttributedString().bold("Camera Name: ").normal(viewModel.name ?? "")
        deviceTypeIdLabel.attributedText = NSMutableAttributedString().bold("Type ID: ").normal("\(viewModel.deviceTypeId ?? 0)")
        ethMacAddressLabel.attributedText = NSMutableAttributedString().bold("Ethernet Address: ").normal("\(viewModel.ethMacAddress ?? "")")
        zoneIdLabel.attributedText = NSMutableAttributedString().bold("Zone ID: ").normal("\(viewModel.zoneId ?? 0)")
        accountIdLabel.attributedText = NSMutableAttributedString().bold("Account ID: ").normal("\(viewModel.accountId ?? 0)")
        
        
        onlineLabel.attributedText = NSMutableAttributedString().bold("Camera Status: ").normal((viewModel.online ?? false) ? "Online":"Offline")
        recordingOnCloudLabel.attributedText = NSMutableAttributedString().bold("Cloud Recording: ").normal(isEnable(viewModel.recordingOnCloud))
        recordingOnSdLabel.attributedText = NSMutableAttributedString().bold("SD Recording: ").normal(isEnable(viewModel.recordingOnSd))
        audioEnabledLabel.attributedText = NSMutableAttributedString().bold("Audio Enable: ").normal(isEnable(viewModel.audioEnabled))
        passwordKnownLabel.attributedText = NSMutableAttributedString().bold("Password Known: ").normal(isEnable(viewModel.passwordKnown))
        passwordStatusLabel.attributedText = NSMutableAttributedString().bold("Password Status: ").normal(viewModel.passwordStatus ?? "")
        firmwareStatusLabel.attributedText = NSMutableAttributedString().bold("Firmware Status: ").normal(viewModel.firmwareStatus ?? "")
        connectionTypeLabel.attributedText = NSMutableAttributedString().bold("Connection Type: ").normal(viewModel.connectionType ?? "")
        lastConnectionResultLabel.attributedText = NSMutableAttributedString().bold("Last Connection Status: ").normal(viewModel.lastConnectionResult ?? "")
    }
    
    func isEnable(_ status: Bool?) -> String {
        guard let status = status else {
            return "No"
        }
        return status ? "Yes" : "No"
    }
}
