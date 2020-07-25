import Foundation
import SwiftUI

struct Generator<A>: Equatable {
    let run: () -> A
    let id: String = UUID().uuidString

    static func == (
        lhs: Generator<A>,
        rhs: Generator<A>
    ) -> Bool {
        lhs.id == rhs.id
    }
}

extension Generator where A: BinaryFloatingPoint, A.RawSignificand: FixedWidthInteger {
    static func float(in range: ClosedRange<A>) -> Generator {
        return Generator { .random(in: range) }
    }
}

extension Generator where A: FixedWidthInteger {
    static func int(in range: ClosedRange<A>) -> Generator {
        return Generator { .random(in: range) }
    }
}

extension Generator where A == Bool {
    static let bool = Generator { .random() }
}

extension Generator where A == Color {
    static func color() -> Generator {
        return Generator {
            .init(
                red: Generator<Double>.float(in: 0...1).run(),
                green: Generator<Double>.float(in: 0...1).run(),
                blue: Generator<Double>.float(in: 0...1).run()
            )
        }
    }
}
