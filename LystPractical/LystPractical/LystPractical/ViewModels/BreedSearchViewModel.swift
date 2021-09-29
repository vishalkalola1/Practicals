//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import Foundation

typealias reloadView = (_ error: String?) -> Void

protocol BreedSearchViewModelType {
    var numberOfSections: Int { get }
    var numberOfRows: Int { get }
    func breeds(_ completion: @escaping reloadView)
    func breed(at index: Int) -> BreedCollectionViewCellViewModel
    func breed(didSelectAt index: Int)
    func searchBreed(_ text: String, completion: @escaping reloadView)
}

class BreedSearchViewModel: BreedSearchViewModelType {
    
    private var services: BreedServicesType
    private var coordinator: BreedSearchCoordinatorType
    private var breeds: [BreedModel] = []
    var filterBreed: [BreedModel] = []
    
    init(services: BreedServicesType = BreedServices.shared, coordinator: BreedSearchCoordinatorType) {
        self.services = services
        self.coordinator = coordinator
    }
    
    var numberOfRows: Int {
        filterBreed.count
    }
    
    var numberOfSections: Int {
        1
    }
    
    /**
     * Name: authentication
     * Params:  credentials, completion
     * Return `reloadView`
     */
    func breeds(_ completion: @escaping reloadView) {
        self.services.breed() { results in
            switch results {
            case .success(let breeds):
                self.breeds = breeds
                self.filterBreed = breeds
                completion(nil)
                break;
            case .failure(let error):
                completion(error.localizedDescription)
                break;
            }
        }
    }
    
    func breed(at index: Int) -> BreedCollectionViewCellViewModel {
        let breed = filterBreed[index]
        return BreedCollectionViewCellViewModel(breedModel: breed)
    }
    
    func breed(didSelectAt index: Int) {
        let breed = filterBreed[index]
        coordinator.navigateToBreedDetailsCoordinator(breed)
    }
    
    func searchBreed(_ text: String, completion: @escaping reloadView) {
        if text != "" {
            filterBreed = breeds.filter { breed in
                return breed.name?.lowercased().contains(text.lowercased()) ?? false
            }
        } else {
            filterBreed = breeds
        }
        
        completion(nil)
    }
}
