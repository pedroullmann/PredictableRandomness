import Foundation
import SwiftUI

extension View {
    func closableSheet(navigationTitle: String) -> some View {
        self.modifier(ClosableSheet(title: navigationTitle))
    }
}

struct ClosableSheet: ViewModifier {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    let title: String

    func body(content: Content) -> some View {
        NavigationView {
            content
            .navigationBarItems(
                leading: Button(
                    action: { self.presentationMode.wrappedValue.dismiss() },
                    label: { Image(systemName: SFSymbol.xmark.rawValue) }
                )
            )
                .navigationBarTitle(Text(title), displayMode: .large)
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
