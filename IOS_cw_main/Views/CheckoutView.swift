//
//  CheckoutView.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

struct CheckoutView: View {
    @Binding var cartItems: [ShoppingCartItem]
    @State private var paymentMethod: String = "Credit Card"
    @State private var shippingAddress: String = ""
    @State private var isAgreeToTerms: Bool = false
    @State private var showAlert: Bool = false
    @State private var isNavigateHome: Bool = false
    
    // Calculate subtotal, discount, delivery fee, and total payment
    var subtotal: Double {
        cartItems.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
    
    // Assuming discount, delivery fee, and total payment are hardcoded for this example
    let discount: Double = 5.00
    let deliveryFee: Double = 3.00
    var totalPayment: Double {
        subtotal - discount + deliveryFee
    }

    var body: some View {
        VStack {
            Form {
                Section(header: Text("Payment Method")) {
                    Picker(selection: $paymentMethod, label: Text("Payment Method")) {
                        Text("Credit Card").tag("Credit Card")
                        Text("PayPal").tag("PayPal")
                        // Add more payment methods if needed
                    }
                }
                
                Section(header: Text("Shipping Address")) {
                    TextField("Enter shipping address", text: $shippingAddress)
                }
                
                // Display subtotal, discount, delivery fee, and total payment
                Section(header: Text("Order Summary")) {
                    HStack {
                        Text("Subtotal:")
                        Spacer()
                        Text("Rs.\(String(format: "%.2f", subtotal))")
                    }
                    HStack {
                        Text("Discount:")
                        Spacer()
                        Text("- Rs.\(String(format: "%.2f", discount))")
                    }
                    HStack {
                        Text("Delivery Fee:")
                        Spacer()
                        Text("Rs.\(String(format: "%.2f", deliveryFee))")
                    }
                    HStack {
                        Text("Total Payment:")
                            .font(.headline)
                        Spacer()
                        Text("Rs.\(String(format: "%.2f", totalPayment))")
                            .font(.headline)
                    }
                }
            }
            
            Button(action: {
                // Place your checkout logic here, such as processing payment and confirming the order
                showAlert = true
            }) {
                Text("Place Order")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.brown)
                    .cornerRadius(10.0)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Order Confirmed"), message: Text("Your order has been successfully placed."), dismissButton: .default(Text("OK")){
                    isNavigateHome.toggle()
                })
            }
            .padding()
            
            NavigationLink(destination: HomePage(), isActive: $isNavigateHome){}
            
            Spacer()
        }
        .navigationBarTitle("Checkout")
    }
}


struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        let cartItems: [ShoppingCartItem] = [
            ShoppingCartItem(product: product1, quantity: 2, price: 10.99),
            ShoppingCartItem(product: product2, quantity: 1, price: 10.99),
            // Add more items if needed
        ]
        return NavigationView {
            CheckoutView(cartItems: .constant(cartItems))
        }
    }
}
