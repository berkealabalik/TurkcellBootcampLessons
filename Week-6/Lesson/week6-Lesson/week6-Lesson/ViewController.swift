//
//  ViewController.swift
//  week6-Lesson
//
//  Created by Berke Alabalik on 12.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let sections = Bundle.main.decode([Section].self, from: "edevlet1.jon") // json en dışı array o yüzden
    var collectionView : UICollectionView!
    
    var datasource : UICollectionViewDiffableDataSource<Section,EDevlet>?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
        
        collectionView.register(TopCell.self, forCellWithReuseIdentifier: TopCell.reuseIdentifier)
        collectionView.register(HighlightCell.self, forCellWithReuseIdentifier: HighlightCell.reuseIdentifier)
        collectionView.register(BottomCell.self, forCellWithReuseIdentifier: BottomCell.reuseIdentifier)
        
        
        createDataSource()
        reloadData()
        
    }
    private func configure<T: EDevletCellProtocol>(_ cellType: T.Type, with edevlet: EDevlet, for indexPath:IndexPath)-> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable To dequeue \(cellType)")
        }
        
        cell.configure(with: edevlet)
        return cell
    }
    
    private func createDataSource(){ // data source Cellerle dolduracak
        datasource = UICollectionViewDiffableDataSource<Section,EDevlet>(collectionView: collectionView, cellProvider: { ( collectionView, indexPath, edevlet) in
            switch self.sections[indexPath.section].type {
            case "top":
                return self.configure(TopCell.self, with: edevlet, for: indexPath)
            case "bottom":
                return self.configure(BottomCell.self, with: edevlet, for: indexPath)
            default:
                return self.configure(HighlightCell.self, with: edevlet, for: indexPath)
            }
        })
        datasource?.supplementaryViewProvider = { collectionView,kind, IndexPath in
            
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: IndexPath) as? SectionHeader else {return nil}
            guard let firstItem = self.datasource?.itemIdentifier(for: IndexPath) else { return nil}
            guard let section = self.datasource?.snapshot().sectionIdentifier(containingItem: firstItem) else { return nil}
            
            if section.title.isEmpty {return nil}
            sectionHeader.title.text = section.title
            return sectionHeader
            
        }
        
    }
    
    
    
    private func createCompositionalLayout()-> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex , layoutEnvironment in
            
            let section = self.sections[sectionIndex]
            switch section.type {
            case "top":
                // return self.createTopSection()
                break
            case "bottom":
                // return self.createBottomSection()
                break
            default:
                // return self.createHighlightedSection()
                break
            }
        }
        return layout
    }
    
    
    
    
   private func reloadData() { // başka bir sınıftan erişilmiyecek private
        var snapshot = NSDiffableDataSourceSnapshot<Section,EDevlet>()// verinin o anlık hali kopyasını alıyor
        snapshot.appendSections(sections) // sectionların olduğu snapshot
        
        for section in sections { //  birden fazla section var onu ekliyecek.
            snapshot.appendItems(section.items, toSection: section) // items zaten EDevlet olarak tanımladık .
        }
        datasource?.apply(snapshot)
    }
    
    
    
    
}



