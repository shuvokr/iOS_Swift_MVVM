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
        let urlTo = URL(string: "https://virtserver.swaggerhub.com/m-tul/opn-mobile-challenge-api/1.0.0/products")!
       
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
                        var data : [Products] = [Products]()
                        for i in 0..<jsonData.count {
                            data.append(Products(name: jsonData[i]["name"].stringValue, price: jsonData[i]["price"].stringValue, imageUrl: jsonData[i]["imageUrl"].stringValue))
                        }
                        completion(data)
                    }
                    else {
                        print("Found status code ==> \(statusCode)")
                        completion([Products]())
                    }

                case .failure(let error):
                    print("getProductList request error: \(error)")
                    completion([Products]())

            }
        }
    }
}
// MARK: - Place order
extension APIService {
    func apiToPlaceOrder(productsData : [Products], completion : @escaping (Int) -> ()) {
        var products: [[String : Any]] = [[String : Any]]()
        
        for i in 0..<productsData.count {
            products.append([
                "name": productsData[i].name,
                "price": productsData[i].price,
                "imageUrl": productsData[i].imageUrl
            ])
        }
        
        let parameters = [
            "products": products,
            "delivery_address": "CDC O4 Office, Bangkapi, Bangkok, 10310"
        ] as [String : Any]
        print(parameters)
        let postData = try? JSONSerialization.data(withJSONObject: parameters)

        var request = URLRequest(url: URL(string: "https://virtserver.swaggerhub.com/m-tul/opn-mobile-challenge-api/1.0.0/order")!,timeoutInterval: Double.infinity)
        request.addValue("*/*", forHTTPHeaderField: "accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            let statusCode = response?.getStatusCode()
            print("00000000000000000000000 \(String(describing: statusCode))")

            // If error found
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }

            // If response data found
            print(String(data: data, encoding: .utf8)!)
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
            completion(statusCode ?? -1)
        }

        task.resume()
    }
}

extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
