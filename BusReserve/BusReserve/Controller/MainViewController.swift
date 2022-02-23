//
//  MainViewController.swift
//  BusReserve
//
//  Created by Berke Alabalik on 7.02.2022.
//

import UIKit


let NCKey = "co.berkealabalik.nc"
var busTrips:[BusClass] = []
var TicketsBuyed: [Ticket] = []
var filteredTrips:[BusClass] = []
class MainViewController: UIViewController {
    @IBOutlet weak var busTicketsTable: UITableView!
    // VERİLER
   
    let bus1 = BusClass(busid: 1, businessName: "Varan Turizm", neredenBus: "Ankara", nereyeBus: "İstanbul", saat: Hourclass(hour: 10, minute: 30), busDate: Dateclass(day: 16, month: 02, year: 2022), koltukdüzeni: [1: true,2:false,3: false,4:false,5: false,6:true,7: false,8:true,9: false,10:true,11: false,12:true,13: false,14:true,15: false,16:true,17: false,18:true,19: true,20:true,21: false,22:true,23: true,24:true,25: false,26:true,27: true,28:true,29: true,30:true,31: false,32:true,33: false,34:true,35:false,36:true,37:true,38:false,39:true,40:false,41:true,42:true,43:true,44: false,45:false],companyImage: "varan", fiyat: 180)
    let bus2 = BusClass(busid: 2, businessName: "Metro Turizm", neredenBus: "Ankara", nereyeBus: "İzmir", saat: Hourclass(hour: 9, minute: 30), busDate: Dateclass(day: 17, month: 02, year: 2022), koltukdüzeni: [1: false,2:false,3: false,4:false,5: false,6:false,7: false,8:true,9: false,10:true,11: false,12:true,13: false,14:true,15: false,16:true,17: false,18:true,19: false,20:true,21: false,22:true,23: false,24:true,25: false,26:true,27: false,28:true,29: false,30:true,31: false,32:true,33: false,34:true,35:false,36:true,37:true,38:false,39:true,40:false,41:true,42:true,43:true,44: false,45:false],companyImage: "metro", fiyat: 250)
    let bus4 = BusClass(busid: 4, businessName: "Metro Turizm", neredenBus: "Ankara", nereyeBus: "İstanbul", saat: Hourclass(hour: 9, minute: 30), busDate: Dateclass(day: 17, month: 02, year: 2022), koltukdüzeni: [1: true,2:true,3: false,4:false,5: false,6:false,7: false,8:true,9: false,10:true,11: false,12:true,13: false,14:false,15: false,16:false,17: false,18:true,19: false,20:true,21: false,22:true,23: false,24:true,25: false,26:true,27: false,28:true,29: false,30:true,31: false,32:true,33: false,34:true,35:false,36:true,37:true,38:false,39:true,40:false,41:true,42:true,43:true,44: false,45:false],companyImage: "metro", fiyat: 250)
    let bus5 = BusClass(busid: 5, businessName: "Metro Turizm", neredenBus: "Ankara", nereyeBus: "İstanbul", saat: Hourclass(hour: 11, minute: 30), busDate: Dateclass(day: 17, month: 02, year: 2022), koltukdüzeni: [1: false,2:false,3: false,4:false,5: false,6:false,7: false,8:true,9: false,10:true,11: false,12:true,13: false,14:true,15: false,16:true,17: false,18:true,19: false,20:true,21: false,22:true,23: false,24:true,25: false,26:true,27: false,28:true,29: false,30:true,31: false,32:true,33: false,34:true,35:false,36:true,37:true,38:false,39:true,40:false,41:true,42:true,43:true,44: false,45:false],companyImage: "metro", fiyat: 250)
    let bus3 = BusClass(busid: 3, businessName: "Pamukkale Turizm", neredenBus: "İzmir", nereyeBus: "İstanbul", saat: Hourclass(hour: 13, minute: 45), busDate: Dateclass(day: 17, month: 02, year: 2022), koltukdüzeni: [1: true,2:true,3: true,4:false,5: false,6:false,7: false,8:true,9: false,10:true,11: false,12:true,13: false,14:true,15: false,16:true,17: true,18:true,19: true,20:true,21: false,22:true,23: false,24:true,25: false,26:true,27: true,28:true,29: false,30:true,31: false,32:true,33: false,34:true,35:true,36:true,37:true,38:false,39:true,40:false,41:true,42:true,43:true,44: false,45:false],companyImage: "pamukkale", fiyat: 300)
    let bus6 = BusClass(busid: 6, businessName: "Pamukkale Turizm", neredenBus: "Ankara", nereyeBus: "İstanbul", saat: Hourclass(hour: 13, minute: 45), busDate: Dateclass(day: 17, month: 02, year: 2022), koltukdüzeni: [1: true,2:true,3: true,4:false,5: false,6:false,7: false,8:true,9: false,10:true,11: false,12:true,13: false,14:true,15: false,16:true,17: true,18:true,19: true,20:true,21: false,22:true,23: false,24:true,25: false,26:true,27: true,28:true,29: false,30:true,31: false,32:true,33: false,34:true,35:true,36:true,37:true,38:false,39:true,40:false,41:true,42:true,43:true,44: false,45:false],companyImage: "pamukkale", fiyat: 300)
    
   
    // NOTİFİCATİON TABLE
    let NC = Notification.Name(rawValue: NCKey)
    @IBOutlet weak var nereyeLabel: UILabel!
    @IBOutlet weak var neredenLabel: UILabel!
    @IBOutlet weak var gidisDate: UIDatePicker!
    
