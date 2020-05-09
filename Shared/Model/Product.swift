//
//  Product.swift
//  E-clothes
//
//  Created by Владислав on 08.05.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation
import Firebase

struct Product {
    var name: String
    var id: String
    var productDescription: String
    var price: Double
    var stock: Int
    var imageURL: String
    var timestamp: Timestamp
    var category: String
    
    init(data: [String: Any]) {
        self.name = data["name"] as? String ?? ""
        self.id = data["id"] as? String ?? ""
        self.productDescription = data["productDescription"] as? String ?? ""
        self.price = data["price"] as? Double ?? 0
        self.stock = data["stock"] as? Int ?? 0
        self.imageURL = data["imageURL"] as? String ?? ""
        self.timestamp = data["timestamp"] as? Timestamp ?? Timestamp()
        self.category = data["category"] as? String ?? ""
    }
}
