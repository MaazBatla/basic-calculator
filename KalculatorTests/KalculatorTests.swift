//
//  KalculatorTests.swift
//  KalculatorTests
//
//  Created by Adil Saleem on 31/10/2023.
//  Copyright © 2023 Jogendra Singh. All rights reserved.
//

import XCTest
@testable import Kalculator

final class KalculatorTests: XCTestCase {

    private var calculator: Calculator!
    private var viewController: ViewController!
    
    override func setUpWithError() throws {
        calculator = Calculator()
        super.setUp()
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? ViewController
        UIApplication.shared.keyWindow!.rootViewController = viewController
        _ = viewController.view
    }

    override func tearDownWithError() throws {
        calculator = nil
        super.tearDown()
    }

    // Positive Test Cases for the functions 'inputDigit' and 'appendDigit'
    func test_positive_input_append_Digit(){
        var operation: CalculatorOperation
        operation = .add
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "0")
        operation = .subtract
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "0")
        operation = .multiply
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "0")
        operation = .divide
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "0")
        var input = "1"
        XCTAssertEqual(try calculator.inputDigit(input), "1")
        input = "2"
        XCTAssertEqual(try calculator.inputDigit(input), "12")
    }

    // Negative Test Cases for the function 'inputDigit'
    func test_negative_inputDigit(){
        var input = "ABC"
        XCTAssertThrowsError(try calculator.inputDigit(input))
        input = "%"
        XCTAssertThrowsError(try calculator.inputDigit(input))
    }

    // Negative Test Cases for the function 'appendDigit'
    func test_negative_appendDigit(){
        var input = "@"
        XCTAssertThrowsError(try calculator.appendDigit(input))
        input = "#"
        XCTAssertThrowsError(try calculator.appendDigit(input))
    }
    
    // Positive Test Case for the function 'addOperation'
    func test_positive_addOperation(){
        var num1 = "1"
        var num2 = "2"
        var operation: CalculatorOperation
        operation = .add
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "3")
    }
 
    // Negative Test Case for the function 'addOperation'
    func test_negative_addOperation(){
        var num1 = "9"
        var num2 = "8"
        var operation: CalculatorOperation
        operation = .add
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertNotEqual(try calculator.inputDigit(operation.rawValue), "14")
    }
    
    // Positive Test Case for the function 'subtractOperation'
    func test_positive_subtractOperation(){
        var num1 = "4"
        var num2 = "3"
        var operation: CalculatorOperation
        operation = .subtract
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "1")
    }
 
    // Negative Test Case for the function 'subtractOperation'
    func test_negative_subtractOperation(){
        var num1 = "7"
        var num2 = "3"
        var operation: CalculatorOperation
        operation = .subtract
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertNotEqual(try calculator.inputDigit(operation.rawValue), "5")
    }
    
    // Positive Test Case for the function 'multiplyOperation'
    func test_positive_multiplyOperation(){
        var num1 = "5"
        var num2 = "6"
        var operation: CalculatorOperation
        operation = .multiply
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "30")
    }
 
    // Negative Test Case for the function 'multiplyOperation'
    func test_negative_multiplyOperation(){
        var num1 = "3"
        var num2 = "5"
        var operation: CalculatorOperation
        operation = .multiply
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertNotEqual(try calculator.inputDigit(operation.rawValue), "35")
    }
    
    // Positive Test Case for the function 'divideOperation'
    func test_positive_divideOperation(){
        var num1 = "8"
        var num2 = "2"
        var operation: CalculatorOperation
        operation = .divide
        
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertEqual(try calculator.inputDigit(operation.rawValue), "4")
    }
 
    // Negative Test Case for the function 'divideOperation'
    func test_negative_divideOperation(){
        var num1 = "8"
        var num2 = "0"
        var operation: CalculatorOperation
        operation = .divide
    
        num1 = try! calculator.inputDigit(num1)
        _ = try! calculator.inputDigit(operation.rawValue)
        num2 = try! calculator.inputDigit(num2)
        
        operation = .equals
        XCTAssertThrowsError(try calculator.inputDigit(operation.rawValue))
    }
    
    // Test Case for the function 'clear'
    func test_clear(){
        var input = "7"
        input = try! calculator.inputDigit(input)
        calculator.clear()
        input = "9"
        XCTAssertEqual(try calculator.inputDigit(input), "9")
    }
    
    // Test Case for the function 'inputDigit' in the ViewController Class
    func test_ViewController_inputDigit(){
        let input = "5"
        let button = UIButton(type: .custom)
        button.setTitle(input, for: .normal)
        viewController.inputDigit(button)
        XCTAssertEqual(viewController.resultScreen.text, input)
    }

    // Test Case for the function 'clear' in the ViewController Class
    func test_ViewController_clear(){
        viewController.clear("")
        XCTAssertEqual(viewController.resultScreen.text, "0")
    }
}
