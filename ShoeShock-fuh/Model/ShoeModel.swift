//
//  ShoeModel.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 27-05-22.
//

import Foundation

class ShoeModel {
    private(set) public var id = UUID()
    private(set) public var name: String
    private(set) public var brand: String
    private(set) public var price: Double
    private(set) public var shoeImage: String
    private(set) public var shoeDescription: String
    private(set) public var shoeAditionalImages: [String]
    private(set) public var like: Bool
    
    init(name: String, brand: String, price: Double, shoeImage: String, shoeDescription: String, shoeAditionalImages: [String], like: Bool) {
        self.name = name
        self.brand = brand
        self.price = price
        self.shoeImage = shoeImage
        self.shoeDescription = shoeDescription
        self.shoeAditionalImages = shoeAditionalImages
        self.like = like
    }

    func likeToggle(){
        self.like.toggle()
    }
}
