//
//  ViewController.swift
//  Calculator
//
//  Created by ulas on 13.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstNumber = 0.0
    var sum = 0
    //this variable is optional because when tapped AC button operation will be nil.
    var currentOperation: Operation?
    
    //enum for math operations
    enum Operation {
        case add, subtract, multiply, divide, squareroot
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "0"
    }
    
    private var isTyping: Bool = false
    
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        
        let digit = sender.currentTitle
        let displayText = resultLabel.text ?? ""
        
        
        if isTyping {
            resultLabel.text = displayText + digit!
        } else {
            resultLabel.text = digit
            isTyping.toggle()
        }
        
    }
    
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        //        let value = Double(resultLabel.text ?? "")
        //        resultLabel.text = String(sqrt(value!))
        
        let operation = sender.currentTitle
        
        if let text = resultLabel.text, let value = Double(text), firstNumber == 0 {
            firstNumber = value
            resultLabel.text = "0"
        }
        
        switch operation {
        case "√":
            currentOperation = .squareroot
        case "/":
            currentOperation = .divide
        case "x":
            currentOperation = .multiply
        case "-":
            currentOperation = .subtract
        case "+":
            currentOperation = .add
        default:
            currentOperation = nil
        }
        
        if let operation = currentOperation {
            var secondNumber = 0.0
            if let text = resultLabel.text, let value = Double(text) {
                secondNumber = value
            }
            
            switch operation {
            case .add:
                let result = firstNumber + secondNumber
                resultLabel.text = "\(result)"
                
            case .subtract:
                let result = firstNumber - secondNumber
                resultLabel.text = "\(result)"
                
            case .multiply:
                let result = firstNumber * secondNumber
                resultLabel.text = "\(result)"
                
            case .divide:
                let result = firstNumber / secondNumber
                resultLabel.text = "\(result)"
                
            case .squareroot:
                let result = sqrt(firstNumber)
                resultLabel.text = "\(result)"
            }
        }
        
        
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        resultLabel.text = "0"
        currentOperation = nil
        firstNumber = 0
    }
    
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        if resultLabel.text != "0" {
            if let text = resultLabel.text {
                resultLabel.text = "\(text)\(0)"
            }
        }
    }
}

