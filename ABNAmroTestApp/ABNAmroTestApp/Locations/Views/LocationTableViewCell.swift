//
//  LocationTableViewCell.swift
//  ABNAmroTestApp
//
//  Created by Vishal on 7/4/21.
//

import UIKit

final class LocationTableViewCell: UITableViewCell {
    
    func configure(with viewModel: LocationsCellViewModel) {
        self.textLabel?.attributedText = NSMutableAttributedString().bold(viewModel.name)
        self.detailTextLabel?.attributedText = detailsText(viewModel)
    }
    
    func detailsText(_ viewModel: LocationsCellViewModel) -> NSMutableAttributedString {
        return NSMutableAttributedString().bold("Lat: ").normal("\(viewModel.lat)").normal(" | ").bold("Long: ").normal("\(viewModel.long)")
    }
}
