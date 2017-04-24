//
//  MSupermarket.swift
//  MyShop
//
//  Created by Beniamino Negrini on 20/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

class MSupermarket: NSObject {
    
    var name = ""
    var address = ""
    var idMarket = "0"
    var latitude:Double = Double()
    var longitude:Double = Double()
    
    init(name : String, address: String, idMarket:String, latitude : Double, longitude:Double) {
        self.name = name
        self.address = address
        self.idMarket = idMarket
        self.latitude = latitude
        self.longitude = longitude
    }
    
        
}
