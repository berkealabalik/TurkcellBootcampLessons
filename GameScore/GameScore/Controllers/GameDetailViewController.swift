//
//  GameDetailViewController.swift
//  GameScore
//
//  Created by Berke Alabalik on 7.03.2022.
//

import UIKit
public var slugName = ""
class GameDetailViewController: UIViewController {
    var selectedGame : [GamesData] = []
    var selectedImages : [ShortScreenshot] = []
    var  gameDetailInformation : [GamesDetailStruct] = []
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var metacriticLabel: UILabel!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var gameNameLAbel: UILabel!
    @IBOutlet weak var relaseDateLabel: UILabel!
    
    @IBOutlet weak var handActionButton: UIButton!
    @IBOutlet weak var imageNumControl: UIPageControl!
    
    let gameDetailRequest = GameDetailRequest()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        slugName = selectedGame[0].slug
        //GET DETAİL DATA
        gameDetailRequest.getGameDetail { res in
            switch res{
            case .success(let detail):
                //self.gameDetailInformation = detail
                print(detail)
            case .failure(let error):
                print(error)
            }
        }
        checkLikedBefore()
        configureData()
        sliderCollectionView.register(UINib(nibName: "GameSliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "gameImagesCollectionCell")
    }
    
    private func checkLikedBefore() {
        if FavoriteGames.contains(where : {$0.id == selectedGame[0].id }) == true {
            handActionButton.setBackgroundImage(UIImage(named: "thumsRed"), for: UIControl.State.normal)
        } else {
            handActionButton.setBackgroundImage(UIImage(named: "thumsWhite"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func likeButton(_ sender: Any) {
        print("basıldı")
        if FavoriteGames.contains(where : {$0.id == selectedGame[0].id }) == true {
            handActionButton.setBackgroundImage(UIImage(named: "thumsWhite"), for: UIControl.State.normal)
            if let idx = FavoriteGames.firstIndex(where: { $0.id == selectedGame[0].id }) {
                FavoriteGames.remove(at: idx) }
        } else {
            handActionButton.setBackgroundImage(UIImage(named: "thumsRed"), for: UIControl.State.normal)
            FavoriteGames.append(selectedGame[0])
        }

    }
    
    private func configureData() {
        if selectedGame.isEmpty == false {
            selectedImages = selectedGame[0].shortScreenshots
        } else {
            sleep(1)
            configureData()
        }
        
        gameNameLAbel.text = "  " + selectedGame[0].name
        metacriticLabel.text = metacriticLabel.text! + " " + String(selectedGame[0].metacritic)
        relaseDateLabel.text = relaseDateLabel.text! + " " + selectedGame[0].released
        //descriptionLabel.text = "   " + gameDetailInformation[0].gamesDetailStructDescription
        
    }
    

    //End Main
}

extension GameDetailViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return selectedImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameImagesCollectionCell", for: indexPath) as! GameSliderCollectionViewCell
        cell.backgroundColor = .clear
        
            UIImage.loadFrom(url: URL(string : selectedImages[indexPath.row].image)!) { image in
                cell.gameImages.image = image
            }
        imageNumControl.numberOfPages = selectedImages.count
        imageNumControl.currentPage = indexPath.row - 1
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
