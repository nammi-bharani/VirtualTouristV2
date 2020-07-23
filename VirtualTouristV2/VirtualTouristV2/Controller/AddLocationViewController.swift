//
//  AddLocationViewController.swift
//  VirtualTouristV2
//
//  Created by Bharani Nammi on 7/21/20.
//  Copyright © 2020 Bharani Nammi. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class AddLocationViewController: UIViewController {
    
    @IBOutlet weak var location: UITextField!
    
    @IBAction func FindLocation(_ sender: Any) {
        
        let address = location.text!
        print(address)

        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
            else {
                print("location not found")
                return
            }
        Flickr.latAndLonAndUrl.latitude = location.coordinate.latitude
        Flickr.latAndLonAndUrl.longitude = location.coordinate.longitude
        
        let latAndLon = "&lat="+String(Flickr.latAndLonAndUrl.latitude)+"&lon="+String(Flickr.latAndLonAndUrl.longitude)
            
        Flickr.latAndLonAndUrl.fullUrl = Flickr.Endpoints.getPart1.stringValue+latAndLon+Flickr.Endpoints.getPart2.stringValue
        
        //get request
        Flickr.getPhotos { (response, error) in
        }
        print("Printing the stored full url")
        print( Flickr.latAndLonAndUrl.fullUrl)

        
        self.navigationController?.popViewController(animated: true)
        }
    }
}
