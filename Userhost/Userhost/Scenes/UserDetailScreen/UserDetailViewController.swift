//
//  UserDetailViewController.swift
//  Userhost
//
//  Created by Berke Alabalik on 5.04.2022.
//

import UIKit
import MapKit
class UserDetailViewController: UIViewController{
    var viewModel : UserInformationModelProtocol?
    @IBOutlet weak var OuterView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    private func configureView() {
        OuterView.layer.cornerRadius = 20
        guard let user = viewModel?.user else {
            return
        }
        nameLabel.text = (user.username ?? "") + " | " + (user.name ?? "")
        mailLabel.text = "Mail : " +  (user.email ?? "")
        phoneLabel.text = "Phone : " +  (user.phone ?? "")
        websiteLabel.text = "Website : " +  (user.website ?? "")
        adressLabel.text = (user.address?.street ?? "") + (user.address?.suite ?? "")
        cityLabel.text = (user.address?.city ?? "") + " " + (user.address?.zipcode ?? "")
        //-------MAP
        let plat = Double(user.address?.geo?.lat ?? "10")!
        let plong = Double(user.address?.geo?.lng ?? "10")!
        let center = CLLocationCoordinate2D(latitude: plat, longitude: plong )
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 50 , longitudeDelta: 50))
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        mapView.layer.cornerRadius = 10
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
}
