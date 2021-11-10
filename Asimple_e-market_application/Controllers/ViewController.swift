//
//  ViewController.swift
//  Asimple_e-market_application
//
//  Created by Shuvo on 11/10/21.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeRatingLabel: UILabel!
    @IBOutlet weak var storeOpenTimeLabel: UILabel!
    @IBOutlet weak var storeCloseTimeLabel: UILabel!
    @IBOutlet weak var productsTable: UITableView!
    
    private var storeViewModel : StoreModelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("[ Asimple_e-market_application ]")
        self.productsTable.tableFooterView = UIView()
        self.productsTable.delegate = self
        self.productsTable.dataSource = self
        
        self.callToViewModelForUIUpdate()
    }
    @IBAction func placeOrderAction(_ sender: UIButton) {
        self.showWarnings(title: "Warning!", alertMessage: "No products have been selected for ordering.")
    }
    
    private func callToViewModelForUIUpdate() {
        self.storeViewModel = StoreModelView()
        self.storeViewModel.bindStoreInfoViewModelToController = {
            print(self.storeViewModel.storeData ?? "nil")
        }
    }
}

// MARK: - Alert Handler
extension ViewController {
    private func showWarnings(title : String, alertMessage : String) {
        let alert = UIAlertController(title: title, message: alertMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { action in
              switch action.style {
              case .default:
                print("default")
              case .cancel:
                print("cancel")

              case .destructive:
                print("destructive")
              @unknown default:
                print("Unknown default")
            }}))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - Table Vide Delegate & Data Source
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath) as! TableViewCell
        cell.productImageLink.sd_setImage(with: URL(string: "https://www.nespresso.com/ncp/res/uploads/recipes/nespresso-recipes-Latte-Art-Tulip.jpg"), placeholderImage: UIImage(named: "demo"))
        cell.productNameLabel.text = "Product Name: nil"
        cell.productPriceLabel.text = "Product price: 123 TK"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
