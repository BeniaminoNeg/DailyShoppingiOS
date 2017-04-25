//
//  SupermarketsTableViewController.swift
//  MyShop
//
//  Created by Beniamino Negrini on 23/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

class SupermarketsTableViewController: UITableViewController {
    
    //var selectedSupermarket : MSupermarket!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    @IBAction func mapButtonPressed(_ sender: UIButton) {
        
        print("vado avanti alla mappa")
        
        self.performSegue(withIdentifier: "openMap", sender: nil)
    }
    @IBAction func demoButtonPressed(_ sender: UIButton) {
        print("vado avanti alla mappa")
        
        self.performSegue(withIdentifier: "openMap", sender: nil)
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
        if MySupermarkets.supermarkets.isEmpty {
            MySupermarkets.init()
        }
        print("Il supermarket array contiene")
        print(MySupermarkets.supermarkets.count)
        print("Ziiiiiiieta")
        return MySupermarkets.supermarkets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "supermarketCell", for: indexPath) as! SupermarketTableViewCell

        // Configure the cell...
        
        cell.supermarketNameLabel.text = MySupermarkets.supermarkets[indexPath.row].name
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator // questo accessorio aggiunge il bottone a forma di freccia che punta verso destra (utile per indicare che cliccando la vista si sposta in un altro VC)
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //self.selectedSupermarket = MySupermarkets.supermarkets[indexPath.row]
        
        print("SONO QUAAAAAAAAAAAAA")
        
        MySupermarkets.current = indexPath.row
        
        print("current")
        print(MySupermarkets.current)
        
        
        
        print("vado avanti alla pag supermercato")
        
        self.performSegue(withIdentifier: "marketPressedSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        /*
        
        print("Sto nel prepare di supermarkets per andare al singolo")
        let destinationNavigationController = segue.destination as! UINavigationController
        let targetController = destinationNavigationController.topViewController as! SelectedMarketTableViewController
        print("Dopo target controller, è questo:")
        print(targetController)
        
        //let vc_destinazione = segue.destination as! SelectedCategoryViewController
        
        print("MarketCurrent")
        print(MySupermarkets.current)
        
        print("Il selected market id è")
        let selectedMarketId = MySupermarkets.supermarkets[MySupermarkets.current].idMarket
        print(selectedMarketId)
        
        print("Sto passando nel segue il seguente codice di market")
        print(selectedMarketId)
        
        targetController.thisSupermarketId=selectedMarketId
        
        
        for p in MyProducts.products {
            print("p market")
            print(p.idMarket)
            if (p.idMarket == selectedMarketId) {
                print("e di questo market")
                targetController.products.append(p)
            }
            else{
                print("Niente match market")
            }
        }*/
        
        
        
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
