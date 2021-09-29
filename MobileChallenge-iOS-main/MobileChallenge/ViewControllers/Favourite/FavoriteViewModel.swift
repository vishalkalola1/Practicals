//
//  FavoriteViewModel.swift
//  MobileChallenge
//
//  Created by Vishal on 6/13/21.
//

import Foundation

class FavoriteViewModel {
    
    private var favoriteService: FavoriteService
    private var favoriteCoordinator: ChildCoordinate
    weak var delegate: ArtistViewControllerProtocol?
    private var favoriteArtists: [Artists.Node] = []
    
    init(_ favoriteService: FavoriteService = .shared, favoriteCoordinator: ChildCoordinate, delegate: ArtistViewControllerProtocol?) {
        self.favoriteService = favoriteService
        self.favoriteCoordinator = favoriteCoordinator
        self.delegate = delegate
    }
    
    func getFavoriteData() throws -> Void {
        let favoriteData = try favoriteService.getAll(DataFrom: "Favorite")
        self.favoriteArtists = favoriteData
    }
    
    var count: Int {
        favoriteArtists.count
    }
    
    func object(At row: Int) -> ArtistTableCellModelView {
        return ArtistTableCellModelView(favoriteArtists[row])
    }
    
    func didselect(At row: Int) {
        let detailsViewModel = ArtistDetailsViewModel(favoriteArtists[row], artistCoordinator: favoriteCoordinator, delegate: self.delegate)
        self.favoriteCoordinator.showDetails(detailsViewModel)
    }
    
    func favotrite(_ index: Int) throws -> Void {
        try favoriteService.create(AndSave: "Favorite", data: favoriteArtists[index])
    }
    
    func removeFavotrite(_ index: Int) throws -> Void {
        try favoriteService.delete(entity: "Favorite", id: favoriteArtists[index].id ?? "")
        self.favoriteArtists.remove(at: index)
    }
    
    func isFavorite(_ index: Int) -> Bool {
        do {
            guard try favoriteService.getOne(entity: "Favorite", id: favoriteArtists[index].id ?? "") != nil else {
                return false
            }
            return true
        }catch {
            return false
        }
    }
    
    func refresh() -> Void {
        delegate?.refresh()
    }
}
