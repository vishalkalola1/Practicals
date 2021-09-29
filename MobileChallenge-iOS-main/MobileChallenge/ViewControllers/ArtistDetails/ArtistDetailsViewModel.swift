//
//  ArtistDetailsViewModel.swift
//  MobileChallenge
//
//  Created by Vishal on 6/11/21.
//

import Foundation

protocol ArtistDetailsProtocol: AnyObject {
    func refresh() 
}

class ArtistDetailsViewModel {
    
    private var artistNode: Artists.Node?
    private var favoriteService: FavoriteService
    private var artistCoordinator: ChildCoordinate
    private var detailsService: ArtistDetailsServices
    
    weak var detailsDelegate: ArtistDetailsProtocol?
    weak var delegate: ArtistViewControllerProtocol?
    
    init(_ node: Artists.Node, favoriteService: FavoriteService = .shared, detailsService: ArtistDetailsServices = .shared, artistCoordinator: ChildCoordinate, delegate: ArtistViewControllerProtocol? = nil) {
        self.favoriteService = favoriteService
        self.artistCoordinator = artistCoordinator
        self.delegate = delegate
        self.detailsService = detailsService
        getArtist(node.id ?? "")
        
    }
    
    func getArtist(_ id: String) -> Void {
        detailsService.getArtist(byid: id, generalType: ArtistsDetails.self) { results in
            switch results {
            case .success(let artist):
                self.artistNode = artist.node
                break
            case .failure(let error):
                print(error)
                break
            }
            self.detailsDelegate?.refresh()
        }
    }
    
    var isFavorite: Bool {
        do {
            guard try favoriteService.getOne(entity: "Favorite", id: artistNode?.id ?? "") != nil else {
                return false
            }
            return true
        }catch {
            return false
        }
    }
    
    var isEmpty: Bool {
        artistNode == nil
    }
    
//    var id: String {
//        artistNode?.id ?? ""
//    }
    
    ///Computed Property
    var name: String {
        artistNode?.name ?? ""
    }
    
    var gender: String {
        artistNode?.gender ?? ""
    }
    
    var life: String {
        let death = "\nDied: " + (artistNode?.lifeSpan?.end ?? "")
        let deathOrBlank = artistNode?.lifeSpan?.ended == false ? "": death
        var birth = artistNode?.lifeSpan?.begin ?? ""
        if birth != "" {
            birth = "Born: " + birth
        }
        return birth + deathOrBlank
        
    }
    var banner: Data {
        let url = URL(string: artistNode?.theAudioDB?.banner ?? "https://i.stack.imgur.com/l60Hf.png")
        return try! Data(contentsOf: url!)
    }
    var description: String {
        artistNode?.disambiguation ?? ""
    }
    var areaName: String {
        artistNode?.area?.name ?? ""
    }
    var type: String {
        artistNode?.type ?? ""
    }
    private var recordings: [Recordings.Node] {
        artistNode?.recordings?.nodes ?? []
    }
    
    private var tags: [Tags.Node] {
        artistNode?.tags?.nodes ?? []
    }
    
    var countRecordings: Int {
        recordings.count
    }
    
    var countTags: Int {
        tags.count
    }
    
    func objectRecording(At row:Int) -> RecordingsViewModel {
        return RecordingsViewModel(recordings[row])
    }
    
    func objectTags(At row:Int) -> TagsViewModel {
        return TagsViewModel(tags[row])
    }
    
    func favotrite() throws -> Void {
        try favoriteService.create(AndSave: "Favorite", data: self.artistNode!)
    }
    
    func removeFavotrite() throws -> Void {
        try favoriteService.delete(entity: "Favorite", id: self.artistNode?.id ?? "")
    }
    
    func refreshTableView() -> Void {
        delegate?.refresh()
    }
}
