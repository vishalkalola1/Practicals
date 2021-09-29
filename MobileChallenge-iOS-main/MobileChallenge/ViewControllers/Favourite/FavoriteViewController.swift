//
//  FavoriteViewController.swift
//  MobileChallenge
//
//  Created by Vishal on 6/11/21.
//

import UIKit

class FavoriteViewController: UIViewController, ArtistTableCellProtocol {
   
    var favoriteViewModel: FavoriteViewModel?
    
    @IBOutlet weak var favoriteTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            try favoriteViewModel?.getFavoriteData()
            self.favoriteTable.reloadData()
            setEmptyLabel()
            
        }catch let error {
            print(error)
        }
        favoriteTable.tableFooterView = UIView()
    }
    
    func setEmptyLabel() {
        if favoriteViewModel?.count == 0 {
            favoriteTable.setBackgroundView("No favorite !!")
        }else {
            favoriteTable.clear()
        }
    }
}

extension FavoriteViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteViewModel?.count  ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell") as? ArtistTableViewCell, let favoriteViewModel = favoriteViewModel else {
            return UITableViewCell ()
        }
        
        let artistTablCellViewModel = favoriteViewModel.object(At: indexPath.row)
        
        cell.fillData(artistTablCellViewModel, index: indexPath.row)
        cell.delegate = self
        
        return cell
    }
    
    func favouriteClicked(_ sender: UIButton) {
        do {
            if favoriteViewModel?.isFavorite(sender.tag) ?? false {
                try favoriteViewModel?.removeFavotrite(sender.tag)
            }else{
                try favoriteViewModel?.favotrite(sender.tag)
            }
        }catch let error{
            print(error.localizedDescription)
        }
        self.favoriteViewModel?.refresh()
        self.favoriteTable.reloadData()
        self.setEmptyLabel()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        favoriteViewModel?.didselect(At: indexPath.row)
    }
}
