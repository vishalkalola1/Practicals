//
//  TagsCollectionViewCell.swift
//  MobileChallenge
//
//  Created by Vishal on 6/14/21.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recordingName: UILabel!
    @IBOutlet weak var view: UIStackView!
    
    func fillData(_ tagsViewModel: TagsViewModel) -> Void {
        recordingName.text = tagsViewModel.name
        self.view.layer.borderColor = UIColor.random().cgColor
        self.view.layer.borderWidth = 2.0
        self.view.layer.cornerRadius = 20.0
    }
}
