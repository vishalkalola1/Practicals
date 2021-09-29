//
//  RecordingsCollectionViewCell.swift
//  MobileChallenge
//
//  Created by Vishal on 6/13/21.
//

import UIKit

class RecordingsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recordingImage: UIImageView!
    @IBOutlet weak var recordingName: UILabel!
    @IBOutlet weak var view: UIStackView!
    
    func fillData(_ recordings: RecordingsViewModel) -> Void {
        recordingName.text = recordings.title
        recordingImage.image = recordings.title.first?.image
        self.view.layer.borderColor = UIColor.random().cgColor
        self.view.layer.borderWidth = 2.0
        self.view.layer.cornerRadius = 20.0
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
