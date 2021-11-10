//
//  APIService.swift
//  Asimple_e-market_application
//
//  Created by Shuvo on 11/10/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIService: NSObject {
    private let storeInfoURL = URL(string: "https://virtserver.swaggerhub.com/m-tul/opn-mobile-challenge-api/1.0.0/storeInfo")!
    private let productListURL = URL(string: "https://virtserver.swaggerhub.com/m-tul/opn-mobile-challenge-api/1.0.0/products")!
    private let placeOrderURL = URL(string: "https://virtserver.swaggerhub.com/m-tul/opn-mobile-challenge-api/1.0.0/order")!
}

// MARK: - Load Store Info
extension APIService {
    func apiToGetStoreInfo(completion : @escaping (StoreInfo) -> ()) {
        
        let urlTo = URL(string: "https://virtserver.swaggerhub.com/m-tul/opn-mobile-challenge-api/1.0.0/storeInfo")!
        AF.request(
            urlTo,
            method: .get
            ).responseJSON {
            (response) in
            switch response.result {
                
                case .success(let json):
                    let jsonData = JSON(json as Any)
                    guard let statusCode = response.response?.statusCode else { return }
                    if(statusCode == 200) {
                        var storeData = StoreInfo()
                        storeData.name = "Store Name: \(jsonData["name"].stringValue)"
                        storeData.rating = "Rating: \(jsonData["rating"].stringValue)"
                        storeData.closingTime = "Opening Time: \(jsonData["openingTime"].stringValue)"
                        storeData.openingTime = "Closing Time: \(jsonData["closingTime"].stringValue)"
                        
                        completion(storeData)
                    }
                    else {
                        print("Found status code ==> \(statusCode)")
                        completion(StoreInfo())
                    }

                case .failure(let error):
                    print("getStoreInfo request error: \(error)")
                    completion(StoreInfo())
            }
        }
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
