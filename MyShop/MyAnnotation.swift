//
//  MyAnnotation.swift
//  MyShop
//
//  Created by Beniamino Negrini on 23/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: NSObject,MKAnnotation {
    
    var title : String?
    var coordinate : CLLocationCoordinate2D
    
    init(title:String,coordinate : CLLocationCoordinate2D){
        
        self.title = title;
        self.coordinate = coordinate;
        
    }
    
}
