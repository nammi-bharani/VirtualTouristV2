//
//  ViewController.swift
//  VirtualTouristV2
//
//  Created by Bharani Nammi on 7/20/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class TravelMapViewController: UIViewController, MKMapViewDelegate {
    
    var pins: [Pin] = []
    var downloadedPhoto:[DownloadedPhoto] = []

    var dataController:DataController!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        print("View will appear")
            
        var annotations = [MKPointAnnotation]()
        
        let coordinate = CLLocationCoordinate2D(latitude: Flickr.latAndLonAndUrl.latitude, longitude:  Flickr.latAndLonAndUrl.longitude)
        //
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.subtitle = "https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg"
        annotations.append(annotation)
        
        self.mapView.addAnnotations(annotations)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let reuseId = "pin"
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView

        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = .red
            pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            
            performSegue(withIdentifier: "PhotoView", sender: nil)
            
            
        }
    }

}

