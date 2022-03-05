//
//  ReservationInsertCell.swift
//  ReservationApp
//
//  Created by Berke Alabalik on 5.03.2022.
//

import UIKit

protocol ReservationInsertCellDelegate : AnyObject {
    func reloadTable()
}
class ReservationInsertCell: UITableViewCell {
    
// Field - Labels
    @IBOutlet weak var reservationListExpandLabel: UILabel!
    @IBOutlet weak var reservationNumberTextField: UITextField!
    @IBOutlet weak var digit1: UITextField!
    @IBOutlet weak var digit2: UITextField!
    @IBOutlet weak var digit3: UITextField!
    @IBOutlet weak var digit4: UITextField!
    @IBOutlet weak var digit5: UITextField!
    @IBOutlet weak var digit6: UITextField!
   
    
    
    
    // MAİN VİEW .
    @IBOutlet weak var cardView: UIView! {
        didSet {
            cardView.layer.borderWidth = 2
            cardView.layer.cornerRadius = 7
            cardView.layer.borderColor = UIColor(red: 0.09, green: 0.81, blue: 0.77, alpha: 0.70).cgColor
        }
    }
    
    
    
    weak var delegate : ReservationInsertCellDelegate?
    
    private func configure() {
        reservationListExpandLabel.isUserInteractionEnabled = true
    let tab = UITapGestureRecognizer()
        tab.addTarget(self, action: #selector(expand))
        reservationListExpandLabel.addGestureRecognizer(tab)
    }
    
    @objc private func expand() {
        self.reservationNumberStackView.isHidden = !self.reservationNumberStackView.isHidden
        self.reservationConfirmationStackView.isHidden = true
        if self.reservationNumberStackView.isHidden {
            
            self.reservationListExpandLabel.text = "+ Rezervasyonumu Listeme Ekle"
        } else {
            self.reservationListExpandLabel.text = "- Rezervasyonumu Listeme Ekle"
        }
        
        //MARK TABLE VİEW YENİLENMELİ
        self.delegate?.reloadTable()
        
    }
    
    
    // STACK VİEWS
    
    @IBOutlet weak var reservationHeaderStackView: UIStackView!
    @IBOutlet weak var reservationNumberStackView: UIStackView!
    @IBOutlet weak var reservationConfirmationStackView: UIStackView!
    
    
    private func configureReservationNumber() {
        
        let rightStackView = UIStackView()
        rightStackView.axis = .horizontal
        let emptyView = UIView()
        emptyView.backgroundColor = .clear // Bu view sağdan 4 birim boşluk sağluyor .red yapıp bak
        emptyView.widthAnchor.constraint(equalToConstant: 4).isActive = true // 4 birim sağdan
        
        let button = UIButton(type: .custom)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemBlue
        button.setTitle("SORGULA", for: .normal)
        button.addTarget(self, action: #selector(getConfirmMethod), for: .touchUpInside) // touch up inside dokunup bırak
        rightStackView.addArrangedSubview(button)
        rightStackView.addArrangedSubview(emptyView)
        
        
        reservationNumberTextField.rightViewMode = .always
        reservationNumberTextField.rightView = rightStackView
    }
    
    
    @objc func getConfirmMethod() {
        self.reservationConfirmationStackView.isHidden = false
        //MARK TABLE VİEW YENİLENMELİ
        self.delegate?.reloadTable()
        self.digit1.becomeFirstResponder() // Araştır.
    }
    
    
    private func configureOTP() {
        self.digit1.delegate = self
        self.digit2.delegate = self
        self.digit3.delegate = self
        self.digit4.delegate = self
        self.digit5.delegate = self
        self.digit6.delegate = self
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.reservationNumberStackView.isHidden = true
        self.reservationConfirmationStackView.isHidden = true
        
        configure()
        configureReservationNumber()
        configureOTP()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}


extension ReservationInsertCell : UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let text = textField.text
        
        if text?.utf8.count == 1 {
            switch textField {
            case digit1:
                digit2.becomeFirstResponder()
            case digit2:
                digit3.becomeFirstResponder()
            case digit3:
                digit4.becomeFirstResponder()
            case digit4:
                digit5.becomeFirstResponder()
            case digit5:
                digit6.becomeFirstResponder()
            case digit6:
                digit6.resignFirstResponder()
            default:
                break
            }
        }
    }
}
