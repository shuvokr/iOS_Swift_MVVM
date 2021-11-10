//
//  ViewController.swift
//  Asimple_e-market_application
//
//  Created by Shuvo on 11/10/21.
//

import UIKit

class ViewController: UIViewController {

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
