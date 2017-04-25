//
//  MProduct.swift
//  MyShop
//
//  Created by Beniamino Negrini on 05/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

class MProduct: NSObject {
    
    //MARK Properties
    var idProduct: String = "00"
    var name: String = ""
    var price: String = ""
    var idMarket: String = "0"
    var category: String = "N"
    
    init(idProduct:String, name:String, price: String, idMarket: String, category : String) {
        self.idProduct=idProduct
        self.name=name
        self.price=price
        self.idMarket=idMarket
        self.category=category
        
    }
    override init() {
        super.init()
    }
    
    

}
