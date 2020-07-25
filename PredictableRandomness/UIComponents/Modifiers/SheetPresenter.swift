import SwiftUI

extension View {
    func sheetPresenter<SheetContent: View>(
        isPresented: Binding<Bool>,
        sheetContent: @autoclosure @escaping () -> SheetContent
    ) -> some View {
        self.modifier(
            SheetPresenter(
                isPresented: isPresented,
                sheetContent: sheetContent
            )
        )
    }
}

struct SheetPresenter<SheetContent: View>: ViewModifier {
    @Binding private var isPresented: Bool
    private let sheetContent: () -> SheetContent

    init(
        isPresented: Binding<Bool>,
        @ViewBuilder sheetContent: @escaping () -> SheetContent
    ) {
        self._isPresented = isPresented
        self.sheetContent = sheetContent
    }

    func body(content: Content) -> some View {
        Button(
            action: { self.isPresented = true },
            label: { content }
        )
            .sheet(
                isPresented: $isPresented,
                content: sheetContent
            )
    }
}
