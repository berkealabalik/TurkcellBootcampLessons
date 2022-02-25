//
//  MapViewController.swift
//  Week7-Lesson
//
//  Created by Berke Alabalik on 19.02.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var adresLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    
    let locationManager = CLLocationManager() // Cihazdan Lokasyonla ilgili tüm olayları dinleyen yapı .
    var lastLocation: CLLocation?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationService()
        // Do any additional setup after loading the view.
    }
    
    
    // FONKSİYONLAR

    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func showUserLocationCenterMap() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 100, longitudinalMeters: 100) // çap ve en
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationService(){
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // MARK : Kullanıcıyı Ayarlardan Konum servisini açmak için yönlendir .
        }
    }
    func trackingLocation() {
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
        locationManager.stopUpdatingLocation()
        lastLocation = getCenterLocation(mapView: mapView)
    }
    
    // KULLANICI İZNİ VARMI YOKMU METODU
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined: // ilk defa açtı sordu ilk case burası
            locationManager.requestWhenInUseAuthorization()
            print("Kullanıcı İzni henüz verilmemiş")
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            print("Kullanıcı İzni Alınmış")
            trackingLocation()
            break
        }
    }
    
    

    
    func getCenterLocation(mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
        
        
    }
  
// EXTENSİONS
    
}

extension MapViewController : CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) { // kullanıcı izni değiştirilmişmi baştan sonra onu dinliyor
        checkLocationAuthorization()
    }
}

extension MapViewController : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(mapView: mapView)
        let geoCoder = CLGeocoder()
        
        guard let lastLocation = lastLocation else { return }
        guard center.distance(from: lastLocation) > 30 else { return } // sürekli location almaz batarya efficiency sağlar 30 yüksekse check eder
        self.lastLocation = center
        geoCoder.reverseGeocodeLocation(center) { [weak self] placemarks, error in
            guard let self = self else { return }
            if let error = error {
                print("Hata \(error)")
                return
            }
            guard let placemark = placemarks?.first else { return }
            let city = placemark.locality ?? "City" // locality sehri verir
            let street = placemark.thoroughfare ?? "Street"
            
            self.adresLabel.text = "\(city) - \(street)"
        }
    }
}

// HARita uygulaması tam adres yapın .Getir adres bulma gibi


