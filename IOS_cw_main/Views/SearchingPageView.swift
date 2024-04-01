import SwiftUI

struct SearchingPageView: View {
    @Binding var productObj: [ProductModel]
    
    var body: some View {
        VStack {
            SearchBarView(searchText: .constant(""), onSearch: {})
            Spacer()
        }
    }
}

struct SearchingPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingPageView(productObj: .constant([])) 
    }
}
