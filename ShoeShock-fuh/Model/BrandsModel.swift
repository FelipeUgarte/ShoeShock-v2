//
//  BrandsModel.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 30-05-22.
//

import Foundation

struct BrandModel {
    private(set) public var id = UUID()
    private(set) public var name: String
    
    init(name: String) {
        self.name = name
    }
}
