//
//  ReusableViewController.swift
//  Week-9
//
//  Created by Egitim on 5.03.2022.
//

import UIKit

class ReusableViewController: UIViewController {

    @IBOutlet weak var installmentPayment: PaymentHeaderView!
    @IBOutlet weak var paymentHeaderView: PaymentHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Uygulama çalıştı")
        let model = PayModel(isSelected: false, title: "Peşin Ödeme", subTitle: "Tesiste Ödeme", originalPrice: "2500TL", discountPrice: "2100TL")
        paymentHeaderView.setup(model: model)
        
        
        let installmentModel = PayModel(isSelected: true, title: "Taksitli Ödeme", subTitle: "Kredi Kartı ile Ödeme", originalPrice: "1800TL", discountPrice: "1700TL")
        installmentPayment.setup(model: installmentModel)
    }
    


}
