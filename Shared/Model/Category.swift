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
    
    init(document: [String: Any]) {
        self.name = document["name"] as? String ?? ""
        self.id = document["id"] as? String ?? ""
        self.pictureURL = document["pictureURL"] as? String ?? ""
        self.isActive = document["isActive"] as? Bool ?? true
        self.timestamp = document["timestamp"] as? Timestamp ?? Timestamp()
    }
}
