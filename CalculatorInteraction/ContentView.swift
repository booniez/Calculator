//
//  ContentView.swift
//  CalculatorUI
//
//  Created by JLM on 2019/12/26.
//  Copyright © 2019 JLM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let scale: CGFloat = UIScreen.main.bounds.width / 414
    @State private var brain: CalculatorBrain = .left("0")
    
    var body: some View {
        VStack(spacing: 12.0) {
            Spacer()
            CalculatorResult(title: brain.output)
            CalculatorButtonPad(brain: $brain)
        }
        .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
