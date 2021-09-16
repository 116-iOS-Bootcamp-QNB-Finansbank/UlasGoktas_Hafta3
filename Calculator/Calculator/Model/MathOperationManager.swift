//
//  MathOperationManager.swift
//  Calculator
//
//  Created by ulas on 15.09.2021.
//

import Foundation

struct MathOperationManager {
    
    //this variable is optional because when tapped AC button operation will be nil.
    var currentOperation: MathOperation?
    
    //enum for math operations
    enum MathOperation {
        case add, subtract, multiply, divide, squareroot
    }
    
    func getMathOperation(with operation: String) -> MathOperation? {
        
        switch operation {
        case "+":
            return .add
        case "-":
            return .subtract
        case "x":
            return .multiply
        case "/":
            return .divide
        case "√":
            return .squareroot
        default:
            return .none
        }
        
    }
    
}
