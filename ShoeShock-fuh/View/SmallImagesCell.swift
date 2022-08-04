//
//  SmallImagesCell.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 26-06-22.
//

import UIKit

class SmallImagesCell: UICollectionViewCell {

    @IBOutlet weak var smallShoeImage: UIImageView!

    func updateImageCell(imageName: String) {
        smallShoeImage.image = UIImage(named: imageName)
    }

}
