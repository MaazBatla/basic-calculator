//
//  KalculatorUITests.swift
//  KalculatorUITests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest

final class KalculatorUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // UI tests must launch the application that they test.
        app = XCUIApplication()
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        app = nil
    }

    // Test Cases for checking the existance of all the Buttons
    func test_ButtonsExistance(){
        XCTAssertTrue(app.buttons["C"].exists)
        
        XCTAssertTrue(app.buttons["+"].exists)
        XCTAssertTrue(app.buttons["-"].exists)
        XCTAssertTrue(app.buttons["*"].exists)
        XCTAssertTrue(app.buttons["/"].exists)
        XCTAssertTrue(app.buttons["="].exists)

        XCTAssertTrue(app.buttons["0"].exists)
        XCTAssertTrue(app.buttons["1"].exists)
        XCTAssertTrue(app.buttons["2"].exists)
        XCTAssertTrue(app.buttons["3"].exists)
        XCTAssertTrue(app.buttons["4"].exists)
        XCTAssertTrue(app.buttons["5"].exists)
        XCTAssertTrue(app.buttons["6"].exists)
        XCTAssertTrue(app.buttons["7"].exists)
        XCTAssertTrue(app.buttons["8"].exists)
        XCTAssertTrue(app.buttons["9"].exists)
    }
    
    // Test Cases for checking the Result Screen
    func test_ResultScreen(){
        var button = "1"
        app.buttons[button].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "1")
        button = "2"
        app.buttons[button].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "12")
        
        button = "+"
        app.buttons[button].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "12")
        
        button = "3"
        app.buttons[button].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "3")
        button = "6"
        app.buttons[button].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "36")
        
        button = "="
        app.buttons[button].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "48")
        
        button = "C"
        app.buttons[button].tap()
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
    }
    
    // Test Cases for checking the Calculated Output
    func test_CalculatedOutput(){
        app.buttons["1"].tap()
        app.buttons["6"].tap()
        app.buttons["/"].tap()
        app.buttons["4"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "4")
        
        app.buttons["*"].tap()
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "400")
        
        app.buttons["+"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "520")
        
        app.buttons["-"].tap()
        app.buttons["1"].tap()
        app.buttons["0"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "420")
    }
    
    // Test Case for checking Error Detection and Handling
    func test_Error_Detection_and_Handling(){
        app.buttons["1"].tap()
        app.buttons["6"].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "Err")
        
        app.buttons["C"].tap()
        
        XCTAssertEqual(app.staticTexts["Result"].label, "0")
    }
}
