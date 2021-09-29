//
//  ArtistViewModel.swift
//  MobileChallenge
//
//  Created by Vishal on 6/10/21.
//

import Foundation

protocol ArtistViewControllerProtocol:AnyObject {
    func refresh() -> Void
}

class ArtistViewModel {
    
    private var artistservices: ArtistServices
    private var artistCoordinator: ChildCoordinate
    private var favoriteService: FavoriteService
    
    weak var delegate: ArtistViewControllerProtocol?
    
    private var nodes: [Artists.Node] = []
    private var pageInfo: PageInfo?
    private(set) var totalCount: Int = 0
    private var isLoading = true
    
    init(_ artistservices: ArtistServices = .shared, artistCoordinator: ChildCoordinate, delegate:ArtistViewControllerProtocol, favoriteService: FavoriteService = .shared) {
        self.artistservices = artistservices
        self.artistCoordinator = artistCoordinator
        self.delegate = delegate
        self.favoriteService = favoriteService
    }
    
    func getArtists(_ text: String, isSearch:Bool) {
        
        isLoading = false
        if text == "" {
            self.isLoading = true
            self.reset()
            return
        }
        let id = !isSearch ? lastid: ""
        self.artistservices.getArtists(byName: text, after: id ,generalType: Artist.self) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                guard let search = data.search, let artists = search.artists else {
                    self.isLoading = true
                    self.reset()
                    return
                }
                self.pageInfo = artists.pageInfo
                self.totalCount = artists.totalCount ?? 0
                if artists.nodes?.count ?? 0 > 0 && !isSearch {
                    self.nodes += artists.nodes ?? []
                }else {
                    self.nodes = artists.nodes ?? []
                }
                self.delegate?.refresh()
                break
            case .failure(let error):
                print(error.localizedDescription)
                self.reset()
                break
            }
            self.isLoading = true
        }
    }
    
    func reset() -> Void {
        self.nodes = []
        self.pageInfo = nil
        self.totalCount = 0
        self.delegate?.refresh()
    }
    
    var count: Int {
        nodes.count
    }
    
    private var lastid: String? {
        pageInfo?.endCursor ?? ""
    }
    
    var paginationEnable: Bool {
        count < totalCount && isLoading
    }
    
    func object(At row: Int) -> ArtistTableCellModelView? {
        if nodes.count > 0 {
            return ArtistTableCellModelView(nodes[row])
        }else {
            return nil
        }
    }
    
    func didselect(At row: Int) {
        let detailsViewModel = ArtistDetailsViewModel(nodes[row], artistCoordinator: artistCoordinator, delegate: self.delegate)
        self.artistCoordinator.showDetails(detailsViewModel)
    }
    
    func favotrite(_ index: Int) throws -> Void {
        try favoriteService.create(AndSave: "Favorite", data: nodes[index])
    }
    
    func removeFavotrite(_ index: Int) throws -> Void {
        try favoriteService.delete(entity: "Favorite", id: nodes[index].id ?? "")
    }
    
    func isFavorite(_ index: Int) -> Bool {
        do {
            guard try favoriteService.getOne(entity: "Favorite", id: nodes[index].id ?? "") != nil else {
                return false
            }
            return true
        }catch {
            return false
        }
    }
    
    func favoriteAction() {
        self.delegate?.refresh()
    }
}
