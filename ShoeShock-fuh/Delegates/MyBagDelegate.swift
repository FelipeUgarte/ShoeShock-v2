//
//  MyBagDelegate.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 24-07-22.
//

import Foundation

protocol UpdateBagDelegate: AnyObject {

    func updateTotalLabel()
    func updateTableViews()
    func updateItemCountBT()
}
