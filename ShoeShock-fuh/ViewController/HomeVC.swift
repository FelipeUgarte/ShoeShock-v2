//
//  ViewController.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 26-05-22.
//

import UIKit
import SwiftUI

//enum ColelctionViewsEnum: UICollectionView {
//    case brandCollectionView, productCollectionView, moreShoesCollectionView
//}
class HomeVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    // CollectionsViews
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var moreShoesCollectionView: UICollectionView!
    @IBOutlet weak var myBagBT: UIBarButtonItem!
    
    // Buttons
    @IBOutlet weak var upcomingBT: UIButton!
    @IBOutlet weak var featured: UIButton!
    @IBOutlet weak var new: UIButton!
    
    private(set) public var shoeToShow = ShoeModel(name: "", brand: "", price: 0, shoeImage: "", shoeDescription: "", shoeAditionalImages: [""], like: false)
//    var selectedShoe = Shoe(name: "", brand: "", price: 0, shoeImage: "", shoeAditionalImages: [""])
//    private var indexPath

    override func viewDidLoad() {
        super.viewDidLoad()
        
        brandCollectionView.dataSource = self
        brandCollectionView.delegate = self
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        moreShoesCollectionView.dataSource = self
        moreShoesCollectionView.delegate = self
        
        // Rotate the text on the buttons
        upcomingBT.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        featured.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        new.titleLabel?.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        
        configureMyBagButton()
    }

        // MARK: - Table view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case productCollectionView:
            return DataService.instance.getShoes().count
        case moreShoesCollectionView:
            return DataService.instance.getMoreShoes().count
        case brandCollectionView:
            return BrandsEnum.allCases.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case productCollectionView:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShoeCell", for: indexPath) as? HeroBannerCell {
                let shoe = DataService.instance.getShoes()[indexPath.row]
                cell.updateCell(shoes: shoe)
                return cell
            }
            return HeroBannerCell()
        case moreShoesCollectionView:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoreShoeCell", for: indexPath) as? MoreShoeCell {
                let shoe = DataService.instance.getShoes()[indexPath.row]
                cell.getMoreShoes(shoe: shoe)
                return cell
            }
            return HeroBannerCell()
        case brandCollectionView:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BrandCell", for: indexPath) as? BrandCell, let brand = BrandsEnum(rawValue: indexPath.row) { // NATE: this was with your help at the weekly meetup
                cell.updateBrandCell(brand: brand.title)
                return cell
            }
            return BrandCell()
        default:
            return BrandCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch collectionView {
        case productCollectionView:
            let cell = DataService.instance.getShoes()[indexPath.row]
            print("** Selected Shoe")
            performSegue(withIdentifier: "ShoeDetailSegue", sender: cell)
        case brandCollectionView:
            if let brand = BrandsEnum(rawValue: indexPath.row) {
                print("Selected Brands is \(brand)")
            }
        default:
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("** Preparing for segue")
        if let destination = segue.destination as? ShoeDetailVC {
            assert(sender as? ShoeModel != nil)
            destination.initShoes(shoe: sender as! ShoeModel)
        }
    }


    private func addProduct(shoeId: UUID) {
        DataService.instance.addProductToBag(shoeId: shoeId)
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Shoe added to you bag", message: nil, preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "close", style: UIAlertAction.Style.cancel))
        alert.addAction(UIAlertAction(title: "Open bag", style: UIAlertAction.Style.default, handler: { _ in
            self.performSegue(withIdentifier: "MyBagVCSegue", sender: self)
        } ))

        self.present(alert, animated: true, completion: nil)
    }

    private func configureMyBagButton() {
        myBagBT.title = ""
        myBagBT.image = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
        myBagBT.tintColor = UIColor(Color.gray)
    }
    
}

