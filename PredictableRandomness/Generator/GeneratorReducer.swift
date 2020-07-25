import ComposableArchitecture
import Foundation
import SwiftUI

typealias GeneratorReducer = Reducer<GeneratorState, GeneratorAction, GeneratorEnvironment>

let reducer = GeneratorReducer { state, action, environment in
    switch action {
    case let .generateInt(isActive):
        state.intValue = isActive ? Generator<Int>.int(in: 0...100).run() : nil
        return .none

    case let .generateFloat(isActive):
        state.floatValue = isActive ? Generator<Float>.float(in: 0...1).run() : nil
        return .none

    case let .generateColor(isActive):
        state.color = isActive ? Generator<Color>.color().run() : nil
        return .none
    }
}
