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
}
