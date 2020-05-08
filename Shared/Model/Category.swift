//
//  Category.swift
//  E-clothes
//
//  Created by Владислав on 08.05.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation
import Firebase

struct Category{
    var name: String
    var id: String
    var pictureURL: String
    var isActive: Bool = true
    var timestamp: Timestamp
}
