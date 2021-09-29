//
//  LystPractical
//
//  Created by Vishal on 7/20/21.
//

import UIKit

class BreedSearchViewController: UIViewController {
    
    var viewModel: BreedSearchViewModelType?
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        DispatchQueue.main.async {
            self.fetchBreed()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func registerCells(){
        let breedCollectionViewCell = String(describing: BreedCollectionViewCell.self)
        collectionView.register(UINib(nibName: breedCollectionViewCell, bundle: .main), forCellWithReuseIdentifier: breedCollectionViewCell)
    }
    
    private func fetchBreed() {
        showLoader()
        viewModel?.breeds() { error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.hideLoader {
                    if let error = error {
                        self.showAlert(title: "Error", message: error)
                    } else {
                        self.collectionView.reloadData()
                    }
                }
            })
        }
    }
}

extension BreedSearchViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.breed(didSelectAt: indexPath.row)
    }
}


extension BreedSearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel?.numberOfSections ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.numberOfRows ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifire = String(describing: BreedCollectionViewCell.self)
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifire, for: indexPath) as? BreedCollectionViewCell else { return UICollectionViewCell() }
        let breedCollectionViewModel = viewModel!.breed(at: indexPath.row)
        cell.config(breedCollectionViewModel)
        return cell
    }
}

extension BreedSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/3, height: collectionView.frame.size.width/3)
    }
}

extension BreedSearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBreed(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    private func searchBreed(_ text: String){
        viewModel?.searchBreed(text, completion: { _ in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
}
