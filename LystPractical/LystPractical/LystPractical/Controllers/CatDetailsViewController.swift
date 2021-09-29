//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit
import RatingsView

class CatDetailsViewController: UIViewController {

    var viewModel: BreedDetailsViewModel?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var starView: RatingBar!
    @IBOutlet private weak var catIdLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var lifeSpanLabel: UILabel!
    @IBOutlet private weak var natureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    private func loadData() {
        
        guard let viewModel = viewModel else {
            return
        }
        
        imageView.loadImage(urlString: viewModel.image)
        nameLabel.text = viewModel.name
        catIdLabel.attributedText = NSMutableAttributedString().bold("id: \(viewModel.catid)")
        descriptionLabel.attributedText = NSMutableAttributedString().normal(viewModel.description)
        weightLabel.text = viewModel.weight + " kgs"
        lifeSpanLabel.text = viewModel.lifeSpan + " Average life span"
        natureLabel.attributedText = NSMutableAttributedString().normal(viewModel.nature)
        starView.value = CGFloat(viewModel.energyLevel)
    }
    
    @IBAction func wikipediaAction(_ sender: UIButton) {
        guard let viewModel = viewModel else {
            return
        }
        if let url = URL(string: viewModel.wikipediaURL) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
