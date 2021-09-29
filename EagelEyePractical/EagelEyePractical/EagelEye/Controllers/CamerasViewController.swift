//
//  CamerasViewController.swift
//  EagelEyePractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

class CamerasViewController: UIViewController {

    var viewModel: CamerasViewModelType?
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        hideNavigationBack()
        toggleNavigation(false)
        DispatchQueue.main.async {
            self.getCameras()
        }
    }
    
    private func hideNavigationBack() {
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func toggleNavigation(_ isHidden: Bool){
        self.navigationController?.navigationBar.isHidden = isHidden
    }
    
    private func registerCells(){
        let cameraCellNib = String(describing: CameraTableViewCell.self)
        tableView.register(UINib(nibName: cameraCellNib, bundle: .main), forCellReuseIdentifier: cameraCellNib)
    }
    
    @IBAction private func logout() {
        toggleNavigation(true)
        viewModel?.logout()
    }
    
    private func getCameras() {
        showLoader()
        viewModel?.getCameras { error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.hideLoader(completion: nil)
                if let error = error {
                    self.showAlert(title: "Error", message: error)
                } else {
                    self.tableView.reloadData()
                }
            })
        }
    }
}

extension CamerasViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.camera(didSelectAt: indexPath.row)
    }
}

extension CamerasViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifire = String(describing: CameraTableViewCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire) as? CameraTableViewCell else { return UITableViewCell() }
        let cameraTableCellViewModel = viewModel!.camera(at: indexPath.row)
        cell.config(cameraTableCellViewModel)
        return cell
    }
}

