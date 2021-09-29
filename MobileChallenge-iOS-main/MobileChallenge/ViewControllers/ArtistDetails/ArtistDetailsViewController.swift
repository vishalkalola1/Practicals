//
//  ArtistDetailsViewController.swift
//  MobileChallenge
//
//  Created by Vishal on 6/11/21.
//

import UIKit

class ArtistDetailsViewController: UIViewController, ArtistDetailsProtocol {

    var artistDetails: ArtistDetailsViewModel?
    
    @IBOutlet weak var imageStack: UIStackView!
    
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var disambiguationLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var recordingCollection: UICollectionView!
    @IBOutlet weak var tagsCollection: UICollectionView!
    @IBOutlet weak var disambiguationStack: UIStackView!
    @IBOutlet weak var areaStack: UIStackView!
    @IBOutlet weak var typeStack: UIStackView!
    @IBOutlet weak var recordingStack: UIStackView!
    @IBOutlet weak var tagStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.artistDetails?.detailsDelegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fillData()
    }
    
    func refresh() {
        self.fillData()
        self.recordingCollection.reloadData()
        self.tagsCollection.reloadData()
    }
    
    @objc func addTapped(_ sender: UIBarButtonItem) -> Void {
        
        let image: UIImage?
        do {
            if artistDetails?.isFavorite ?? false {
                try artistDetails?.removeFavotrite()
                image = UIImage(systemName: "heart")
            }else{
                try artistDetails?.favotrite()
                image = UIImage(systemName: "heart.fill")
            }
            sender.image = image
        }catch let error {
            print(error.localizedDescription)
        }
        artistDetails?.refreshTableView()
    }
    
    func addNavigationBarButton(_ artistDetails: ArtistDetailsViewModel) -> Void {
        let image = artistDetails.isFavorite ? UIImage(systemName: "heart.fill"): UIImage(systemName: "heart")
        let add = UIBarButtonItem(image:image, style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    
    func fillData() -> Void {
        
        guard let artistDetails = artistDetails else { return }
        guard !artistDetails.isEmpty else { return }
        
        mainStack.isHidden = false
        addNavigationBarButton(artistDetails)
        imageView.image = UIImage(data: artistDetails.banner)
        nameLabel.text = artistDetails.name
        disambiguationStack.isHidden = artistDetails.description == "" ? true: false
        disambiguationLabel.text = artistDetails.description
        areaStack.isHidden = artistDetails.areaName == "" ? true: false
        areaLabel.text = artistDetails.areaName
        typeStack.isHidden = artistDetails.type == "" ? true: false
        typeLabel.text = artistDetails.type
        recordingStack.isHidden = artistDetails.countRecordings > 0 ? false: true
        tagStack.isHidden = artistDetails.countTags > 0 ? false: true
        genderLabel.text = artistDetails.gender
        birthDateLabel.text = artistDetails.life
    }
    
}

extension ArtistDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 0 ? artistDetails?.countRecordings ?? 0: artistDetails?.countTags ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecordingsCollectionViewCell", for: indexPath) as? RecordingsCollectionViewCell, let artistDetails = artistDetails else {
                return UICollectionViewCell()
            }
            let recordingViewModel = artistDetails.objectRecording(At: indexPath.row)
            cell.fillData(recordingViewModel)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagsCollectionViewCell", for: indexPath) as? TagsCollectionViewCell, let artistDetails = artistDetails else {
                return UICollectionViewCell()
            }
            let tagsViewModel = artistDetails.objectTags(At: indexPath.row)
            cell.fillData(tagsViewModel)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.tag == 0 ? CGSize(width: 110, height: 159): CGSize(width: 200, height: collectionView.frame.size.height)
    }
    
}
