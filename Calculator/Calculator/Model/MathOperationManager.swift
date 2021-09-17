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
    
    mutating func selectMathOperation(with operation: String) -> Void {
        
        switch operation {
        case K.add:
            currentOperation = .add
        case K.subtract:
            currentOperation = .subtract
        case K.multiply:
            currentOperation = .multiply
        case K.divide:
            currentOperation = .divide
        case K.squareroot:
            currentOperation = .squareroot
        default:
            currentOperation = nil
        }
        
    }
    
    func calculateResult(_ firstNumber: Double, _ secondNumber: Double) -> Double {
        
        let result: Double
        
        switch currentOperation {
        case .add:
            result = firstNumber + secondNumber
            return result
            
        case .subtract:
            result = firstNumber - secondNumber
            return result
            
        case .multiply:
            result = firstNumber * secondNumber
            return result
            
        case .divide:
            result = firstNumber / secondNumber
            return result
            
        case .squareroot:
            result = sqrt(firstNumber)
            return result
            
        case nil:
            return 0
        }
    
    }
    
    //I used function overloading because square root operation does not require 2 parameter
    func calculateResult(_ firstNumber: Double) -> Double {
        return sqrt(firstNumber)
    }
}
