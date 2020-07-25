import SwiftUI

struct TitleRow: View {
    let model: Model

    var body: some View {
        Text(model.title)
            .multilineTextAlignment(.leading)
            .padding(.vertical, .xxs)
            .iconIndicator(symbol: model.symbol)
    }
}

extension TitleRow {
    struct Model {
        let title: String
        let symbol: SFSymbol
    }
}

#if DEBUG
extension TitleRow.Model {
    static let mock = Self(
        title: "title",
        symbol: .chevronRight
    )
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow(model: .mock)
    }
}
#endif
