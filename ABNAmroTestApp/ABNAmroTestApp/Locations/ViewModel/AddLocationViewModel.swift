//
//  AddLocationViewModel.swift
//  ABNAmroTestApp
//
//  Created by Vishal on 7/5/21.
//

import Foundation

protocol AddLocationViewModelType {
    func saveAction(_ name: String, lat: Double, long: Double)
    func popToLocationsScreen()
}

final class AddLocationViewModel: AddLocationViewModelType {
    
    private weak var delegate: LocationDelegate?
    private let appCoordinator: AppCoordinator
    
    init(delegate: LocationDelegate, appCoordinator: AppCoordinator) {
        self.delegate = delegate
        self.appCoordinator = appCoordinator
    }
    
    func saveAction(_ name: String, lat: Double, long: Double) {
        let location = Location(name: name, lat: lat, long: long)
        delegate?.add(location: location)
    }
    
    func popToLocationsScreen() {
        appCoordinator.popToLocationsScreen()
    }
}
