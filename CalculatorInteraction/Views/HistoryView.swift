//
//  HistoryView.swift
//  CalculatorInteraction
//
//  Created by JLM on 2019/12/30.
//  Copyright © 2019 JLM. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var model: CalculatorModel
    var body: some View {
        VStack {
            if model.totalCount == 0 {
                Text("没有历史")
            } else {
                HStack {
                    Text("历史记录").font(.headline)
                    Text("\(model.historyDetail)").lineLimit(nil)
                }
                HStack {
                    Text("显示").font(.headline)
                    Text("\(model.brain.output)").lineLimit(nil)
                }
                Slider(value: $model.slidingIndex, in: 0...Float(model.totalCount), step: 1)
            }
        }.padding()
    }
}
