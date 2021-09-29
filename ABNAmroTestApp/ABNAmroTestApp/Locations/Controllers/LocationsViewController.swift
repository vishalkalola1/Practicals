//
//  LocationsViewController.swift
//  ABNAmroTestApp
//
//  Created by Vishal on 7/3/21.
//

import UIKit

final class LocationsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    var viewModel: LocationsViewModelType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        loadJsonData()
    }
    
    private func loadJsonData() {
        do {
            guard let data = try viewModel.readFile() else { return }
            try viewModel.loadJson(data: data)
        } catch let error {
            fatalError(error.localizedDescription)
        }
    }
    
    @IBAction private func addNewLocation(_ sender: UIBarButtonItem) {
        viewModel.navigateToAddLocation()
    }
}

extension LocationsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "LocationCell") as? LocationTableViewCell
        if cell == nil {
            cell = LocationTableViewCell(style: .subtitle, reuseIdentifier: "LocationCell")
        }
        let locationCellViewModel = viewModel.location(at: indexPath)!
        cell.configure(with: locationCellViewModel)
        return cell
    }
}

extension LocationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.location(didSelectAt: indexPath)
    }
}

extension LocationsViewController: RefreshViewDelegate {
    
    func reload() {
        tableView.reloadData()
    }
}

extension NSMutableAttributedString {
    
    var fontSize: CGFloat { return 14 }
    var boldFont: UIFont { return UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont: UIFont { return UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}



