//
//  BrandCell.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 31-05-22.
//

import UIKit

class BrandCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    
    func updateBrandCell(brand: String) {
        name.text = brand
    }
}
