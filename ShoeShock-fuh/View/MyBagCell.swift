//
//  MyBagCell.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 02-07-22.
//

import UIKit

class MyBagCell: UITableViewCell {

    @IBOutlet weak var shoeImageImageView: UIImageView!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoePrice: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!

    private var cornerRadiusValue: CGFloat = 8
    private var quantity = 0
    private var id = UUID()
    weak var delegate: UpdateBagDelegate?
    private var viewController: MyBagVC?

    override func awakeFromNib() {
        increaseButton.layer.cornerRadius = cornerRadiusValue
        decreaseButton.layer.cornerRadius = cornerRadiusValue
    }

    func updateCell(shoe: BagProductsModel) {
        shoeImageImageView.image = UIImage(named: shoe.image)
        shoeNameLabel.text = shoe.name
        shoePrice.text = String("$ \(shoe.price)")
        quantityLabel.text = String(shoe.quantity)
        self.quantity = shoe.quantity
        self.id = shoe.id
    }

    @IBAction func increaseBT(_ sender: Any) {
        print("MyBagCell - increaseBT")
        self.quantity += 1
        print("Change quantity to cell: \(self.quantity)")
        quantityLabel.text = String(quantity)
        DataService.instance.changeQuantity(newQuantity: quantity, productId: self.id)
        delegate?.updateTotalLabel()
        updateTotalLB()
    }

    @IBAction func decreaseBT(_ sender: Any) {
        print("MyBagCell - decreaseBT")
        if quantity >= 2 {
            self.quantity -= 1
            print("Change quantity to cell: \(self.quantity)")
            quantityLabel.text = String(quantity)
            DataService.instance.changeQuantity(newQuantity: quantity, productId: self.id)
            delegate?.updateTotalLabel()
        } else {
            self.quantity -= 1
            print("Cell deleted - quantity to cell: \(self.quantity)")
            quantityLabel.text = String(quantity)
            DataService.instance.changeQuantity(newQuantity: quantity, productId: self.id)
            delegate?.updateTotalLabel()
        }
        updateTotalLB()
    }

    func updateTotalLB() {
        print("MyBagCell - updateTotalLB")
        viewController?.getBag()
        viewController?.bagItemsTableView.reloadData()
        viewController?.updateTotalLabel()
    }
}
