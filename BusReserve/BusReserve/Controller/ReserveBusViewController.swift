//
//  ReserveBusViewController.swift
//  BusReserve
//
//  Created by Berke Alabalik on 15.02.2022.
//

import UIKit

class ReserveBusViewController: UIViewController {
    
    // VARİABLES
    var fiyat = 0
    var selectedPlace : [String] = []
    var selectedBus : BusClass?
    var count = 0
    var pathway = 3
    var chairText = 1
    
    // LABELS
    @IBOutlet weak var nrLbl: UILabel!
    @IBOutlet weak var nryLbl: UILabel!
    @IBOutlet weak var sirketImage: UIImageView!
    @IBOutlet weak var secilenKoltukLabel: UILabel!
    @IBOutlet weak var fiyatLabel: UILabel!
    @IBOutlet weak var sirketIsmiLabel: UILabel!
   
    @IBOutlet weak var seatsCollectionView: UICollectionView!
    
    //ALERT : 5'den Fazla Koltuk Durumu
    let alert = UIAlertController(title: "Fazla Koltuk Seçildi", message: "Lütfen 5'den Az Koltuk Seçiniz!", preferredStyle: UIAlertController.Style.alert)
    //ALERT Koltuk boşmu Dolumu
    let alertIsFull = UIAlertController(title: "Koltuk Dolu", message: "Lütfen Başka Bir Koltuk Seçiniz!", preferredStyle: UIAlertController.Style.alert)
    // ALERT : Koltuk Seçildi mi
    let alertisSelected = UIAlertController(title: "Koltuk Seçimi Yapınız!", message: "Koltuk Seçimi Yapmalısınız.", preferredStyle: UIAlertController.Style.alert)

    let collviewcellid = "busPlaceCollectionViewCell"
    @IBOutlet weak var koltuklarCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // LABELS TEXT Assign
        koltuklarCollectionView.reloadData()
        sirketIsmiLabel.text = selectedBus?.businessName
        sirketImage.image = UIImage(named: selectedBus?.companyImage ?? "nil")
        nrLbl.text = selectedBus?.neredenBus
        nryLbl.text = selectedBus?.nereyeBus
        
        // ALERTS
        alert.addAction(UIAlertAction(title: "Tamam",style:UIAlertAction.Style.default,handler: nil))
        alertisSelected.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        alertIsFull.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default, handler: nil))
        
        
        count = 0
        navigationController?.navigationBar.isHidden = false
        let nibcell = UINib(nibName: collviewcellid, bundle: nil)
        koltuklarCollectionView.register(nibcell, forCellWithReuseIdentifier: collviewcellid)
    }
    
    
    // Selected Chair remove from string and Array .
    private func removeFromArr(id : Int) {
        print(String(id + 1))
        if let index = selectedPlace.firstIndex(where: {$0 == String(id + 1) })
        {
            selectedPlace.remove(at: index)
        }
        
    }
    
  
    @IBAction func guvenliodemeBtn(_ sender: Any) {
        if selectedPlace.isEmpty == true {
            self.present(alertisSelected, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: "showOdeme", sender : nil)
            
        }
    }
    // VARİABLES SENDED
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? OdemePageViewController {
            destination.buyedBus = selectedBus
            destination.buyPrice = fiyat
            destination.buyedPlace = selectedPlace
            
        }
    }
    
}

/// COLLECTİON BAR

extension ReserveBusViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return selectedBus?.koltukdüzeni.count ?? 45
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell2 = koltuklarCollectionView.dequeueReusableCell(withReuseIdentifier: collviewcellid, for: indexPath) as? busPlaceCollectionViewCell
        if let cell = koltuklarCollectionView.dequeueReusableCell(withReuseIdentifier: collviewcellid, for: indexPath) as? busPlaceCollectionViewCell{
            chairText = indexPath.row + 1
            cell2?.isHidden = true
            if indexPath.row + 1  == pathway {
                if pathway < 37 {
                    pathway = pathway + 5
                }
                return cell2!
            }
            
            
            cell.placeNumber.text = String(indexPath.row + 1)
            if selectedBus?.koltukdüzeni[indexPath.row + 1] == true {
                cell.backgroundColor = .systemGray2
                }
            return cell
           
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if cell?.backgroundColor == .orange {
            fiyat = fiyat - selectedBus!.fiyat
            fiyatLabel.text = String(fiyat)
            removeFromArr(id: indexPath.row)
            let stringRepresentation = selectedPlace.joined(separator: ",")
            count = count - 1
            secilenKoltukLabel.text = stringRepresentation
            cell?.backgroundColor = .white
           
        }
        else if selectedBus?.koltukdüzeni[indexPath.row + 1] == true {
            present(alertIsFull, animated: true, completion: nil)
        } else {
            fiyat = fiyat + selectedBus!.fiyat
            fiyatLabel.text = String(fiyat)
            count = count + 1
            cell?.backgroundColor = .orange
            selectedPlace.append(String(indexPath.row + 1))
            let stringRepresentation = selectedPlace.joined(separator: ",")
            secilenKoltukLabel.text = stringRepresentation
            if count == 5 {
            self.present(alert, animated: true, completion: nil)
            }
        }
      
    }
}

