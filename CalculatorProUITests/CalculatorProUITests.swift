//
//  CalculatorProUITests.swift
//  CalculatorProUITests
//
//  Created by Shilpa Kumari on 09/08/19.
//  Copyright © 2019 Shilpa Kumari. All rights reserved.
//

import XCTest

class CalculatorProUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testC(){
        let app = XCUIApplication()
        XCTAssertTrue(app.buttons["C"].exists)
        app.buttons["C"].tap()
        
    }
    func testAddition() {
        
        let app = XCUIApplication()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["3"].tap()
        app.buttons["="].tap()
        
        sleep(2)
        
        let expressionLabel = app.staticTexts.matching(identifier: "resultLabel").element
        XCTAssert(expressionLabel.exists)
       
        XCTAssertEqual(expressionLabel.label, "5", "Asserted")
        app.buttons["Show History"].tap()
        
       
       let cellExpn = app.tables/*@START_MENU_TOKEN@*/.staticTexts["2+3 = 5"]/*[[".cells.staticTexts[\"2+3 = 5\"]",".staticTexts[\"2+3 = 5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertEqual(cellExpn.label,"2+3 = 5","Asserted")
        
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        
    }
    func testSubtraction(){
        let app = XCUIApplication()
        app.buttons["5"].tap()
        app.buttons["-"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        
        sleep(2)
        
        let expressionLabel = app.staticTexts.matching(identifier: "resultLabel").element
        XCTAssert(expressionLabel.exists)
        
        XCTAssertEqual(expressionLabel.label, "1", "Asserted")
        app.buttons["Show History"].tap()
        XCTAssertTrue(app.buttons["Clear History"].exists)
        app.buttons["Clear History"].tap()
        app.navigationBars["CalculatorPro.historyView"].buttons["Back"].tap()
        
       
       
        
    }
    func testMultiplication(){
        let app = XCUIApplication()
        app.buttons["6"].tap()
        app.buttons["x"].tap()
        app.buttons["7"].tap()
        app.buttons["="].tap()
        
        sleep(2)
        
        let expressionLabel = app.staticTexts.matching(identifier: "resultLabel").element
        XCTAssert(expressionLabel.exists)
        
        XCTAssertEqual(expressionLabel.label, "42", "Asserted")
        app.buttons["="].tap()
        XCTAssertEqual(expressionLabel.label, "42", "Asserted")
        
    }
    func testDivide(){
        let app = XCUIApplication()
        app.buttons["8"].tap()
        app.buttons["÷"].tap()
        app.buttons["9"].tap()
        app.buttons["="].tap()
        
        sleep(2)
        
        let expressionLabel = app.staticTexts.matching(identifier: "resultLabel").element
        XCTAssert(expressionLabel.exists)
        
        XCTAssertEqual(expressionLabel.label, "0", "Asserted")
        app.buttons["4"].tap()
        XCTAssertEqual(expressionLabel.label, "4", "Asserted")
        
    }
    func testClearHistoryButtonDisappear(){
        
        let app = XCUIApplication()
        app.buttons["Show History"].tap()
        app.navigationBars["CalculatorPro.historyView"].buttons["Back"].tap()
        XCTAssertFalse(app.buttons["Clear History"].exists)
        
    }
    func testDivideByZero(){
        let app = XCUIApplication()
        app.buttons["1"].tap()
        app.buttons["÷"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        let expressionLabel = app.staticTexts.matching(identifier: "resultLabel").element
        XCTAssert(expressionLabel.exists)
        
        XCTAssertEqual(expressionLabel.label, "can not divide by zero", "can not divide by zero")
        
    }
    func testExpression(){
        let app = XCUIApplication()
        app.buttons["+"].tap()
        var expressionLabel = app.staticTexts.matching(identifier: "resultLabel").element
        XCTAssert(expressionLabel.exists)
        
        XCTAssertEqual(expressionLabel.label, "", "Assertion")
        
      
        app.buttons["4"].tap()
        app.buttons["-"].tap()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["x"].tap()
        
        XCTAssertEqual(expressionLabel.label, "2*", "Assertion")
        
        
    }
    
    

}
