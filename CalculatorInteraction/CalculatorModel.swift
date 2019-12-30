//
//  CalculatorModel.swift
//  CalculatorInteraction
//
//  Created by JLM on 2019/12/27.
//  Copyright © 2019 JLM. All rights reserved.
//

import Foundation
import SwiftUI

class CalculatorModel: ObservableObject {
    @Published var brain: CalculatorBrain = .left("0")
    @Published var history: [CalculatorButtonItem] = []
    
    func apply(_ item: CalculatorButtonItem) {
        brain = brain.apply(item: item)
        history.append(item)
        
        temporaryKept.removeAll()
        slidingIndex = Float(totalCount)
        
    }
    
    var historyDetail: String {
        history.map { $0.title }.joined()
    }
    /// 被回朔的操作
    var temporaryKept: [CalculatorButtonItem] = []
    
    var totalCount: Int {
        history.count + temporaryKept.count
    }
    
    var slidingIndex: Float = 0 {
        didSet {
            keepHistory(upTo: Int(slidingIndex))
        }
    }
    
    // 它所做的就是根据 index 把 history 和 temporaryKept 的元素重新分配。然后根据 history 重新计算当前 brain 的状态
    func keepHistory(upTo index: Int) {
        precondition(index <= totalCount, "out of index")
        let total = history + temporaryKept
        history = Array(total[..<index])
        temporaryKept = Array(total[index...])
        brain = history.reduce(CalculatorBrain.left("0")) { result, item in
            result.apply(item: item)
        }
    }
}
