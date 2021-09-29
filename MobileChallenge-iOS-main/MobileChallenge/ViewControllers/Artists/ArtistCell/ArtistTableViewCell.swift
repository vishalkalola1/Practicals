//
//  ArtistTableViewCell.swift
//  MobileChallenge
//
//  Created by Vishal on 6/11/21.
//

import UIKit

protocol ArtistTableCellProtocol: AnyObject {
    func favouriteClicked(_ sender: UIButton)
}

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    weak var delegate: ArtistTableCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        artistImage.layer.cornerRadius = 25
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillData(_ viewModel: ArtistTableCellModelView, index: Int) {
        nameLabel.text = viewModel.name
        detailsLabel.text = viewModel.disambiguation
        artistImage.image = viewModel.name.first?.image
        favoriteButton.tag = index
        favoriteButton.isSelected = viewModel.checkFavourite
    }
    
    
    @IBAction func favouriteAction(_ sender: UIButton) {
        delegate?.favouriteClicked(sender)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

extension Character {
    var image: UIImage? {
         let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
         let nameLabel = UILabel(frame: frame)
         nameLabel.textAlignment = .center
         nameLabel.backgroundColor = .random()
         nameLabel.textColor = .white
         nameLabel.font = UIFont.boldSystemFont(ofSize: 50)
         nameLabel.text = "\(self)"
         UIGraphicsBeginImageContext(frame.size)
          if let currentContext = UIGraphicsGetCurrentContext() {
             nameLabel.layer.render(in: currentContext)
             let nameImage = UIGraphicsGetImageFromCurrentImageContext()
             return nameImage
          }
          return nil
    }
}
