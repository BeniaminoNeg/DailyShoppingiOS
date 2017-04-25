//
//  SelectedCategoryViewController.swift
//  MyShop
//
//  Created by Beniamino Negrini on 23/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

class SelectedCategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var productsCategory = [MProduct]()
    
    @IBOutlet weak var productOfcategoryCollectionView: UICollectionView!
    var selectedCategory:String = String()
    
    @IBAction func unwindSegue(_ sender: UIBarButtonItem) {
        
        
        print("vado indietro")
        
        self.performSegue(withIdentifier: "backToCategories", sender: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
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
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    func getProdThisCategory() -> [MProduct] {
        var productscategory = [MProduct]()
        let thiscategorycode = MyCategoryChoosen.categoriesCodes[MyCategoryChoosen.selectedCategoryInt]
        
        print("Cate code")
        print(thiscategorycode)
        
        for p in MyProducts.products {
            print("p categoria")
            if p.category == thiscategorycode {
                productscategory.append(p)
            }
        }
        return productscategory
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //questo valore serve per far capire alla Collection View quante celle devono essere visualizzate
        print("Number of items")
        
        self.productsCategory = self.getProdThisCategory()
        
        print(productsCategory.count)
        return productsCategory.count
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prodCell", for: indexPath as IndexPath) as! ProductViewCell
        

        
        let currentProduct = productsCategory[indexPath.row]
        
        let productName = currentProduct.name
        cell.productNameLabel.text = productName
        cell.productPriceLabel.text = currentProduct.price
        
        cell.productImageView.image = MyProducts.productsImages[productName]
        
        //Market Name
        
        let productSupermarketCode = currentProduct.idMarket
        var supermarketName = ""
        
        print("Product Market Code")
        print(productSupermarketCode)
        
        if MySupermarkets.supermarkets.isEmpty {
            MySupermarkets.init()
        }
        
        for m in MySupermarkets.supermarkets {
            print("m id market")
            print(m.idMarket)
            if (m.idMarket == productSupermarketCode) {
                supermarketName = m.name
            }
        }
        
        
        cell.productSupermarketName.text = supermarketName

        
        return cell
    }


}
