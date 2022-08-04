//
//  MoreShoeCell.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 31-05-22.
//

import UIKit

class MoreShoeCell: UICollectionViewCell {
    
    @IBOutlet weak var nameMoreShoe: UILabel!
    @IBOutlet weak var brandMoreShoe: UILabel!
    @IBOutlet weak var priceMoreShoe: UILabel!
    @IBOutlet weak var shoeImageMoreShoe: UIImageView!
    
//    upcomingBT.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)

    override func awakeFromNib() {
        brandMoreShoe.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        self.layer.cornerRadius = 10
    }
    func getMoreShoes(shoe: ShoeModel) {
        nameMoreShoe.text = shoe.name
        brandMoreShoe.text = shoe.brand
        priceMoreShoe.text = String("$ \(shoe.price)")
        shoeImageMoreShoe.image = UIImage(named: shoe.shoeImage)
    }
    
}
