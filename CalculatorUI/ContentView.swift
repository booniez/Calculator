//
//  ContentView.swift
//  Calculator
//
//  Created by JLM on 2019/12/20.
//  Copyright © 2019 JLM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    var body: some View {
        VStack(spacing: 12.0) {
            Spacer()
            CalculatorResult(title: "😄")
            CalculatorButtonPad()
        }
        .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
