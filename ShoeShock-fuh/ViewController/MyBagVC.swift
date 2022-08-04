//
//  MyBagVC.swift
//  ShoeShock-fuh
//
//  Created by Felipe Ugarte on 30-06-22.
//

import UIKit
import SwiftUI

class MyBagVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bagItemsTableView: UITableView!
    @IBOutlet weak var itemCountLB: UILabel!
    @IBOutlet weak var totalTextLB: UILabel!
    @IBOutlet weak var totalNumberLB: UILabel!
    @IBOutlet weak var nextBT: UIButton!

    var myBag = MyBagModel(product: [])

    override func viewDidLoad() {
        super.viewDidLoad()
        bagItemsTableView.dataSource = self
        bagItemsTableView.delegate = self

        navigationItem.title = "My Bag"
        getBag()
        updateTotalLabel()
    }

    // MARK: - Methods

    func getBag() {
        myBag = DataService.instance.getBag()
        print("getBag")
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myBag.bagProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == bagItemsTableView {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyBagCell", for: indexPath) as? MyBagCell {
                let productOfBag = myBag.bagProducts[indexPath.row]
                cell.updateCell(shoe: productOfBag)
                cell.delegate = self
                return cell
            }
            return MyBagCell()
        }
        return MyBagCell()
    }

    @IBAction func next(_ sender: Any) {
        let hostingController = UIHostingController(rootView: CongratulationsView(dismiss: {[weak self] in
            self?.navigationController?.popViewController(animated: true)
        }))
        self.navigationController?.pushViewController(hostingController, animated: true)
    }

}

extension MyBagVC: UpdateBagDelegate {
    func updateTotalLabel() {
        totalNumberLB.text = String.localizedStringWithFormat("$ %.2f", myBag.totalCost)
        print("MyBagVC")
    }
}
