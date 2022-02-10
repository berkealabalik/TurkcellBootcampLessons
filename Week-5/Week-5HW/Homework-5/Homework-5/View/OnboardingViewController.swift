//
//  OnboardingViewController.swift
//  Homework-5
//
//  Created by Berke Alabalik on 10.02.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
   
   
    @IBOutlet weak var nextBtn: UIButton!
    var slides: [OnboardingSlide] = []
        
        var currentPage = 0 {
            didSet {
                pageControl.currentPage = currentPage
               
                if currentPage == slides.count - 1 {
                    nextBtn.setTitle("Get Started", for: .normal)
                   
                   
                } else {
                    nextBtn.setTitle("Next", for: .normal)
                }
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            slides = [
               OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety of amazing dishes from different cultures around the world.", image: #imageLiteral(resourceName: "slide2")),
                OnboardingSlide(title: "World-Class Chefs", description: "Our dishes are prepared by only the best.", image: #imageLiteral(resourceName: "slide1")),
               OnboardingSlide(title: "Instant World", description: "Your orders will be delivered instantly", image: #imageLiteral(resourceName: "slide3"))
            ]
            
            pageControl.numberOfPages = slides.count
        }
        
    @IBAction func nextBtnClicked(_ sender: Any?) {
        if currentPage == slides.count - 1 {
            let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            //UserDefaults.standard.hasOnboarded = true
            present(controller, animated: true, completion: nil)
        } else {
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
        
      
    }
    
    
    }
    
   

    extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return slides.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
            cell.setup(slides[indexPath.row])
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let width = scrollView.frame.width
            currentPage = Int(scrollView.contentOffset.x / width)
        }
    }




