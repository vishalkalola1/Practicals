//
//  ArtistTableCellModelView.swift
//  MobileChallenge
//
//  Created by Vishal on 6/11/21.
//

import UIKit

class ArtistTableCellModelView {
    let id: String
    let name: String
    let disambiguation: String
    
    private var favoriteService: FavoriteService
    
    init(_ node: Artists.Node,  favoriteService: FavoriteService = .shared) {
        self.id = node.id ?? ""
        self.name = node.name ?? ""
        self.disambiguation = node.disambiguation ?? ""
        self.favoriteService = favoriteService
    }
    
    var checkFavourite: Bool {
        do {
            guard try favoriteService.getOne(entity: "Favorite", id: id) != nil else {
                return false
            }
            return true
        }catch {
            return false
        }
    }
}
