//
//  Brands.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 04-08-22.
//

import Foundation


enum BrandsEnum: Int, CaseIterable {
    case Nike = 0
    case Addidas
    case Jordan
    case Puma
    case Power
    
    var title: String {
        switch self {
        case .Nike:
            return "Nike"
        case .Addidas:
            return "Addidas"
        case .Jordan:
            return "Jordan"
        case .Puma:
            return "Puma"
        case .Power:
            return "Power"
        }
    }
}
