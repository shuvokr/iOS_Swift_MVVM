//
//  Model.swift
//  Asimple_e-market_application
//
//  Created by Shuvo on 11/10/21.
//

import Foundation

struct StoreInfo {
    var name : String = String()
    var rating : String = String()
    var openingTime : String = String()
    var closingTime : String = String()
    
    var isValidRating: Bool {
        let rat = Double(rating) ?? 6.0
        if rat < 0.0 || rat > 5.0 {
            return false
        }
        return true
    }
}

struct Products {
    var name : String = String()
    var price : String = String()
    var imageUrl : String = String()
    
    var isValidPrice: Bool {
        let prc = Int(price) ?? -1
        if prc < 0 {
            return false
        }
        return true
    }
}
