//
//  GameDetailViewController.swift
//  GameScore
//
//  Created by Berke Alabalik on 7.03.2022.
//

import UIKit

class GameDetailViewController: UIViewController {
    var selectedGame : [GamesData] = []
    var selectedImages : [ShortScreenshot] = []
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var gameNameLAbel: UILabel!
    @IBOutlet weak var relaseDateLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureData()
        sliderCollectionView.register(UINib(nibName: "GameSliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "gameImagesCollectionCell")
        print("id : \(selectedGame[0].slug)") // adresin sonuna 
    }
    
    @IBAction func likeButton(_ sender: Any) {
        
        
    }
    private func configureData() {
        if selectedGame.isEmpty == false {
            selectedImages = selectedGame[0].shortScreenshots
        } else {
            sleep(1)
            configureData()
        }
        
        gameNameLAbel.text = selectedGame[0].name
        metacriticLabel.text = metacriticLabel.text! + " " + String(selectedGame[0].metacritic)
        relaseDateLabel.text = relaseDateLabel.text! + " " + selectedGame[0].released
        descriptionLabel.text = "   " + selectedGame[0].updated
        
        
        
    }
    

    

}

extension GameDetailViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameImagesCollectionCell", for: indexPath) as! GameSliderCollectionViewCell
        cell.backgroundColor = .clear
        
            UIImage.loadFrom(url: URL(string : selectedImages[indexPath.row].image)!) { image in
                cell.gameImages.image = image
            }
        //cell.imageNumberControl.currentPage = indexPath.row + 1
        return cell
    }
    
    
}

extension GameDetailViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
