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
    @State private var editingHistory = false
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Button("操作记录\(model.history.count)") {
                print(self.model.history)
                self.editingHistory = true
            }.sheet(isPresented: $editingHistory) {
                HistoryView(model: self.model)
            }
            CalculatorResult(title: model.brain.output)
            CalculatorButtonPad(model: model)
        }
        .scaleEffect(scale)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
