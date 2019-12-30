//
//  CalculatorView.swift
//  Calculator
//
//  Created by JLM on 2019/12/26.
//  Copyright © 2019 JLM. All rights reserved.
//

import Foundation
import SwiftUI

struct CalculatorResult: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.system(size: 76))
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .trailing)
            .minimumScaleFactor(0.5)
            .padding(.trailing, 24)
    }
}

struct CalculatorButtonPad: View {
//    @Binding var brain: CalculatorBrain
    var model: CalculatorModel
    let pad: [[CalculatorButtonItem]] = [[.command(.clear), .command(.flip), .command(.percent), .op(.multiply)],
                                        [.digit(7), .digit(8), .digit(9), .op(.divide)],
                                        [.digit(4), .digit(5), .digit(6), .op(.minus)],
                                        [.digit(1), .digit(2), .digit(3), .op(.plus)],
                                        [.digit(0), .dot, .op(.equal)]]
    var body: some View {
        VStack(spacing: 10) {
            ForEach(pad, id: \.self) { item in
                CalculatorButtonRow(model: self.model, row: item)
            }
        }
    }
}

struct CalculatorButtonRow: View {
//    @Binding var brain: CalculatorBrain
    var model: CalculatorModel
    let row: [CalculatorButtonItem]
    var body: some View {
        HStack {
            ForEach(row, id: \.self) { item in
                CalculatorButton(title: item.title, foregroundColorName: item.foregroundColorName, size: item.size, backgroundName: item.backgroundColorName) {
//                    self.brain = self.brain.apply(item: item)
                    self.model.apply(item)
                }
            }
        }
    }
}

struct CalculatorButton: View {
    let title: String
    let fontSize: CGFloat = 36.0
    let foregroundColorName: String
    let size: CGSize
    let backgroundName: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize))
                .foregroundColor(Color(foregroundColorName))
                .frame(width: size.width, height: size.height)
                .background(Color(backgroundName))
                .cornerRadius(size.height * 0.5)
        }
    }
}
