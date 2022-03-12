//
//  MainViewController.swift
//  GameScore
//
//  Created by Berke Alabalik on 5.03.2022.
//

import UIKit

//ar GameInformation : [GamesData] = []

class MainViewController: UIViewController {
    private var GameInformation : [GamesData] = []
    @IBOutlet weak var NotFoundLabel: UILabel!
    @IBOutlet weak var pageNumControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeader: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchBarActive : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        GameInformation = AllGames[0].results
        configureCollectionView()
        configureHeaderCollectionView()

}
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NotFoundLabel.isHidden = true
        tabBarController?.tabBar.isHidden = false
    }
    
    
    private func configureData() {
        GameInformation = AllGames[0].results
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: "GamesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GamesCollectionViewCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .clear
    }
    
    private func configureHeaderCollectionView() {
        collectionViewHeader?.register(UINib(nibName: "GameSliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "gameImagesCollectionCell")
        collectionViewHeader.backgroundColor = .darkGray
    }
      
} // END MAİN




extension MainViewController : UICollectionViewDelegate,  UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewHeader {
                return 3
            }
        return (GameInformation.count - 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewHeader {
            let headercell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameImagesCollectionCell", for: indexPath) as! GameSliderCollectionViewCell
            headercell.backgroundColor = .clear
            UIImage.loadFrom(url: URL(string : GameInformation[indexPath.row].backgroundImage)!) { image in
                if let imageData = image?.jpegData(compressionQuality: 0)  {
                    headercell.gameImages.image = UIImage(data: imageData)
                }
                
            }
            self.pageNumControl.currentPage = indexPath.row
            return headercell
        }
        
        
        // Index Path Operations . Header Start From 0 , Sub Section start from 3 .
        var newIndexPath = indexPath
        newIndexPath.row = indexPath.row + 3
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: newIndexPath) as! GamesCollectionViewCell
            cell.nameGame.text = GameInformation[newIndexPath.row].name
            cell.ratingReleasedLAbel.text = "Rating : "+String(GameInformation[newIndexPath.row].metacritic)+"\nRelase Date : "+GameInformation[newIndexPath.row].released
            UIImage.loadFrom(url: URL(string : GameInformation[newIndexPath.row].backgroundImage)!) { image in
                if let imageData = image?.jpegData(compressionQuality: 0)  {
                    cell.gameImage.image = UIImage(data: imageData)
                }
            }
            return cell
    }
    
    
    // NEXT Destionation Informations
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var newIndexPath = indexPath
      
        if collectionView == collectionViewHeader {
            performSegue(withIdentifier: "showGameDetail", sender : newIndexPath)
        } else {
            newIndexPath.row = indexPath.row + 3
            performSegue(withIdentifier: "showGameDetail", sender : newIndexPath )
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? GameDetailViewController {
                let indexPath = sender as! IndexPath
                    destination.selectedGame = [GameInformation[indexPath.row]]
             }
    }
  
}//--End MVC Extension


extension MainViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if (searchText.count  > 3) {
            searchbySearchbar(searchText: searchText)
            self.collectionViewHeader.reloadData()
            self.collectionView.reloadData()
            }
        
        if searchText == "" {
            self.NotFoundLabel.isHidden = true
            self.searchBarActive = false
            GameInformation = AllGames[0].results
            self.collectionView?.reloadData()
            self.collectionViewHeader.reloadData()
            }
    }

    func searchbySearchbar(searchText : String){
        
        // If text reach first 3 it will add item .
        var count = 0
        count = count + 1
        
        
        if count == 1 {
            self.searchBarActive = true
            GameInformation.removeAll()
            GameInformation.append(contentsOf: AllGames[0].results.prefix(upTo: 3))
            for item in AllGames[0].results {
                if (item.name.lowercased().contains((searchText.lowercased()))) {
                    GameInformation.append(item)
                }
                if ( GameInformation.count <= 3) {
                    self.NotFoundLabel.isHidden = false
                }else {
                    self.NotFoundLabel.isHidden = true
                }
       
            }
        }
    }


}

