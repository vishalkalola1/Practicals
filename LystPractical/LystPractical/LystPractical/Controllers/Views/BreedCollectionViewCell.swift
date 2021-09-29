//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit
import SDWebImage

final class BreedCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func config(_ viewModel: BreedCollectionViewCellViewModel) {
        imageView.loadImage(urlString: viewModel.image?.absoluteString ?? "")
        nameLabel.text = viewModel.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}

extension UIImageView {
    func loadImage(urlString: String) {
        let url = URL(string: urlString)
        self.sd_setImage(with:url, placeholderImage: UIImage(named: "cat"))
    }
}
