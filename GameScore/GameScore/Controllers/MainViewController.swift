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
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        GameInformation = AllGames[0].results
        configureCollectionView()
        
}
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 80, left: 20, bottom: 40, right: 20)
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.width/3)
        collectionView = UICollectionView(frame : .zero, collectionViewLayout: layout)
        collectionView?.register(UINib(nibName: "GamesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GamesCollectionViewCell")
        collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        view.addSubview(collectionView!)
      
    }
      
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as! GamesCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        header.configureHeader()
        header.AllCorners = 10
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width/1.8, height: 200)
    }
    


}




