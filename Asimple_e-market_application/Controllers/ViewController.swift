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
    private var productViewModel : ProductModelView!
    private var isSelectedProduct : [Bool] = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("[ Asimple_e-market_application ]")
        self.productsTable.tableFooterView = UIView()
        
        self.callToStoreViewModelForUIUpdate()
        self.callToProductViewModelForUIUpdate()
    }
    @IBAction func placeOrderAction(_ sender: UIButton) {
        
        var selectedProduct : [Products] = [Products]()
        for i in 0..<self.isSelectedProduct.count {
            if isSelectedProduct[i] {
                selectedProduct.append(self.productViewModel.storeData[i])
            }
        }
        
        if selectedProduct.count == 0 {
            self.showWarnings(title: "Warning!", alertMessage: "No products have been selected for ordering.")
        }
        else {
            self.callToPlaceOrder(products: selectedProduct)
        }
    }
    
    private func callToStoreViewModelForUIUpdate() {
        self.storeViewModel = StoreModelView()
        self.storeViewModel.bindStoreInfoViewModelToController = {
            DispatchQueue.main.async {
                if self.storeViewModel.storeData != nil {
                    self.storeNameLabel.text = self.storeViewModel.storeData.name
                    self.storeRatingLabel.text = self.storeViewModel.storeData.rating
                    self.storeOpenTimeLabel.text = self.storeViewModel.storeData.openingTime
                    self.storeCloseTimeLabel.text = self.storeViewModel.storeData.closingTime
                }
                else {
                    print("Store info not found!")
                    self.showWarnings(title: "Store info not found!", alertMessage: "")
                }
            }
        }
    }
    
    private func callToProductViewModelForUIUpdate() {
        self.productViewModel = ProductModelView()
        self.storeViewModel.bindStoreInfoViewModelToController = {
        
            DispatchQueue.main.async {
                if self.productViewModel.storeData != nil {
                    let cnt = self.productViewModel.storeData.count
                    for _ in 0..<cnt {
                        self.isSelectedProduct.append(false)
                    }
                    self.productsTable.delegate = self
                    self.productsTable.dataSource = self
                    self.productsTable.reloadData()
                }
                else {
                    print("No product founds!")
                    self.showWarnings(title: "No product founds!", alertMessage: "")
                }
            }
        }
    }
    
    private func callToPlaceOrder(products : [Products]) {
        let apiService : APIService = APIService()
        apiService.apiToPlaceOrder(productsData: products) { (statusCode) in
            self.showWarnings(title: "Placed order successfully", alertMessage: "Your order was placed successfully.")
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
        return self.productViewModel.storeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableviewcell", for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.productImageLink.sd_setImage(with: URL(string: self.productViewModel.storeData[indexPath.row].imageUrl), placeholderImage: UIImage(named: "demo"))
        cell.productNameLabel.text = "Product Name: \(self.productViewModel.storeData[indexPath.row].name)"
        cell.productPriceLabel.text = "Product price: \(self.productViewModel.storeData[indexPath.row].price) TK"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if self.isSelectedProduct[indexPath.row] {
            cell?.backgroundColor = .white
            self.isSelectedProduct[indexPath.row] = false
        }
        else {
            cell?.backgroundColor = .green
            self.isSelectedProduct[indexPath.row] = true
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
