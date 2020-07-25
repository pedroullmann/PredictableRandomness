import SwiftUI

extension View {
    func iconIndicator(symbol: SFSymbol) -> some View {
        self.modifier(IconIndicator(symbol: symbol))
    }
}

struct IconIndicator: ViewModifier {
    let symbol: SFSymbol

    func body(content: Content) -> some View {
        HStack(alignment: .firstTextBaseline) {
            content
            Spacer()
            Image(systemName: symbol.rawValue)
                .font(Font.caption.bold())
        }
    }
}
