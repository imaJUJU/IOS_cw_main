import SwiftUI

struct ShoppingCartView: View {
    @Binding var cartItems: [ShoppingCartItem]
    @State private var isCheckoutActive = false
    @State private var total : Double = 0
    
    var body: some View {
        VStack {
            Text("My Cart")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(cartItems) { item in
                        ShoppingCartTile(item: item, cartItems: $cartItems, total: $total)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            HStack {
                Text("Total:")
                Spacer()
                Text("Rs.\(self.total, specifier: "%.2f")")
            }.padding([.leading,.trailing],30)
            
            if cartItems.count > 0 {
                Button(action: {
                    isCheckoutActive = true
                }) {
                    Text("Checkout")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color.brown)
                        .cornerRadius(10.0)
                }
                .padding(.horizontal)
            }else{
                Button(action: {
                   
                }) {
                    Text("Checkout")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray)
                        .cornerRadius(10.0)
                }
                .padding(.horizontal)
                .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
            
           
            
            NavigationLink(destination: CheckoutView(cartItems: $cartItems), isActive: $isCheckoutActive){}
        }
        .onAppear{
            var value: Double = 0
            
            for item in cartItems {
                value += item.price
            }
            
            total = value
        }
    }
}

struct ShoppingCartTile: View {
    let item: ShoppingCartItem
    @Binding var cartItems: [ShoppingCartItem]
    @Binding var total: Double
    
    var body: some View {
        HStack(spacing: 10) {

            Text(item.product.name)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
            
            Text("Qty: \(item.quantity)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text("Rs.\(item.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Button{
                
                total -= item.price
                
                if let index = cartItems.firstIndex(where: { $0.id == item.id}){
                    cartItems.remove(at: index)
                }
            
            }label: {
                Image(systemName: "xmark")
            }.foregroundColor(.black)
        }
        .padding(10)
    }
}




struct ShoppingCartView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView(cartItems: .constant([item1]))
    }
}