    //Block Observer
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MAİN VİEW
    override func viewDidLoad() {
        super.viewDidLoad()
        
        busTicketsTable.isHidden = true
        addBuses()
        
        
    }
    
    // ONLY ONCE ADD BUSES
   private func addBuses(){
        struct Holder { static var called = false }

        if !Holder.called {
            Holder.called = true
            busTrips.append(bus1)
            busTrips.append(bus2)
            busTrips.append(bus3)
            busTrips.append(bus4)
            busTrips.append(bus5)
            busTrips.append(bus6)
        }
    }
    
    
    private func filterData(x : BusClass) {
        if nereyeLabel.text == x.nereyeBus && neredenLabel.text == x.neredenBus {
            filteredTrips.append(x)
        }
    }
   
    @objc func addCityBtn(notification1 : NSNotification) {
        let text_c = notification1.userInfo?[""] as? String
        neredenLabel.text = text_c
        NotificationCenter.default.removeObserver(self)
    }
    @objc func addCity(notification : NSNotification) {
        let text_r = notification.userInfo?[""] as? String
        nereyeLabel.text = text_r
        NotificationCenter.default.removeObserver(self)
        
    }
    @IBAction func NeredenBtn(_ sender: Any) {
        //Nereden
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.addCityBtn(notification1:)), name:NC, object: nil)
        
    }
    @IBAction func NereyeBtn(_ sender: Any) {
        //Nereye
        NotificationCenter.default.addObserver(self, selector: #selector(MainViewController.addCity(notification:)), name: NC, object: nil)
        
    }
    @IBAction func seferAraBtn(_ sender: Any) {
        filteredTrips.removeAll()
        for y in busTrips {
            filterData(x: y)
        }
        busTicketsTable.reloadData()
        busTicketsTable.isHidden = false
       
    }
    
}



// EXTENSİON TABLEVİEW
extension MainViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.busTicketsTable.register(UINib(nibName: "BusTableViewCell", bundle : nil),forCellReuseIdentifier: "cell")
        return filteredTrips.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = busTicketsTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BusTableViewCell {
            cell.Busimage?.image = UIImage(named: filteredTrips[indexPath.row].companyImage)
            cell.fiyatLabel?.text = String(filteredTrips[indexPath.row].fiyat)
            cell.saatLabel?.text = String(filteredTrips[indexPath.row].saat.hour)
            cell.saatMinute.text = String(filteredTrips[indexPath.row].saat.minute)
            cell.tarihLabel?.text = String(filteredTrips[indexPath.row].busDate.day)
            cell.tarihAy.text = String(filteredTrips[indexPath.row].busDate.month)
            cell.titleLabel?.text = filteredTrips[indexPath.row].businessName
        return cell
        }
       return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                performSegue(withIdentifier: "showPlace", sender : nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ReserveBusViewController {
            destination.selectedBus = busTrips[(busTicketsTable.indexPathForSelectedRow?.row)!]
            
        }
    }
}
