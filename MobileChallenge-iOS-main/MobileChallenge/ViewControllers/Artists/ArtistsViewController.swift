//
//  ViewController.swift
//  SwapCardTest
//
//  Created by Vishal on 6/10/21.
//

import UIKit

class ArtistsViewController: UIViewController {
    
    var artistViewModel: ArtistViewModel?
    
    @IBOutlet weak var artistTableView: UITableView!
    @IBOutlet weak var artistSearchbar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() -> Void {
        artistSearchbar.searchTextField.clearButtonMode = .never
        artistTableView.setBackgroundView("Please search artist by name \n🔍🔍")
    }
    
    ///Click on favorite button and get reference of button here you dont have to refresh tableview
    func favouriteClicked(_ sender: UIButton) {
        do {
            if artistViewModel?.isFavorite(sender.tag) ?? false {
                try artistViewModel?.removeFavotrite(sender.tag)
            }else{
                try artistViewModel?.favotrite(sender.tag)
            }
        }catch let error{
            print(error.localizedDescription)
        }
        sender.isSelected = !sender.isSelected
    }
}


///TableView Operations
extension ArtistsViewController: UITableViewDelegate, UITableViewDataSource, ArtistTableCellProtocol {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        artistTableView.separatorStyle = artistViewModel?.count ?? 0 > 0 ? .singleLine: .none
        return artistViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistTableViewCell") as? ArtistTableViewCell, let artistViewModel = artistViewModel else {
            return UITableViewCell()
        }
        
        if let artistCellModelView = artistViewModel.object(At: indexPath.row) {
            cell.fillData(artistCellModelView, index: indexPath.row)
            cell.delegate = self
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        artistViewModel?.didselect(At: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        if y + artistTableView.frame.size.height >= artistTableView.contentSize.height - 200 && artistViewModel?.paginationEnable ?? false {
            self.artistTableView.addSpinner()
            artistViewModel?.getArtists(artistSearchbar.text ?? "", isSearch: false)
        }
    }
}

///Refresh table
extension ArtistsViewController: ArtistViewControllerProtocol {
    func refresh() {
        DispatchQueue.main.async {
            self.artistTableView.removeSpinner()
            self.artistTableView.reloadData()
            if self.artistSearchbar.text != "" {
                self.dismiss()
            }
        }
    }
}

///Search Artist by hititng button
extension ArtistsViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if searchBar.text != "" {
            self.showLoader()
            artistViewModel?.getArtists(searchBar.text!, isSearch: true)
        }else {
            artistViewModel?.getArtists("", isSearch: true)
        }
    }
}

///TableView Extention
extension UITableView {
    func setBackgroundView(_ text: String) -> Void {
        let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 10, width: self.bounds.size.width, height: self.bounds.size.height-20))
        noDataLabel.text = text
        noDataLabel.font = UIFont.boldSystemFont(ofSize: 25)
        noDataLabel.numberOfLines = 0
        noDataLabel.textColor     = UIColor.red
        noDataLabel.textAlignment = .center
        self.backgroundView  = noDataLabel
        self.separatorStyle  = .none
    }
    
    func clear() -> Void {
        self.backgroundView  = nil
        self.separatorStyle  = .singleLine
    }
    
    func addSpinner() -> Void {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.bounds.width, height: CGFloat(44))

        self.tableFooterView = spinner
        self.tableFooterView?.isHidden = false
    }
    
    func removeSpinner() -> Void {
        self.tableFooterView = nil
        self.tableFooterView?.isHidden = true
    }
}

extension UIViewController {
    func showLoader() -> Void {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func dismiss() -> Void {
        self.dismiss(animated: true)
    }
}
