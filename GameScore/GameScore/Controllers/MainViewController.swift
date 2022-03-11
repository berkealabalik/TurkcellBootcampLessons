//
//  MainViewController.swift
//  GameScore
//
//  Created by Berke Alabalik on 5.03.2022.
//

import UIKit

var GameInformation : [GamesData] = []

class MainViewController: UIViewController {
    
    
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
        
        tabBarController?.tabBar.isHidden = false
        navigationController?.isToolbarHidden = true
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
      
}




extension MainViewController : UICollectionViewDelegate,  UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewHeader {
            return 3
        }
        return GameInformation.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewHeader {
            let headercell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameImagesCollectionCell", for: indexPath) as! GameSliderCollectionViewCell
            headercell.backgroundColor = .clear
            UIImage.loadFrom(url: URL(string : GameInformation[indexPath.row].backgroundImage)!) { image in
                image?.jpegData(compressionQuality: 50)
                headercell.gameImages.image = image
                headercell.AllCorners = 10
                    self.pageNumControl.currentPage = indexPath.row
                
            }
       
            return headercell
        }
        
        
            var newIndexPath = indexPath
        newIndexPath.row = indexPath.row + 3
        if searchBarActive == true {
            newIndexPath.row = 0
        }
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: newIndexPath) as! GamesCollectionViewCell
            cell.nameGame.text = GameInformation[newIndexPath.row].name
            cell.ratingReleasedLAbel.text = "Rating : "+String(GameInformation[newIndexPath.row].metacritic)+"\nRelase Date : "+GameInformation[newIndexPath.row].released
            UIImage.loadFrom(url: URL(string : GameInformation[newIndexPath.row].backgroundImage)!) { image in
                image?.jpegData(compressionQuality: 50)
                cell.gameImage.image = image
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
                print(indexPath.row)
                    destination.selectedGame = [GameInformation[indexPath.row]]
             
            }
    }
  
}//--End MVC Extension


extension MainViewController : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("çalıştı")
        self.searchBarActive = true
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        GameInformation.removeAll()
        for item in AllGames[0].results {
            if (item.name.lowercased().contains((searchBar.text!.lowercased()))) {
                GameInformation.append(item)
        }
        if(searchBar.text!.isEmpty) {
            self.searchBarActive = false
            GameInformation = AllGames[0].results
        }
        self.collectionView?.reloadData()
    }
    
}

}


