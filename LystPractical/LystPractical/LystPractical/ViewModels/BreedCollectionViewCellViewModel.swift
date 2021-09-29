//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import Foundation

final class BreedCollectionViewCellViewModel {
    
    var breedModel: BreedModel
    
    init(breedModel: BreedModel) {
        self.breedModel = breedModel
    }
    
    var image: URL? {
        URL(string: self.breedModel.image?.url ?? "")
    }
    
    var name: String {
        self.breedModel.name ?? ""
    }
}
