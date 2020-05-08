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
}
