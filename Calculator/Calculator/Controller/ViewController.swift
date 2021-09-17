//
//  ViewController.swift
//  Calculator
//
//  Created by ulas on 13.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private var isTyping: Bool = false
    private var firstNumber: Double = 0
    private var secondNumber: Double = 0
    
    private var operationManager = MathOperationManager()
    
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        
        let digit = sender.currentTitle ?? ""
        let displayText = resultLabel.text ?? ""
        
        
        if isTyping {
            resultLabel.text = displayText + digit
        } else {
            resultLabel.text = digit
            isTyping.toggle()
        }
        
    }
    
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        
        let operationString = sender.currentTitle!
        
        if let text = resultLabel.text, let value = Double(text), firstNumber == 0 {
            firstNumber = value
        }
        
        operationManager.selectMathOperation(with: operationString)
        
        //Square root operation does not require 2 number input so I put this if block for calculate square root after take first number input.
        if operationManager.currentOperation == .squareroot {
            let result = String(format: "%.2f", operationManager.calculateResult(firstNumber))
            resultLabel.text = result
            firstNumber = 0
        } else {
            resultLabel.text = ""
        }
        
        
        
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        resultLabel.text = "0"
        isTyping = false
        operationManager.currentOperation = nil
        firstNumber = 0
        secondNumber = 0
    }
    
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        if resultLabel.text != "0" {
            if let text = resultLabel.text {
                resultLabel.text = "\(text)\(0)"
            }
        }
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        
        if let text = resultLabel.text, let value = Double(text), secondNumber == 0 {
            secondNumber = value
        }
        
        let result = operationManager.calculateResult(firstNumber, secondNumber)
        
        //To check if the result is double or integer
        let isInteger: Bool = (result == floor(result))
        
        //I decide how many digits to display after the comma, depending on whether the result is a double or an integer.
        if isInteger {
            let formattedResult = String(format: "%.0f", result)
            resultLabel.text = formattedResult
        } else {
            let formattedResult = String(format: "%.1f", result)
            resultLabel.text = formattedResult
        }
        
        isTyping.toggle()
        firstNumber = 0
        secondNumber = 0
    }
    
}

