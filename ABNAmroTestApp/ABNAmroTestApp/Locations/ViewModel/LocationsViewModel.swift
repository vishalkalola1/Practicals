//
//  LocationsViewModel.swift
//  ABNAmroTestApp
//
//  Created by Vishal on 7/4/21.
//

import Foundation

protocol RefreshViewDelegate: AnyObject {
    func reload()
}

protocol LocationsViewModelType: LocationDelegate  {
    var numberOfSections: Int { get }
    var numberOfRows: Int { get }
    func loadJson(data: Data) throws
    func readFile() throws -> Data?
    func location(at indexPath: IndexPath) -> LocationsCellViewModel?
    func makeUrl(for viewModel: LocationsCellViewModel) -> URL?
    func navigateToAddLocation()
    func location(didSelectAt indexPath: IndexPath)
}

final class LocationsViewModel: LocationsViewModelType {
    
    private enum Constants {
        static let baseUrl = "wikipedia://places/?WMFArticleURL=http://en.wikipedia.com/wiki/"
    }
    
    var locations: [Location] = []
    weak var delegate: RefreshViewDelegate?
    private let appCoordinator: AppCoordinator
    
    init(delegate: RefreshViewDelegate, appCoordinator: AppCoordinator) {
        self.delegate = delegate
        self.appCoordinator = appCoordinator
    }
    
    var numberOfSections: Int {
        1
    }
    
    var numberOfRows: Int {
        locations.count
    }
    
    func location(at indexPath: IndexPath) ->  LocationsCellViewModel? {
        let location = locations[indexPath.row]
        return LocationsCellViewModel(name: location.name ?? "", lat: location.lat, long: location.long)
    }
    
    func location(didSelectAt indexPath: IndexPath) {
        guard let locationCellViewModel = self.location(at: indexPath),
              let url = self.makeUrl(for: locationCellViewModel) else { return }
        appCoordinator.open(url: url)
    }
    
    func makeUrl(for viewModel: LocationsCellViewModel) -> URL? {
        @ReplaceSpace var name = viewModel.name
        let urlString = Constants.baseUrl + name + "/\(viewModel.lat)/\(viewModel.long)"
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
    
    func loadJson(data: Data) throws {
        let jsondecoder = JSONDecoder()
        let locationModel = try jsondecoder.decode(LocationModel.self, from: data)
        self.locations = locationModel.locations ?? []
    }
    
    func readFile() throws -> Data? {
        guard let path = Bundle.main.path(forResource: "locations", ofType: "json") else { return nil }
        return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
    
    func navigateToAddLocation() {
        let addLocationViewModel = AddLocationViewModel(delegate: self, appCoordinator: appCoordinator)
        appCoordinator.navigateToAddLocation(playerViewModel: addLocationViewModel)
    }
}

extension LocationsViewModel {
    func add(location: Location) {
        locations.append(location)
        delegate?.reload()
    }
}
