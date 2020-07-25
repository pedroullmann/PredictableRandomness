import Foundation
import SwiftUI

struct GeneratorState: Equatable {
    var intValue: Int?
    var intValueGenerated: Bool { intValue != nil }
    var floatValue: Float?
    var floatValueGenerated: Bool { floatValue != nil }
    var color: Color?
    var colorGenerated: Bool { color != nil }
    var element: String?
    var elementGenerated: Bool { element != nil }
}
