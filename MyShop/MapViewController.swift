//
//  MapViewController.swift
//  MyShop
//
//  Created by Beniamino Negrini on 23/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    

    @IBOutlet weak var myMapView: MKMapView!
    
    var managerPosizione: CLLocationManager!
    var posizioneUtente: CLLocationCoordinate2D!
    
    var thisSupermarket = MySupermarkets.supermarkets[MySupermarkets.current]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.myMapView.delegate = self
        self.managerPosizione = CLLocationManager()
        
        managerPosizione.delegate = self
        managerPosizione.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        managerPosizione.requestWhenInUseAuthorization()
        managerPosizione.startUpdatingLocation()
        
        print("Nella mappa, il mio market è")
        print(self.thisSupermarket)
        
        print("Inside market latitude")
        print(self.thisSupermarket.latitude)
        
        print("inside market longitude")
        print(self.thisSupermarket.longitude)
        
        let latitude:CLLocationDegrees = self.thisSupermarket.latitude
        let longitude:CLLocationDegrees = self.thisSupermarket.longitude
        
        print("Latitude")
        print(latitude)
        print("Longitude")
        print(longitude)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(1, 1)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        myMapView.setRegion(region, animated: true)
        
        let annotation = MyAnnotation(title: self.thisSupermarket.name, coordinate: location)
        
        myMapView.addAnnotation(annotation)

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
