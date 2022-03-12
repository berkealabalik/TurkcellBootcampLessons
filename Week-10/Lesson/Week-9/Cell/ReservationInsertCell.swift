//
//  ReservationInsertCell.swift
//  Week-9
//
//  Created by Egitim on 5.03.2022.
//

import UIKit

protocol ReservationInsertCellDelegate: AnyObject {
    func reloadTable()
}

class ReservationInsertCell: UITableViewCell {

    @IBOutlet weak var reservationHeaderStackView: UIStackView!
    @IBOutlet weak var reservationNumberStackView: UIStackView!
    @IBOutlet weak var reservationConfirmationStackView: UIStackView!
    
    @IBOutlet weak var reservationListExpandLabel: UILabel!
    @IBOutlet weak var reservationNumberTextField: UITextField!
    
    @IBOutlet weak var digit1: UITextField!
    @IBOutlet weak var digit2: UITextField!
    @IBOutlet weak var digit3: UITextField!
    @IBOutlet weak var digit4: UITextField!
    @IBOutlet weak var digit5: UITextField!
    @IBOutlet weak var digit6: UITextField!
    
    
    @IBOutlet weak var cardView: UIView! {
        didSet {
            cardView.layer.borderWidth = 1
            cardView.layer.borderColor = UIColor(red: 0.09, green: 0.81, blue: 0.77, alpha: 1).cgColor
            cardView.layer.cornerRadius = 5
        }
    }
    
    weak var delegate: ReservationInsertCellDelegate?
    
    private func configure() {
        reservationListExpandLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(expand))
        reservationListExpandLabel.addGestureRecognizer(tap)
    }
    
    @objc private func expand() {
        self.reservationNumberStackView.isHidden = !self.reservationNumberStackView.isHidden
        self.reservationConfirmationStackView.isHidden = true
        if self.reservationNumberStackView.isHidden {
            self.reservationListExpandLabel.text = "+ Rezervasyonumu Listeme Ekle"
        } else {
            self.reservationListExpandLabel.text = "- Rezervasyonumu Listeme Ekle"
        }
        //MARK:  Tableview yenilenmeli??
        self.delegate?.reloadTable()
    }
    
    //MARK: Custom Reservation Number TextField
    private func configureReservationNumber() {
        
        let rightStackView = UIStackView()
        rightStackView.axis = .horizontal
        let emptyView = UIView()
        emptyView.backgroundColor = .clear
        emptyView.widthAnchor.constraint(equalToConstant: 4).isActive = true
        let button = UIButton(type: .custom)
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 46).isActive = true
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemBlue
        button.setTitle("SORGULA", for: .normal)
        button.addTarget(self, action: #selector(getConfirmCode), for: .touchUpInside)
        rightStackView.addArrangedSubview(button)
        rightStackView.addArrangedSubview(emptyView)
        reservationNumberTextField.rightViewMode = .always
        reservationNumberTextField.rightView = rightStackView
    }
    
    @objc func getConfirmCode() {
        self.reservationConfirmationStackView.isHidden = false
        self.delegate?.reloadTable()
        self.digit1.becomeFirstResponder()
    }
    
    //MARK: configure OTP Fields
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
        // Initialization code
        self.reservationNumberStackView.isHidden = true
        self.reservationConfirmationStackView.isHidden = true
        configure()
        configureReservationNumber()
        configureOTP()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ReservationInsertCell: UITextFieldDelegate {
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

/***
 
 ...../page=1 => 10 veri dönüyor
 ...../page=2 => 11->20 veri dönüyor
 scroll ile en alta gelince bunu bir şekilde anlamak ve yeni istek atmak lazım??
 
 */


