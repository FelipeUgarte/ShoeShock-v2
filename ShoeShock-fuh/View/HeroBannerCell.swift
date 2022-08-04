//
//  HeroBannerCell.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 27-05-22.
//

import UIKit

class HeroBannerCell: UICollectionViewCell {

    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var shoeImage: UIImageView!

    let hartImage: UIImage = UIImage(systemName: "heart")!
    var like = false
    var shoeId: UUID = UUID()

    override func awakeFromNib() {
        self.backgroundColor = UIColor(named: "HeroBannerBG1")
        self.layer.cornerRadius = 10
    }
    
    func updateCell(shoes: ShoeModel) {
        brand.text = shoes.brand
        name.text = shoes.name
        price.text = String("$ \(shoes.price)")
        shoeImage.image = UIImage(named: shoes.shoeImage)
        self.like = shoes.like
        setLikeButtonImage(like: like)
        self.shoeId = shoes.id
        print("shoeId: \(shoeId)")
        print("shoes.id: \(shoes.id)")

    }

    func setLikeButtonImage(like: Bool) {
        let largeFont = UIFont.systemFont(ofSize: 20)
        let configuration = UIImage.SymbolConfiguration(font: largeFont)
        let imageName = like ? "heart.fill" : "heart"
        self.loveButton.tintColor = like ? .yellow : .white
        self.loveButton.setImage(UIImage(systemName: imageName, withConfiguration: configuration), for: .normal)
    }

    @IBAction func likeBT(_ sender: Any) {
        print("***TEST*** @IBAction shoeId: \(shoeId)")
        like.toggle()
        setLikeButtonImage(like: like)
        DataService.instance.likeShoeToggle(shoeId: shoeId)
    }
}
