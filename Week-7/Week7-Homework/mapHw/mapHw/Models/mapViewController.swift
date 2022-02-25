//
//  mapViewController.swift
//  mapHw
//
//  Created by Berke Alabalik on 24.02.2022.
//


import UIKit
import MapKit

class mapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var adressTagField: UITextField!
    @IBOutlet weak var adressField: UITextField!
    @IBOutlet weak var buildingNoField: UITextField!
    @IBOutlet weak var aptField: UITextField!
    @IBOutlet weak var floorField: UITextField!
    
    let locationManager = CLLocationManager()
    var lastLocation: CLLocation?
    
    var city = ""
    var street = ""
    var streetNum = ""
    var region = ""
    var mah = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "Yeni Adres Ekle"
        // Do any additional setup after loading the view.
        checkLocationServices()
    }
    @IBAction func addLocation(_ sender: Any) {
        adressField.text = "\(mah) Mah. \(street) \(region) / \(city)  "
        
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func showUserLocationCenterMap() {
        if let location = locationManager.location?.coordinate  {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //MARK: Kullanıcıyı ayarlardan konum servisini açmak için yönlendir
        }
    }

    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            print("Kullanıcı izni alınmış")
            trackingLocation()
            break
        }
    }
    
    func trackingLocation() {
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
        locationManager.startUpdatingLocation()
        lastLocation = getCenterLocation(mapView: mapView)
    }
    
    func getCenterLocation(mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}

extension mapViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

extension mapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(mapView: mapView)
        let geoCoder = CLGeocoder()
        
        guard let lastLocation = lastLocation else { return }
        
        guard center.distance(from: lastLocation) > 10 else { return }
        self.lastLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] placemarks, error in
            guard let self = self else { return }
            if let error = error {
                print("Hata: \(error)")
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            self.city = placemark.administrativeArea ?? "City" // Şehir
            self.street = placemark.thoroughfare ?? "Street" // Cadde adı
            self.streetNum = placemark.subThoroughfare ?? "Street Num" // apartman no
            self.mah = placemark.subLocality ?? "region" //
            self.region = placemark.subAdministrativeArea ?? "çankaya"
            print(self.city)
            
        }
    }
}

//MARK: Harita uygulamasında tam adresinizi belirleyecek pinleme yapınız
