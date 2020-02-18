//
//  MapViewController.swift
//  hackatonApp
//
//  Created by Eduardo Antonio Terrero Cabrera on 14/02/2020.
//  Copyright © 2020 Eduardo Antonio Terrero Cabrera. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController{
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    let userHavePopUp:Bool = true
    
    var points:[AppElement] = []
    
    override func viewDidLoad() {
        mapView.showsUserLocation = true
        checkLocationServices()
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addMarkers(data: points)
    }
    
    func setupLocationManager () {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices () {
        
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }
        else {
            //
        }
    }
    func centerViewOnUserLocation () {
        
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 3000, longitudinalMeters: 3000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    func addMarkers (data: [AppElement]) {
        
        for items in data {
            let point = CLLocationCoordinate2D( latitude: items.latitude!,  longitude: items.longitude!)
            let anotation = MKPointAnnotation()
            anotation.coordinate = point
            anotation.title = items.name.map { $0.rawValue }
            mapView.addAnnotation(anotation)
        }
        
    }
    func checkLocationAuthorization () {
        
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            let apiManager = ApiManger()
            apiManager.getAllData(File: "listAppJSON", completion:{ appResult in
                self.CreatListApp(ArrayApp:appResult)
            })
            locationManager.startUpdatingLocation()
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .authorizedAlways:
            centerViewOnUserLocation()
            break
        @unknown default:
            print ("ok")
        }
        
    }
    
    func CreatListApp(ArrayApp arrayApp:App){
        points = arrayApp.compactMap( {result in
            AppElement(id: result.id, name: result.name, image: result.image, date: result.date, time: result.time, event: result.event, latitude: result.latitude, longitude: result.longitude) })
        addMarkers(data: points)
    }
}

extension MapViewController: CLLocationManagerDelegate,MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        
    }
}


