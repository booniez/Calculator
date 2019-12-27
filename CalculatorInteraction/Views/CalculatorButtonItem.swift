//
//  CalculatorButtonItem.swift
//  Calculator
//
//  Created by JLM on 2019/12/26.
//  Copyright © 2019 JLM. All rights reserved.
//

import Foundation
import SwiftUI

enum CalculatorButtonItem {
    enum Operator: String {
        case plus = "+"
        case minus = "−"
        case multiply = "×"
        case divide = "÷"
        case equal = "="
    }
    
    enum Command: String {
        case clear = "AC"
        case flip = "+/-"
        case percent = "%"
    }
    
    case digit(Int)
    case dot
    case op(Operator)
    case command(Command)
}

extension CalculatorButtonItem {
    var title: String {
        switch self {
        case .digit(let value):
            return String(value)
        case .dot:
            return "."
        case .op(let op):
            return op.rawValue
        case .command(let command):
            return command.rawValue
        }
    }
    
    var size: CGSize {
        switch self {
        case .digit(0):
            return CGSize(width: 184.0, height: 88.0)
        default:
            return CGSize(width: 88.0, height: 88.0)
        }
    }
    
    var backgroundColorName: String {
        switch self {
        case .digit,
             .dot:
            return "digitBackground"
        case .command:
            return "commandBackground"
        case .op:
            return "operatorBackground"
        }
    }
    
    var foregroundColorName: String {
        switch self {
        case .digit,
             .op,
             .dot:
            return "commandTextForeground"
        case  .command:
            return "commandForeground"
        }
    }
}

extension CalculatorButtonItem: Hashable {}
