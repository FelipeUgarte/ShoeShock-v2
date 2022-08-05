//
//  DataService.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 27-05-22.
//

import Foundation
import Combine

class DataService {
    static let instance = DataService()


    // MARK: - Shoes
    private var shoes = [
        ShoeModel(name: "Shoe1",
                  brand: "Nike",
                  price: 2.4,
                  shoeImage: "shoe1-puma",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe1-puma",
                    "shoe1-puma",
                    "shoe1-puma",
                    "shoe1-puma",
                    "shoe1-puma"
                  ],
                  like: false
                 ),
        ShoeModel(name: "Shoe2",
                  brand: "Nike",
                  price: 3.5,
                  shoeImage: "shoe2-weinbrenner",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner"
                  ],
                  like: false
                 ),
        ShoeModel(name: "Shoe3",
                  brand: "Nike",
                  price: 129.99,
                  shoeImage: "shoe3-under-armour",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe3-under-armour",
                    "shoe3-under-armour",
                    "shoe3-under-armour",
                    "shoe3-under-armour",
                    "shoe3-under-armour"
                  ],
                  like: false
                 ),
        ShoeModel(name: "Shoe4",
                  brand: "Nike",
                  price: 129.99,
                  shoeImage: "shoe4-power",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe4-power",
                    "shoe4-power",
                    "shoe4-power",
                    "shoe4-power",
                    "shoe4-power"
                  ],
                  like: false
                 )
    ]
    
    func getShoes() -> [ShoeModel] {
        return shoes
    }

    
    // MARK: - Shoes

    private var shoesListDetail = [
        ShoeModel(name: "Shoe1",
                  brand: "Nike",
                  price: 129.99,
                  shoeImage: "shoe1-puma",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe1-puma",
                    "shoe1-puma",
                    "shoe1-puma",
                    "shoe1-puma",
                    "shoe1-puma"
                  ],
                  like: false
                 ),
        ShoeModel(name: "Shoe2",
                  brand: "Nike",
                  price: 129.99,
                  shoeImage: "shoe2-weinbrenner",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner",
                    "shoe2-weinbrenner"
                  ],
                  like: false
                 ),
        ShoeModel(name: "Shoe3",
                  brand: "Nike",
                  price: 129.99,
                  shoeImage: "shoe3-under-armour",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe3-under-armour",
                    "shoe3-under-armour",
                    "shoe3-under-armour",
                    "shoe3-under-armour",
                    "shoe3-under-armour"
                  ],
                  like: false
                 ),
        ShoeModel(name: "Shoe4",
                  brand: "Nike",
                  price: 129.99,
                  shoeImage: "shoe4-power",
                  shoeDescription: Constants.instance.shoeDescriptions,
                  shoeAditionalImages: [
                    "shoe4-power",
                    "shoe4-power",
                    "shoe4-power",
                    "shoe4-power",
                    "shoe4-power"
                  ],
                  like: false
                 )
    ]
    
    func getMoreShoes() -> [ShoeModel] {
        return shoesListDetail
    }
    
    
    // MARK: - Size
    
    private let size: [SizeModel] = [
        SizeModel(sizeNumber: "7"),
        SizeModel(sizeNumber: "7.5"),
        SizeModel(sizeNumber: "8"),
        SizeModel(sizeNumber: "8.5"),
        SizeModel(sizeNumber: "9"),
        SizeModel(sizeNumber: "9.5"),
        SizeModel(sizeNumber: "10")
    ]
    
    func getSizes() -> [SizeModel] {
        return size
    }


    // MARK: - MayBag
    private var bag: MyBagModel = MyBagModel(product: [])


    // MARK: - MayBag Methods

    func getBag() -> MyBagModel {
        return bag
    }

    func addProductToBag(shoeId: UUID) {
        let newId = shoeId

        guard checkShoeOnBag(newId) else {
            let shoeToAdd = self.shoes[getShoeIndex(newId)]
            let bagShoeToAdd = BagProductsModel(id: shoeToAdd.id, name: shoeToAdd.name, image: shoeToAdd.shoeImage, price: shoeToAdd.price, quantity: 1)
            bag.bagProducts.append(bagShoeToAdd)
            return
        }
        let index = getBagProductIndex(newId)
        changeQuantity(newQuantity: bag.bagProducts[index].quantity + 1, productId: newId)
    }

    func removeShoe(_ product: Int) {
        guard !bag.bagProducts.isEmpty else {
            print("No more products to remove")
            return
        }
        bag.bagProducts.remove(at: product)
    }

    func changeQuantity(newQuantity: Int, productId: UUID) {
        for product in bag.bagProducts {
            if product.id == productId {
                product.changeQuantity(newQuantity)
                if product.quantity == 0 {
                    removeShoeWithId(productId)
                }
            }
        }
    }

    func likeShoeToggle(shoeId: UUID) {
        shoes[getShoeIndex(shoeId)].likeToggle()
        addProductToBag(shoeId: shoeId)

    }

    
    // MARK: - Private Methods

    private func getShoeIndex(_ id: UUID) -> Int {
        for i in 0..<shoes.count {
            if shoes[i].id == id {
                return i
            }
        }
        return 0
    }

    private func checkShoeOnBag(_ id: UUID) -> Bool {
        let newId = id
        guard !bag.bagProducts.isEmpty else {
            return false
        }
        for i in 0..<bag.bagProducts.count {
            if bag.bagProducts[i].id == newId {
                return true
            }
        }
        return false
    }

    private func removeShoeWithId(_ id: UUID) {
        guard !bag.bagProducts.isEmpty else {
            return
        }

        let shoeIndex = getBagProductIndex(id)
        bag.bagProducts.remove(at: shoeIndex)
        print("Product was eliminated")
    }

    private func getBagProductIndex(_ id: UUID) -> Int {
        guard !bag.bagProducts.isEmpty else { return 0 }

        for i in 0..<bag.bagProducts.count {
            if bag.bagProducts[i].id == id {
                return i
            }
        }
        return 0
    }
}
