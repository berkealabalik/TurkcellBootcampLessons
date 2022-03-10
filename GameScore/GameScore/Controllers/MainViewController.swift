//
//  MainViewController.swift
//  GameScore
//
//  Created by Berke Alabalik on 5.03.2022.
//

import UIKit

var GameInformation : [GamesData] = []

class MainViewController: UIViewController {
    
    var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeader: UICollectionView!
    var searchBar : UISearchBar?
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
    
    private func configureCollectionView() {
       
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.width/3)
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UINib(nibName: "GamesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GamesCollectionViewCell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .clear
        view.addSubview(collectionView!)
      
      
    }
    
    private func configureHeaderCollectionView() {
        collectionViewHeader?.register(UINib(nibName: "GameSliderCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "gameImagesCollectionCell")
        collectionViewHeader.backgroundColor = .darkGray
    }
      
}

extension MainViewController : UICollectionViewDelegate,  UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewHeader {
            print("Buraya girdi")
            return 3
        }
        return 10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewHeader {
            let headercell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameImagesCollectionCell", for: indexPath) as! GameSliderCollectionViewCell
            headercell.backgroundColor = .clear
            UIImage.loadFrom(url: URL(string : GameInformation[indexPath.row].backgroundImage)!) { image in
                image?.jpegData(compressionQuality: 50)
                headercell.gameImages.image = image
            }
            return headercell
        }
           
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as! GamesCollectionViewCell
            cell.nameGame.text = GameInformation[indexPath.row].name
            cell.ratingReleasedLAbel.text = "Rating : "+String(GameInformation[indexPath.row].metacritic)+"\nRelase Date : "+GameInformation[indexPath.row].released
           
            UIImage.loadFrom(url: URL(string : GameInformation[indexPath.row].backgroundImage)!) { image in
                image?.jpegData(compressionQuality: 50)
                cell.gameImage.image = image
            }
        
            return cell
        
    }
    

     
    
    
    // NEXT Destionation Informations
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showGameDetail", sender : indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? GameDetailViewController {
                
                let indexPath = sender as! IndexPath
                destination.selectedGame = [GameInformation[indexPath.row]] }
        }
    
  
}


extension MainViewController : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        GameInformation.removeAll()
        for item in AllGames[0].results {
            if (item.name.lowercased().contains((searchBar.text!.lowercased()))) {
                //self.collectionViewHeader?.isHidden = true
                GameInformation.append(item)
            }else {
                let label = UILabel()
                label.text = "Sorry, We Don't Find Searched Game"
                label.textColor = .purple
                
            }
        }
        if(searchBar.text!.isEmpty) {
            GameInformation = AllGames[0].results
        }
        self.collectionView?.reloadData()
    }
    
}




