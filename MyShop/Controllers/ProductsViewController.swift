//
//  ProductsViewController.swift
//  MyShop
//
//  Created by Beniamino Negrini on 21/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import UIKit

private let reuseIdentifier = "prodCell"

fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

class ProductsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    //@IBOutlet var productsCollectionView: UICollectionView!
    //@IBOutlet weak var productsCollectionView: UICollectionView!
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.productsCollectionView.dataSource = self
        //self.productsCollectionView.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.productsCollectionView.register(ProductViewCell.self, forCellWithReuseIdentifier: reuseIdentifier) porca troia!

        // Do any additional setup after loading the view.
        
        print("Sono nel did load")
        
        if MyProducts.products.isEmpty {
            print("Lo sto poolando perchè è vuoto")
            populateArray()
            populateImages()
        }
        
        
        
    }
    func populateImages()  {
        for p in MyProducts.products {
            print("Vado a cercare la seguente immagine")
            let imageName = p.name
            print(imageName)
            let currentProductImage = UIImage(named: imageName)
            print("Ora è questa immagine")
            print(currentProductImage!)
            MyProducts.productsImages[p.name]=currentProductImage
        }
        print("Queste sono le imaggini")
        print(MyProducts.productsImages)
    }
    
    func populateArray()  {
        //var myStrings = [String]()
        
        
        /*
        if let path = Bundle.main.path(forResource: "Test", ofType: "txt"){
            print("Path nell' if")
            
        }
        else{
            print("Non nell'if")
        }*/
        
        if let path = Bundle.main.path(forResource: "productsDB", ofType: "txt") {
            do {
                print("Path nell' if")
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                print(myStrings)
                
                
                for l in myStrings {
                    let line : [String] = l.components(separatedBy: ",")
                    print("Line")
                    print(line)
                    //print(line.count)
                    if (line.count == 5)  {
                        print("Buona")
                        let product = MProduct (idProduct: line[0], name: line[1], price: line[2], idMarket: line[3], category: line[4])
                        
                        MyProducts.products.append(product)
                        print("Products")
                        print(MyProducts.products)
                    }
                    else{
                        print("Non buona")
                    }
                    
                }
            } catch {
                print(error)
            }
        }
        else{
            print("Non nell'if")
        }

        
        
        
    

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Home"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

      func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

/*
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print("Number of sections")
        print(products.count)
        return products.count
    }*/
/*
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "ProductCell"
        
        print("Sono appen aprima del guard")
        
        guard let cell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ProductViewCell else {
            fatalError("It isn't a productCell")
        }
    
        // Configure the cell
        
        print("Sto configurando la cell")
        
        cell.productNameLabel.text = self.products[indexPath.row].name
        cell.productPriceLabel.text = self.products[indexPath.row].price
    
        return cell
    }*/

    // MARK: - UICollectionViewDataSource protocol
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //questo valore serve per far capire alla Collection View quante celle devono essere visualizzate
        print("Number of items")
        print(MyProducts.products.count)
        return MyProducts.products.count
    }
    
     func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "prodCell", for: indexPath as IndexPath) as! ProductViewCell
        
        //impostiamo l'immagine e il testo della label con quelli precedentemente dichiarati nelle due variabili
        print("Sto configurando la cell")
        
        print("Soreta")
        
        print("index path row")
        print(indexPath.row)
        
        print("Poducts")
        print(MyProducts.products)
        
        print("Product 0")
        print(MyProducts.products[0])
        
        print("product name")
        print(MyProducts.products[0].name)
        
        print("tipo di Cell")
        print(type(of: cell))
        
        print("Poco prima del fattaccio")
        
        
        
        if (cell.productNameLabel != nil) {
            print("cell product name label non è nil")
        } else{
            print("cell product name label è nil")
        }
        
        if (cell.productNameLabel.text != nil) {
            print("il text nel label non è nil")
            print("il suo valore è")
            print(cell.productNameLabel.text!)
        }
        else{
            print("è il text che è nil")
        }
        
        let currentProduct = MyProducts.products[indexPath.row]
        
        let productName = currentProduct.name
        cell.productNameLabel.text = productName
        print("Mammeta")
        cell.productPriceLabel.text = currentProduct.price
        print("Zieta")
        
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
        
        print("Il market name è")
        print(supermarketName)
        
        cell.productSupermarketName.text = supermarketName
        
        
        
        
        
        print("Dovrebbe essere passato di qua")
        
        return cell
    }
    /*
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Number of sections")
        print(products.count)
        return products.count
    }*/
    
    /*
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! ProductViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
        print("Sto configurando la cell")
        
        cell.productNameLabel.text = self.products[indexPath.row].name
        cell.productPriceLabel.text = self.products[indexPath.row].price
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }*/
    
    // MARK: - UICollectionViewDelegate protocol
    



    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
