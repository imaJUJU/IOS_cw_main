import SwiftUI

struct HomePageView: View {
    var body: some View {
     
        
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("New")
                            .font(.custom("Arial", size: 30))
                            .fontWeight(.bold)
                            .italic()
                        Text("Collection")
                            .font(.custom("Arial", size: 30))
                            .fontWeight(.bold)
                            .italic()
                    }
                    .padding(.leading)
                    Spacer()
                    Image("img5") //
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 100) // Adjust size as needed
                        .padding()
                }
                .padding(.vertical)
                
                NavigationLink(destination: ProductDetailsView()) {
                    Text("Go to Product Details")
                }
                .padding()
                
                NavigationLink(destination: ShoppingCartView()) {
                    Text("Go to Shopping Cart")
                }
                .padding()
                
                NavigationLink(destination: CheckoutView()) {
                    Text("Go to Checkout")
                }
                .padding()
            }
            .padding()
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
