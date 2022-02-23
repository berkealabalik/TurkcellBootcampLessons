//
//  OdemePageViewController.swift
//  BusReserve
//
//  Created by Berke Alabalik on 16.02.2022.
//

import UIKit

class OdemePageViewController: UIViewController {
    var buyedBus : BusClass?
    var buyedPlace : [String] = []
    var buyPrice : Int = 0
    var id = 0
    // KREDİ KARTI SAHTE CHECK :
    let cartNo = "5225000011224549"
    let cvc = "221"
    let cardDate = "10/24"
    
    
    //ALERT : Yanlış Kart
    let alert = UIAlertController(title: "Ödeme Alınamadı", message: "Lütfen Geçerli Bir Kart Giriniz!", preferredStyle: UIAlertController.Style.alert)
    
    // Connections
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var koltuklarLabel: UILabel!
    
    //A : Passenger
    
    @IBOutlet weak var passengerNameField: UITextField!
    @IBOutlet weak var passengerSurnameField: UITextField!
    @IBOutlet weak var passengerEmailField: UITextField!
    @IBOutlet weak var passengerTelField: UITextField!
    // B: Credit Card
    
    @IBOutlet weak var cardDateField: UITextField!
    @IBOutlet weak var cardHolderField: UITextField!
    @IBOutlet weak var cardNoField: UITextField!
    @IBOutlet weak var cvcField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringRepresentation = buyedPlace.joined(separator: ",")
        alert.addAction(UIAlertAction(title: "Tamam",style:UIAlertAction.Style.default,handler: nil))
        koltuklarLabel.text = stringRepresentation
        totalPriceLabel.text = String(buyPrice)
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TicketInfoViewController {
            destination.busInfo = buyedBus
            
        }
    }
    
    @IBAction func makePaymentBtn(_ sender: Any) {
        
        
        if cardCheck(cvc: cvcField.text!, carNo: cardNoField.text!, cardDate: cardDateField.text!) == true {
            getPassengerInfo(name: passengerNameField.text ?? "empty", surname: passengerSurnameField.text ?? "empty", mail: passengerEmailField.text ?? "empty", tel: passengerTelField.text ?? "empty")
            
            buyedBus?.buyPlace(places: buyedPlace)
        }
        
      
    }
    func cardCheck(cvc : String , carNo  : String , cardDate : String ) -> Bool{
        
        if cvc == self.cvc && carNo == self.cartNo && cardDate == self.cardDate {
            return true
        } else {
            present(alert, animated: true, completion: nil)
            return false
        }
    }
    
    
    func getPassengerInfo(name : String , surname: String ,  mail : String , tel : String) {
        id = id + 1
        let yolcu = Ticket.init(Yolcu: .init(name: name, Surname: surname, id: id, email: mail , tel: tel), Tarih: Dateclass(day: (buyedBus?.busDate.day)!, month: (buyedBus?.busDate.month)!, year: (buyedBus?.busDate.year)!), Saat: buyedBus!.saat, Koltuk: buyedPlace, AlinanKoltukSayisi: buyedPlace.count)
        TicketsBuyed.append(yolcu)
    }
    
    
    



}
