//
//  StoreModelView.swift
//  Asimple_e-market_application
//
//  Created by Shuvo on 11/10/21.
//

import UIKit

class StoreModelView: NSObject {
    private var apiService : APIService!
    private(set) var storeData : StoreInfo! {
        didSet {
            self.bindStoreInfoViewModelToController()
        }
    }
    
    var bindStoreInfoViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetStoreData()
    }
    
    func callFuncToGetStoreData() {
        self.apiService.apiToGetStoreInfo { (storeData) in
            self.storeData = storeData
        }
    }
}
