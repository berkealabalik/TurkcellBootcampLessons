//
//  PaymentHeaderView.swift
//  ReservationApp
//
//  Created by Berke Alabalik on 5.03.2022.
//

import UIKit

class PaymentHeaderView: UIView {
    @IBOutlet weak var containerView: UIView! // En dıştaki
    @IBOutlet weak var paymentTypeLabel: UILabel!
    @IBOutlet weak var strikeTotalAmount: UILabel!
    @IBOutlet weak var paymentSubtitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    
    private var view : UIView!
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUp() {
        
        
    }
    
    
    

}
