//
//  ProductSearchedTableViewCell.swift
//  MyShop
//
//  Created by Beniamino Negrini on 25/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

class ProductSearchedTableViewCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productSupermarketNameLabel: UILabel!
    @IBOutlet weak var productpriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
