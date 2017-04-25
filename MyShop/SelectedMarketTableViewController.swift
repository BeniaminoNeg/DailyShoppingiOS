//
//  SelectedMarketTableViewController.swift
//  MyShop
//
//  Created by Beniamino Negrini on 23/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit
import CoreLocation

class SelectedMarketTableViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var productsOfMarketCollectionView: UICollectionView!
    //var thisSupermarket : MSupermarket!
    
    var thisSupermarketId = String()
    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocation()
    
    
    
    
    //var products: [MProduct] = [MProduct]()
    
    @IBOutlet weak var mapButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentMarket = MySupermarkets.supermarkets[MySupermarkets.current]
        self.title = currentMarket.name
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        print("User location")
        print(userLocation)
        
        
        displayDistance()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let uLocation:CLLocation = locations[0] as! CLLocation
        print("User location")
        print(uLocation)
        self.userLocation = uLocation
    }
    
    func displayDistance()  {
        let currentMarket = MySupermarkets.supermarkets[MySupermarkets.current]
        let mLatitude:CLLocationDegrees = currentMarket.latitude
        let mLongitude:CLLocationDegrees = currentMarket.longitude
        let marketLocation:CLLocation = CLLocation(latitude: mLatitude, longitude: mLongitude)
        
        //Troviamo la distanza
        
        
        let distance = userLocation.distance(from: marketLocation)
        
        print("Distanza")
        print(distance)
        
        let distanceLabeltext = "Distance: "+String(distance)+"km"
        
        self.distanceLabel.text = distanceLabeltext
    }
    
    /*
    @IBAction func mapButton(_ sender: UIBarButtonItem) {
        print("vado avanti alla mappa")
        
        self.performSegue(withIdentifier: "openMap", sender: nil)
    }*/
    
    @IBAction func mapButtonPressed(_ sender: UIButton) {
        print("vado avanti alla mappa")
        
        self.performSegue(withIdentifier: "openMap", sender: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        
        print("vado indietro ")
        
        self.performSegue(withIdentifier: "marketBackToHome", sender: nil)
    }
    
    @IBOutlet weak var distanceLabel: UILabel!

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
        
        //questo valore serve per far capire alla Collection View quante celle devono essere visualizzate
        
        let currentMarket = MySupermarkets.supermarkets[MySupermarkets.current]
        let currentMarketId  = currentMarket.idMarket
        
        var products = [MProduct]()
        
        for p in MyProducts.products {
            if p.idMarket == currentMarketId {
                products.append(p)
            }
        }
        
        let numberOfItems = products.count
        print("Number of items")
        print(numberOfItems)
        return numberOfItems
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prodCell", for: indexPath as IndexPath) as! ProductViewCell
        
        let currentMarket = MySupermarkets.supermarkets[MySupermarkets.current]
        let currentMarketId  = currentMarket.idMarket
        
        var products = [MProduct]()
        
        for p in MyProducts.products {
            if p.idMarket == currentMarketId {
                products.append(p)
            }
        }
        
        print("Questi sono i products")
        print(products)
        
        let currentProduct = products[indexPath.row]
        
        let productName = currentProduct.name
        cell.productNameLabel.text = productName
        cell.productPriceLabel.text = currentProduct.price
        
        cell.productImageView.image = MyProducts.productsImages[productName]
        
        //Market Name
        
        
        let supermarketName = currentMarket.name
        
        cell.productSupermarketName.text = supermarketName
        
        
        return cell
    }

}
