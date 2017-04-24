//
//  productViewCell.swift
//  MyShop
//
//  Created by Beniamino Negrini on 21/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

class ProductViewCell: UICollectionViewCell {
    
    /*
    
    @IBOutlet weak var productImageView: UIImageView!*/
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productSupermarketName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    
}
