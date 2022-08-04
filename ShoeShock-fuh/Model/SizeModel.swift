//
//  SizeModel.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 01-06-22.
//

import Foundation

struct SizeModel {
    var id = UUID()
    var sizeNumber: String
    
    init(sizeNumber: String) {
        self.sizeNumber = sizeNumber
    }
}
