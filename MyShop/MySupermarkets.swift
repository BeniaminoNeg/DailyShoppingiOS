//
//  MySupermarkets.swift
//  MyShop
//
//  Created by Beniamino Negrini on 23/04/17.
//  Copyright © 2017 Beniamino Negrini. All rights reserved.
//

import Foundation

struct MySupermarkets {
    static var supermarkets = [MSupermarket]()
    static var current : Int = 999
    
    init() {
        if let path = Bundle.main.path(forResource: "supermarketsDB", ofType: "txt") {
            do {
                print("MARKETS Path nell' if")
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let myStrings = data.components(separatedBy: .newlines)
                print(myStrings)
                
                
                for l in myStrings {
                    let line : [String] = l.components(separatedBy: ",")
                    print("Line")
                    print(line)
                    print("elementi in riga supermercato")
                    print(line.count)
                    if (line.count == 5)  {
                        print("Buona")
                        let supermarket = MSupermarket (name : line[0], address: line[1], idMarket:line[2], latitude: Double(line[3])!, longitude: Double(line[4])!)
                        MySupermarkets.supermarkets.append(supermarket)
                    }
                    else{
                        print("Non buona")
                    }
                    print("Markets:")
                    print(MySupermarkets.supermarkets)
                    
                }
            } catch {
                print(error)
            }
        }
        else{
            print("Non nell'if")
        }
    }
}
