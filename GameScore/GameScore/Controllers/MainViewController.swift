//
//  MainViewController.swift
//  GameScore
//
//  Created by Berke Alabalik on 5.03.2022.
//

import UIKit

var GameInformation : [GamesData] = []

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    
    var collectionView: UICollectionView?
    var collectionViewHeader : UICollectionView?
    var searchBar : UISearchBar?
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        
        GameInformation = AllGames[0].results
        configureCollectionView()

}
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarController?.tabBar.isHidden = false
        collectionView?.frame = view.bounds
        navigationItem.titleView?.isHidden = true
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.width/3)
        layout.minimumLineSpacing = 0
        collectionViewHeader = UICollectionView(frame : .zero, collectionViewLayout: layout)
        collectionView = UICollectionView(frame : .zero, collectionViewLayout: layout)
        collectionView?.register(UINib(nibName: "GamesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GamesCollectionViewCell")
        collectionView?.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
      
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .clear
        view.addSubview(collectionView!)
      
    }
      
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as! GamesCollectionViewCell
        cell.nameGame.text = GameInformation[indexPath.row + 3].name
        cell.ratingReleasedLAbel.text = "Rating : "+String(GameInformation[indexPath.row + 3].metacritic)+"\nRelase Date : "+GameInformation[indexPath.row + 3].released
        
        UIImage.loadFrom(url: URL(string : GameInformation[indexPath.row + 3].backgroundImage)!) { image in
            cell.gameImage.image = image
        }
        return cell
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        UIImage.loadFrom(url: URL(string : GameInformation[indexPath.row].backgroundImage)!) { image in
            header.headerImage.image = image
            
        }
        
        header.gameNameHeader.text = GameInformation[indexPath.row].name
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showGameDetail", sender : indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? GameDetailViewController {
                
                let indexPath = sender as! IndexPath
                destination.selectedGame = [GameInformation[indexPath.row + 3]]
                
            }
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 370)
    }
    


}




