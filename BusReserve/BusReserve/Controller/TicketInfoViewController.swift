//
//  TicketInfoViewController.swift
//  BusReserve
//
//  Created by Berke Alabalik on 20.02.2022.
//

import UIKit

class TicketInfoViewController: UIViewController {
    var busInfo : BusClass?
    
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var whereFromLabel: UILabel!
  
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var seatsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var whereToLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.text = TicketsBuyed.last?.Yolcu.name
        surnameLabel.text = TicketsBuyed.last?.Yolcu.Surname
        telLabel.text = TicketsBuyed.last?.Yolcu.tel
        companyNameLabel.text = busInfo?.businessName
        whereFromLabel.text = busInfo?.neredenBus
        whereToLabel.text = busInfo?.nereyeBus
        timeLabel.text = "\(TicketsBuyed.last!.Saat.hour)"
        minuteLabel.text = "\(TicketsBuyed.last!.Saat.minute)"
        let stringRepresentation = TicketsBuyed.last?.Koltuk.joined(separator: ",")
        seatsLabel.text = stringRepresentation

        // Do any additional setup after loading the view.
    }
    
   
    

  
}
