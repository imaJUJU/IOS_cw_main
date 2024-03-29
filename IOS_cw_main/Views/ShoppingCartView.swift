import SwiftUI

struct ShoppingCartView: View {
    let cartItems: [ShoppingCartItem]
    
    var body: some View {
        VStack {
            Text("My Cart")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            ForEach(0..<cartItems.count){ index in
                    HStack {
                        Text(cartItems[index].product.name)
                        Spacer()
                        Text("Qty: \(cartItems[index].quantity)")
                        Text("$\(cartItems[index].price, specifier: "%.2f")")
                    }
                    .padding()
            }
            
            Spacer()
            Button(action: {
                
            }) {
                Text("Checkout")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(10.0)
            }
        }
    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        return ShoppingCartView(cartItems: [item1])
    }
}
