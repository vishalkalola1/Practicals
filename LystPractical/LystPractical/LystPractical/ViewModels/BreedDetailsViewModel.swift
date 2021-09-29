//
//  BreedDetailsViewModel.swift
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import Foundation

protocol BreedDetailsViewModelType {
    var image: String { get }
    var name: String { get }
    var catid: String { get }
    var description: String { get }
    var nature: String { get }
    var weight: String { get }
    var lifeSpan: String { get }
    var energyLevel: Int { get }
    var wikipediaURL: String { get }
}

class BreedDetailsViewModel: BreedDetailsViewModelType {
    
    private var breedSevices : BreedServicesType
    private var coordinator: BreedDetailsCoordinator
    private var breed: BreedModel
    
    init(breedSevices: BreedServicesType = BreedServices.shared, coordinator: BreedDetailsCoordinator, breed: BreedModel) {
        self.breedSevices = breedSevices
        self.coordinator = coordinator
        self.breed = breed
    }
    
    var image: String {
        return breed.image?.url ?? ""
    }
    
    var name: String {
        return breed.name ?? ""
    }
    
    var catid: String {
        return breed.id ?? ""
    }
    
    var description: String {
        return breed.description ?? ""
    }
    
    var nature: String {
        return breed.temperament ?? ""
    }
    
    var energyLevel: Int {
        return breed.energyLevel ?? 0
    }
    
    var weight: String {
        return breed.weight?.imperial ?? ""
    }
    
    var lifeSpan: String {
        return breed.lifeSpan ?? ""
    }
    
    var wikipediaURL: String {
        return breed.wikipediaURL ?? ""
    }
}
