//
//  ViewController.swift
//  MapCiudades
//
//  Created by KMMX on 27/10/20.
//

import UIKit
import MapKit

class CityDetail: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapa: MKMapView!
        
    var ciudad: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapa.delegate=self
                
        guard let city = ciudad else {return}
        
        mapa.addAnnotation(city)
               
                
        let localization = CLLocation(latitude: city.coordinate.latitude, longitude: city.coordinate.longitude)
                
        let regionRadius: CLLocationDistance = 100000.0
                
        let region = MKCoordinateRegion(center: localization.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapa.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            
            guard annotation is City else { return nil }
            
            let identifier = "City"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                let btn = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = btn
            }else{
                annotationView?.annotation = annotation
            }
            return annotationView
        }
        
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let city = view.annotation as? City else { return }
            let placeName = city.title
            let placeInfo = city.info
            let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title:"OK", style: .default))
            present(ac, animated: true)
        }
}

