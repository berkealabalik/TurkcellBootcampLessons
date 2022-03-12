//
//  FavoriteGamesViewController.swift
//  GameScore
//
//  Created by Berke Alabalik on 8.03.2022.
//

import UIKit

class FavoriteGamesViewController: UIViewController , UICollectionViewDelegateFlowLayout {
    
    private var favoriteGamesCollectionView: UICollectionView!
    @IBOutlet weak var notfoundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollection()
    
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        favoriteGamesCollectionView?.frame = view.bounds
    }
    
    
    private func configureCollection(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.width/3)
        layout.minimumLineSpacing = 0
        favoriteGamesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        favoriteGamesCollectionView.register(UINib(nibName: "GamesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GamesCollectionViewCell")
        favoriteGamesCollectionView?.delegate = self
        favoriteGamesCollectionView?.dataSource = self
        favoriteGamesCollectionView?.backgroundColor = .clear
        view.addSubview(favoriteGamesCollectionView!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoriteGamesCollectionView.reloadData()
        tabBarController?.tabBar.isHidden = false
    }

   
}

extension FavoriteGamesViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // LABEL HİDDEN OPERATIONS
        if FavoriteGames.isEmpty == true {
            self.notfoundLabel.isHidden = false
        }else {
            self.notfoundLabel.isHidden = true
        }
        return FavoriteGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as! GamesCollectionViewCell
        cell.nameGame.text = FavoriteGames[indexPath.row].name
        cell.backgroundColor = .darkGray
        cell.ratingReleasedLAbel.text = "Rating : " + String((FavoriteGames[indexPath.row].metacritic)) + "\nRelase Date : " + (FavoriteGames[indexPath.row].released)
        UIImage.loadFrom(url: URL(string : FavoriteGames[indexPath.row].backgroundImage)!) { image in
          
            if let imageData = image?.jpegData(compressionQuality: 0.0)  {
                cell.gameImage.image = UIImage(data: imageData)
            }
            
            }
    
        return cell
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "favoriteShowGameDetail", sender : indexPath)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let destination = segue.destination as? GameDetailViewController {
                
                let indexPath = sender as! IndexPath
                destination.selectedGame = [FavoriteGames[indexPath.row]]
                
            }
        }
    

}
