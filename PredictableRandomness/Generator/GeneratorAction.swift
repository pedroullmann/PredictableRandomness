import ComposableArchitecture
import Foundation

enum GeneratorAction: Equatable {
    case generateInt(isActive: Bool)
    case generateFloat(isActive: Bool)
    case generateColor(isActive: Bool)
}
