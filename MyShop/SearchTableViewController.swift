//
//  SearchTableViewController.swift
//  MyShop
//
//  Created by Beniamino Negrini on 25/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredProducts = [MProduct]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hey1")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        /*
        self.resultSearchController = ({
            // creo un oggetto di tipo UISearchController
            let controller = UISearchController(searchResultsController: nil)
            // rimuove la tableView di sottofondo in modo da poter successivamente visualizzare gli elementi cercati
            controller.dimsBackgroundDuringPresentation = false
            
            // il searchResultsUpdater, ovvero colui che gestirà gli eventi di ricerca, sarà la ListaTableViewController (o self)
            controller.searchResultsUpdater = self
            
            // impongo alla searchBar, contenuta all'interno del controller, di adattarsi alle dimensioni dell'applicazioni
            controller.searchBar.sizeToFit()
            
            // atacco alla parte superiore della TableView la searchBar
            self.tableView.tableHeaderView = controller.searchBar
            
            // restituisco il controller creato
            return controller
        })()*/
        
        print("Hey2")
        
        searchController.searchResultsUpdater = self
        print("Hey3")
        searchController.searchBar.delegate = self
        print("Hey4")
        searchController.dimsBackgroundDuringPresentation = false
        print("Hey5")
        definesPresentationContext = true
        print("Hey6")
        tableView.tableHeaderView = searchController.searchBar
        print("Hey7")
    }
    
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredProducts = MyProducts.products.filter { product in
            return product.name.lowercased().contains(searchText.lowercased())
        }
        
        tableView.reloadData()
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Hey61")
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredProducts.count
        }
        print("Hey62")
        let myprodutscount = MyProducts.products.count
        print("Hey63")
        print(myprodutscount)
        return myprodutscount
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Hey8")
        let cell = tableView.dequeueReusableCell(withIdentifier: "productSearchedCell", for: indexPath) as! ProductSearchedTableViewCell

        print("Hey8")
        let currentProduct: MProduct
        if searchController.isActive && searchController.searchBar.text != "" {
            currentProduct = filteredProducts[indexPath.row]
        } else {
            currentProduct = MyProducts.products[indexPath.row]
        }
        print("Hey9")
        // Configure the cell...
        
        //let currentProduct = MyProducts.products[indexPath.row]
        
        let productName = currentProduct.name
        cell.productNameLabel.text = productName
        
        cell.productpriceLabel.text = currentProduct.price
        
        
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
        
        
        cell.productSupermarketNameLabel.text = supermarketName

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchTableViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("Mammeta")
        filterContentForSearchText(searchText: searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}

extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("Zieta")
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
}
