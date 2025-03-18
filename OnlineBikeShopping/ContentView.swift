import Inject
import SwiftUI

struct ContentView: View {
    var body: some View {
        CustomTabBarView(tabItems: [
            TabItem(view: AnyView(MainScreen()), icon: AnyView(Image("item_nav1"))),
            TabItem(view: AnyView(SampleView(color: .red, content: "red screen")), icon: AnyView(Image("item_nav2"))),
            TabItem(view: AnyView(SampleView(color: .green, content: "green screen")), icon: AnyView(Image("item_nav3"))),
            TabItem(view: AnyView(SampleView(color: .blue, content: "blue screen")), icon: AnyView(Image("item_nav4"))),
        ])
    }
}
