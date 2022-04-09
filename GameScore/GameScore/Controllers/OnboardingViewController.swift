//
//
//  OnboardingViewController.swift
//  onboardingTemplate-Lottie
//
//  Created by Berke Alabalik on 28.02.2022.
//

import UIKit

struct Slide {
    let title : String
    let titleColor : UIColor
    let animationName : String
    let buttonColor: UIColor
    let buttonTitle : String
    let backgroundColor : UIColor
    let buttonTitleColor : UIColor
    
    static let collection: [Slide] = [
        .init(title: "Welcome To \nGameScore",titleColor: .white, animationName: "TenisGame", buttonColor: UIColor(red: 237/255, green: 18/255, blue: 123/255, alpha: 0.93), buttonTitle: "     Let's Start", backgroundColor: UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1) , buttonTitleColor: .white),
        .init(title: "New Games \nNew Worlds ",titleColor: .white, animationName: "hockeyGame", buttonColor: UIColor(red: 0/255, green: 173/255, blue: 239/255, alpha: 0.93)  , buttonTitle: "     Find New Games", backgroundColor: UIColor(red: 35/255, green: 31/255, blue: 32/255, alpha: 1)  , buttonTitleColor: .white)
        
    ]
    
}

var AllGames : [GamesInfo] = []
var FavoriteGames : [GamesData] = []
class OnboardingViewController: UIViewController {
    
    // For prevent Load In Main
    
    let gameRequest = GameRequest()
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    private let slides: [Slide] = Slide.collection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameRequest.getCampaign { result in
            switch result {
                
            case .success(let games):
                DispatchQueue.main.async {
                    AllGames = games
                }
                AllGames = games
            case .failure(let error):
                print("Buraya error girdi")
                print(error.localizedDescription)
            }
        }
        
        
        setupCollectionView()
        setupPageControl()
        // Do any additional setup after loading the view.
    }
    
    private func setupPageControl() {
        pageController.numberOfPages = slides.count
        //let angle = CGFloat.pi/2
        //pageController.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical //** Change Scroll Direction HERE
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInsetAdjustmentBehavior = .never // Remove Top White Bar First Cell.
        collectionView.isPagingEnabled = true
    }
    
    private func handleActionButton(at indexPath : IndexPath) {
        if indexPath.item == slides.count - 1 {
            showMain()
        } else {
            let nextItem = indexPath.item + 1
            let nextIndex = IndexPath(item : nextItem , section: 0)
            collectionView.scrollToItem(at: nextIndex, at: .top, animated: true)
            pageController.currentPage = nextItem
        }
    }
    
    private func showMain() {
        let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UITabbarCont") // Controller Routed
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            
            window.rootViewController = mainVC // Change if
            UIView.transition(with: window, duration: 0.25, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(collectionView.contentOffset.y / scrollView.frame.size.height) // Scroll down 1
        pageController.currentPage = index
    }
    
    
    
    
}

extension OnboardingViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count // Page num
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingcellId", for: indexPath) as! OnboardingCollectionViewCell
        let slide = slides[indexPath.row]
        cell.configure(with: slide)
        cell.actionButtonDidTap = { [weak self] in
            self?.handleActionButton(at: indexPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = view.bounds.width
        let itemHeight = view.bounds.height
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


class OnboardingCollectionViewCell : UICollectionViewCell {
    @IBOutlet weak var animationView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var emptyRightArea: UIView!
    @IBOutlet weak var titleViewArea: UIView!
    var actionButtonDidTap: (() -> Void)?
    
    
    
    
    func configure(with slide : Slide) {
        titleViewArea.backgroundColor = slide.backgroundColor
        emptyRightArea.backgroundColor = slide.backgroundColor
        self.backgroundColor = slide.backgroundColor
        titleLabel.backgroundColor = slide.backgroundColor
        titleLabel.text = slide.title
        titleLabel.textColor = slide.titleColor
        actionButton.backgroundColor = slide.buttonColor
        actionButton.setTitleColor(slide.buttonTitleColor, for: .normal)
        actionButton.setTitle(slide.buttonTitle, for: .normal)
        animationView.image = UIImage(named: slide.animationName)
        
        
    }
    
    @IBAction func actionButtonTapped(_ sender: Any) {
        actionButtonDidTap?()
        
    }
    
}
