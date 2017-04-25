//
//  SearchViewController.swift
//  MyShop
//
//  Created by Beniamino Negrini on 25/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    var resultSearchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search"

        // Do any additional setup after loading the view.
        
        self.resultSearchController = ({
            // creo un oggetto di tipo UISearchController
            let controller = UISearchController(searchResultsController: nil)
            // rimuove la tableView di sottofondo in modo da poter successivamente visualizzare gli elementi cercati
            controller.dimsBackgroundDuringPresentation = false
            
            // il searchResultsUpdater, ovvero colui che gestirà gli eventi di ricerca, sarà la ListaTableViewController (o self)
            controller.searchResultsUpdater = self as! UISearchResultsUpdating
            
            // impongo alla searchBar, contenuta all'interno del controller, di adattarsi alle dimensioni dell'applicazioni
            controller.searchBar.sizeToFit()
            
            /*
            // atacco alla parte superiore della TableView la searchBar
            self.tableView.tableHeaderView = controller.searchBar*/
            
            // restituisco il controller creato
            return controller
        })()
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let numberOfItems = MyProducts.products.count
        return numberOfItems
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prodCellSearch", for: indexPath as IndexPath) as! ProductViewCell
        
        let currentProduct = MyProducts.products[indexPath.row]
        
        let productName = currentProduct.name
        cell.productNameLabel.text = productName
    
        cell.productPriceLabel.text = currentProduct.price
        
        
        cell.productImageView.image = MyProducts.productsImages[productName]
        
        //Market Name
        
        let productSupermarketCode = currentProduct.idMarket
        var supermarketName = ""
        
        
        if MySupermarkets.supermarkets.isEmpty {
            MySupermarkets.init()
        }
        
        for m in MySupermarkets.supermarkets {
            
            if (m.idMarket == productSupermarketCode) {
                supermarketName = m.name
            }
        }
      
        
        cell.productSupermarketName.text = supermarketName
        
        
        
        return cell
    }

}
