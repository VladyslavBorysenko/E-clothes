//
//  Cart.swift
//  E-clothes
//
//  Created by Владислав on 11.05.2020.
//  Copyright © 2020 Владислав. All rights reserved.
//

import Foundation

final class Cart{
    //MARK: - Singleton
    static let shared = Cart()
    
    //MARK:- Properties
    var cartItems: [Product] = []
    private let fixedShippingPrice: Double = 300
    
    var subtotal: Double{
        var amount: Double = 0
        for item in cartItems {
            amount += item.price
        }
        return amount
    }
    
    var shippingFee: Double{
        if subtotal > 2000 || subtotal == 0 {
            return 0
        } else { return fixedShippingPrice}
    }
    
    var total: Double{
        return subtotal + shippingFee
    }
    
    //MARK: - Functions
    func addToCart(item: Product){
        cartItems.append(item)
    }
    func removeFromCart(itemIndex: Int ){
        cartItems.remove(at: itemIndex)
    }
    func removeAllItems(){
        cartItems.removeAll()
    }
    
    private init(){}
}
