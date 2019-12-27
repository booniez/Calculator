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
    @ObservedObject var model = CalculatorModel()
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            CalculatorResult(title: model.brain.output)
            CalculatorButtonPad(brain: $model.brain)
        }
        .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
