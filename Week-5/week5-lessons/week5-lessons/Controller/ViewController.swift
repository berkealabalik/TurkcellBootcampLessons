//
//  ViewController.swift
//  week5-lessons
//
//  Created by Berke Alabalik on 4.02.2022.
//

import UIKit
// page view controller tanıtım ekranı olur onun gibi . Pageview olur , collection view controller ilede olur .

// ÖDEV : bu tanıtım ekranlarına onboarding ekranı denir . Onboarding ekranında page view controller yada istersek collection view ilede kullanabilirz .Kaçıncı sayfada oldugumuzu gösteren bir pageControl ekle .resim - başlık - yazı  . ama tek bir tasarımda resim değişssin 2. ekranda misal yazı değişssin .Tek bir ekran UNUTMA!

// ÖDEV: Viewcontroller yaşam döngüsünü araştırın , her birini içi neler kullanılabilir örnek vermeye çalışın .

// ÖDEV: setViewControllers a viewcontroller tanımlamak zorundamıyız ? direction tanımlamasak ne olur .
class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    var controllers = [UIViewController]()
    var titles : [Int : String] = [1: "Welcome Application", 2: "You Can Reserve Anywhere" , 3: "Don't Forget Use Seatbelt!"]
    var img : [Int : String] = [1: "ilk", 2: "iki" , 3: "üç"]
    var subt : [Int : String] = [1: "With BusReserve you can reserve cheapest bus ticket from online ", 2: "You Can Reserve Anywhere" , 3: "Don't Forget Use Seatbelt!"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vc1 = UIViewController()
        
        vc1.modalPresentationStyle = .fullScreen
        vc1.view.backgroundColor = .red
       
        controllers.append(vc1)
        let vc2 = UIViewController()
        vc2.modalPresentationStyle = .fullScreen
        vc2.view.backgroundColor = .blue
        controllers.append(vc2)
        let vc3 = UIViewController()
        vc3.modalPresentationStyle = .overFullScreen
        vc3.view.backgroundColor = .yellow
        controllers.append(vc3)
        print(controllers)
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.pageVC()
    }
    
    func pageVC() {
        guard let first = controllers.first else { return } // eğer boşssa return et yani func çık .
        let vc = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)//yeni bir controller tanımladık farklı ama
        
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        vc.dataSource = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        // SADECE İLERİ YADA GERİ GİTMEK İÇİN :
      
        present(vc, animated: true, completion: nil)
        
        
    }
    
    func change(imageName: String, titleText: String, subtitleText: String) {
        imageView.image = UIImage(named: imageName)
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
    }

}

extension ViewController : UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    //burda öne doğru giderse ne olur yana arkaya doğru giderse ne olur .
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index > 0 else {return nil}
        // guard let kullanılacak ise o fonk return ettiği tip neyse o return edilcek else
        
        let previous = index - 1
        //change(imageName: previous, titleText: previous, subtitleText: previous)
        
        return controllers[previous]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = controllers.firstIndex(of: viewController), index < (controllers.count - 1) else {return nil}
        // guard let kullanılacak ise o fonk return ettiği tip neyse o return edilcek else
        
        let next = index + 1
        //change(imageName: next, titleText: next, subtitleText: next)
        return controllers[next]
    }
    
    
    
}
