import SwiftUI
import Loadable

struct SuppObject {
    let s: Loadable<String, NSError>
}
struct PokedexHomeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PokedexHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexHomeView()
    }
}
