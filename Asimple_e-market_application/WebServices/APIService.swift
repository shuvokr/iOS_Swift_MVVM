//
//  APIService.swift
//  Asimple_e-market_application
//
//  Created by Shuvo on 11/10/21.
//

import UIKit

class APIService: NSObject {
    private let storeInfoURL = URL(string: "https://virtserver.swaggerhub.com/m-tul/opn-mobile-challenge-api/1.0.0/storeInfo")!
    private let productListURL = URL(string: "https://virtserver.swaggerhub.com/m-tul/opn-mobile-challenge-api/1.0.0/products")!
    private let placeOrderURL = URL(string: "https://virtserver.swaggerhub.com/m-tul/opn-mobile-challenge-api/1.0.0/order")!
}

// MARK: - Load Store Info
extension APIService {
    func apiToGetStoreInfo(completion : @escaping (StoreInfo) -> ()) {
        
    }
}
// MARK: - Load Products
extension APIService {
    func apiToGetProductsInfo(completion : @escaping ([Products]) -> ()) {
        
    }
}
// MARK: - Place order
extension APIService {
    func apiToPlaceOrder(completion : @escaping (Int) -> ()) {
        
    }
}
