//
//  CategoriesTableViewController.swift
//  MyShop
//
//  Created by Beniamino Negrini on 22/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

class CategoriesTableViewController: UITableViewController {
    
    var categories = ["Foods","Drinks","Other"]
    
    var categoriesCodes = ["F","D","O"]
    
    var selectedCategoryInt : Int = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        // #warning Incomplete implementation, return the number of rows
        return self.categories.count
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)

        // Configure the cell...
        
        let categoria = self.categories[indexPath.row]
        
        cell.textLabel?.text = categoria
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator // questo accessorio aggiunge il bottone a forma di freccia che punta verso destra (utile per indicare che cliccando la vista si sposta in un altro VC)


        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //self.selectedSupermarket = MySupermarkets.supermarkets[indexPath.row]
        
        self.selectedCategoryInt = indexPath.row
        
        
        
        self.performSegue(withIdentifier: "showCategoryProducts", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let destinationNavigationController = segue.destination as! UINavigationController
        let targetController = destinationNavigationController.topViewController as! SelectedCategoryViewController
        
        //let vc_destinazione = segue.destination as! SelectedCategoryViewController
        
        print("Sto passando nel segue il seguente codice di categoria")
        print(self.categoriesCodes[self.selectedCategoryInt])
        print("Soreta")
        targetController.selectedCategory = self.categoriesCodes[self.selectedCategoryInt]
        
        print("selected category")
        print(targetController.selectedCategory)
        
        
        for p in MyProducts.products {
            print("p category")
            print(p.category)
            if (p.category == targetController.selectedCategory) {
                print("Alè match")
                targetController.products.append(p)
            }
            else{
                print("Niente match cteg")
            }
        }
 
        
        
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
