//
//  PaymentHeaderView.swift
//  Week-9
//
//  Created by Egitim on 5.03.2022.
//

import UIKit

class PaymentHeaderView: UIView {
    
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var paymentTypeLabel: UILabel!
    @IBOutlet weak var strikeTotalAmount: UILabel!
    @IBOutlet weak var paymentSubtitleLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    private var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(model : PayModel) {
        self.configureView()
        self.paymentTypeLabel.text = model.title
        self.paymentSubtitleLabel.text = model.subTitle
        self.strikeTotalAmount.text = model.originalPrice
        
    }
    
    private func configureView() {
        guard let nibView = loadViewFromNib() else {
            return
        }
        
        containerView = nibView
        
        bounds = nibView.frame
        addSubview(nibView)
    }
    
    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let name = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
        let nib = UINib(nibName: name, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        view.layer.cornerRadius = 6
        
        return view
    }
}
