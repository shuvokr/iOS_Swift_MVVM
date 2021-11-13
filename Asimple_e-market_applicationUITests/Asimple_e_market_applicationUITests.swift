//
//  Asimple_e_market_applicationUITests.swift
//  Asimple_e-market_applicationUITests
//
//  Created by Shuvo on 11/11/21.
//

import XCTest

class Asimple_e_market_applicationUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        print(app.debugDescription)
    }

    func test_ButtonShowAlerts() {
        app.buttons["Place Order"].tap()
        XCTAssertTrue(app.alerts["Warning!"].exists)
        app.alerts["Warning!"].buttons["Okay"].tap()
    }
    
    func test_PlaceOrderUITest() {
        sleep(5)
        let cell = app.cells.element(matching: .cell, identifier: "Cell_1")
        let cell2 = app.cells.element(matching: .cell, identifier: "Cell_3")
        cell.tap()
        cell2.tap()
        app.buttons["Place Order"].tap()
        sleep(5)
        XCTAssertTrue(app.alerts["Placed order successfully"].exists)
        app.alerts["Placed order successfully"].buttons["Okay"].tap()
    }
    }
