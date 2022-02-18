//
//  ProductModel.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 17/02/22.
//

import Foundation

class ProductModel: Codable {
    let products: [Product]

    init(products: [Product]) {
        self.products = products
    }
}


// MARK: - Product
class Product: Codable {
    let name: String
    let price: Int
    let image: String

    init(name: String, price: Int, image: String) {
        self.name = name
        self.price = price
        self.image = image
    }
    
    init(json:JSON){
        self.price = json["price"] as? Int ?? 0
        self.name = json["name"] as? String ?? ""
        self.image = json["image"] as? String ?? ""
    }
}
