//
//  ViewController.swift
//  RaboBankPractical
//
//  Created by Vishal on 7/13/21.
//

import UIKit

final class MemberProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: PersonsViewModelType! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    private enum Constants {
        static let memberProfiles = "Member Profiles"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Constants.memberProfiles
    }
    
    @IBAction private func pickAction(_ sender: UIButton) {
        attachDocument()
    }
    
    private func attachDocument() {
        viewModel.openDocumentViewController(self)
    }
}

extension MemberProfileViewController: UIDocumentPickerDelegate, UINavigationControllerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let url = urls.first else { return }
        DispatchQueue.global(qos: .background).async { [self] in
            self.viewModel.fetchMemberProfiles(url)
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension MemberProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows > 0 ? tableView.restore() : tableView.setEmptyMessage("🚫 No issues with member profiles 🚫 \n\n Choose a new CSV file by tapping Pick ☝️")
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifire = String(describing: MemberTableViewCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifire) as? MemberTableViewCell else { return UITableViewCell() }
        let memberViewModel = viewModel.member(at: indexPath)
        cell.config(memberViewModel)
        return cell
    }
}

extension MemberProfileViewController: RefreshViewDelegate {
    
    func load() {
        DispatchQueue.main.async {
            self.showLoader()
        }
    }
    
    func refresh() {
        DispatchQueue.main.async {
            self.hideLoader {
                self.tableView.reloadData()
            }
        }
    }
    
    func error(_ error: Error) {
        DispatchQueue.main.async {
            self.hideLoader {
                self.showAlert(title: "error", message: error.localizedDescription)
            }
        }
    }
}


