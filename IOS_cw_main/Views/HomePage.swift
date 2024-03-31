//
//  HomePage.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

struct HomePage: View {
    
    @State var productObj : [ProductModel] = products
    @State var cartObj : [ShoppingCartItem] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ZStack {
                        Color.white
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack {
                            // Advertisement Section
                            AdvertisementView()
                            
                            // Search Bar Section
                            SearchBarView(searchText: .constant(""), onSearch: {})
                            
                            HStack {
                                Text("Categories")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding(.leading, 30) // Push to the left
                                    .padding(.top, 20)
                                
                                Spacer() // Push the "See All" text to the right
                                
                                Text("See All")
                                    .font(.callout)
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10) // Push to the right
                            }
                            
                            CategoryView(prds: productObj, cart: $cartObj)
                            
                            Text("Popular")
                                .font(.custom("Optima", size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.leading, 0) // Push to the left
                                .padding()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<productObj.count) { index in
                                        NavigationLink(
                                            destination: DetailsPage(product: productObj[index], cart: $cartObj),
                                            label: {
                                                ProductCardView(product: productObj[index], cart: $cartObj, size: 150)
                                            })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                    }
                                    .padding(.trailing)
                                }
                                .padding(.leading)
                            }
                            
                            .padding(.bottom, 100)
                        }
                    }
                }
                
                // Move the HStack inside the ZStack
                HStack {
                    NavigationLink(destination: HomePage(cartObj: $cartObj.wrappedValue)) {
                        Image("home_brown")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 30)

                    }
                    
                    HomeBar(image: Image("heart_white")) {}
                    
                    
                    NavigationLink(destination: ShoppingCartView(cartItems: $cartObj)) {
                        Image("cart_white")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 30)
                    }

                    
                    HomeBar(image: Image("user_white")) {}
                    
                }
                .padding()
                .background(Color.black)
                .clipShape(Capsule())
                .padding()
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }.onAppear{
                print(self.cartObj)
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}


    

