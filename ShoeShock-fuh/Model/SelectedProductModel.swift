//
//  ShoppingCart.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 27-05-22.
//

import Foundation

class SelectedProductModel {
    
    var item: ShoeModel
    var cuantity: Int
    var subtotal: Double
    
    init(item: ShoeModel, cuantity: Int, subtotal: Double) {
        self.item = item
        self.cuantity = cuantity
        self.subtotal = subtotal
    }
    
    func updateSubtotal() {
        let itemPrice = item.price
        let cuantity = cuantity
        let subtotal = itemPrice * Double(cuantity)
        self.subtotal += subtotal
    }
}
