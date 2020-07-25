import ComposableArchitecture
import SwiftUI

struct GeneratorView: View {
    let store: Store<GeneratorState, GeneratorAction>

    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                List {
                    TitleRow(model: .init(title: "Generate int value", symbol: .chevronRight))
                        .sheetPresenter(
                            isPresented: viewStore.binding(
                              get: { $0.intValueGenerated },
                              send: GeneratorAction.generateInt(isActive:)
                            ),
                            sheetContent:
                                GeneratedView<Int>.init(value: viewStore.intValue)
                                    .closableSheet(navigationTitle: "Int")
                        )

                    TitleRow(model: .init(title: "Generate float value", symbol: .chevronRight))
                        .sheetPresenter(
                            isPresented: viewStore.binding(
                              get: { $0.floatValueGenerated },
                              send: GeneratorAction.generateFloat(isActive:)
                            ),
                            sheetContent:
                                GeneratedView<Float>.init(value: viewStore.floatValue)
                                    .closableSheet(navigationTitle: "Float")
                        )

                    TitleRow(model: .init(title: "Generate color", symbol: .chevronRight))
                        .sheetPresenter(
                            isPresented: viewStore.binding(
                              get: { $0.colorGenerated },
                              send: GeneratorAction.generateColor(isActive:)
                            ),
                            sheetContent:
                                GeneratedColorView(color: viewStore.color)
                                    .closableSheet(navigationTitle: "Color")
                        )
                }
                    .listStyle(GroupedListStyle())
                    .navigationBarTitle("Generators", displayMode: .large)
                    .navigationViewStyle(StackNavigationViewStyle())
            }
        }
    }
}

struct GeneratedView<A: _FormatSpecifiable>: View {
    let value: A?

    var body: some View {
        ZStack {
            value.map {
                Text("\($0)")
                    .font(.largeTitle)
                    .bold()
            }

            if value == nil {
                ErrorView()
            }
        }
    }
}

struct GeneratedColorView: View {
    let color: Color?

    var body: some View {
        ZStack {
            color.map {
                Rectangle()
                    .foregroundColor($0)
            }

            if color == nil {
                ErrorView()
            }
        }
    }
}

struct ErrorView: View {
    var body: some View {
        Text("Something went wrong!")
            .font(.largeTitle).bold()
    }
}

#if DEBUG
struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorView(
            store: .init(
                initialState: GeneratorState(),
                reducer: .empty,
                environment: GeneratorEnvironment()
            )
        )
    }
}
#endif
