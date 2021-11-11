//
//  Asimple_e_market_applicationTests.swift
//  Asimple_e-market_applicationTests
//
//  Created by Shuvo on 11/11/21.
//

import XCTest
@testable import Asimple_e_market_application

class Asimple_e_market_applicationTests: XCTestCase {
    var productModel: Products!
    var storeModel: StoreInfo!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        productModel = Products(name: "Coffe", price: "123", imageUrl: "https://google.com")
        storeModel = StoreInfo(name: "Store Name", rating: "4.0", openingTime: "10:00", closingTime: "20:00")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        productModel = nil
        storeModel = nil
    }
    
    func test_ValidateProductPrice() {
        productModel.price = "123"
        let isValidPrice = productModel.isValidPrice
        XCTAssertTrue(isValidPrice, "Price is not valid!")
    }
    
    func test_ValidateProductPrice2() {
        productModel.price = "-123"
        let isValidPrice = productModel.isValidPrice
        XCTAssertTrue(isValidPrice, "Price is not valid!")
    }
    
    func test_ValidateStoreRating() {
        storeModel.rating = "1.1"
        let isValidRating = storeModel.isValidRating
        XCTAssertTrue(isValidRating, "Rating is not valid!")
    }
    
    func test_ValidateStoreRating2() {
        storeModel.rating = "6.1"
        let isValidRating = storeModel.isValidRating
        XCTAssertTrue(isValidRating, "Rating is not valid!")
    }
}
