//
//  ViewController.swift
//  Asimple_e-market_application
//
//  Created by Shuvo on 11/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeRatingLabel: UILabel!
    @IBOutlet weak var storeOpenTimeLabel: UILabel!
    @IBOutlet weak var storeCloseTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("[ Asimple_e-market_application ]")
    }
    @IBAction func placeOrderAction(_ sender: UIButton) {
        self.showWarnings(title: "Warning!", alertMessage: "No products have been selected for ordering.")
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as TableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}
