//
//  ProductModelView.swift
//  Asimple_e-market_application
//
//  Created by Shuvo on 11/10/21.
//

import UIKit

class ProductModelView: NSObject {
    private var apiService : APIService!
    private(set) var storeData : [Products]! {
        didSet {
            self.bindProductInfoViewModelToController()
        }
    }
    
    var bindProductInfoViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetProductData()
    }
    
    func callFuncToGetProductData() {
        self.apiService.apiToGetProductsInfo { (storeData) in
            self.storeData = storeData
        }
    }
}
