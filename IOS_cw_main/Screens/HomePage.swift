//
//  HomePage.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

struct Category: Identifiable {
    var id = UUID()
    var name: String
}

extension Color {
    init(hex: String, alpha: Double = 1.0) {
        var hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgb: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&rgb)
        
        self.init(
            .sRGB,
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0,
            opacity: alpha
        )
    }
}

struct HomePage: View {
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
                            SearchBarView()
                            
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
                            
                            CategoryView()
                            
                            Text("Popular")
                                .font(.custom("Optima", size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.leading, 0) // Push to the left
                                .padding()
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<4) { index in
                                        NavigationLink(
                                            destination: DetailsPage(),
                                            label: {
                                                ProductCardView(image: Image("img_\(index + 1)"), size: 150)
                                            })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                    }
                                    .padding(.trailing)
                                }
                                .padding(.leading)
                            }
                        }
                    }
                }
                
                // Move the HStack inside the ZStack
                HStack {
                    NavigationLink(destination: HomePage()) {
                        Image("home_brown")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 30)

                    }
                    
                    HomeBar(image: Image("heart_white")) {}
                    
                    NavigationLink(destination: ShoppingCartView()) {                Image("cart_white")
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
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}

struct SearchBarView: View {
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image("SEARCH")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 8)
                TextField("Search Items", text: $search)
            }
            .padding(.all, 10)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10.0)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("filter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .padding()
                    .background(Color(hex: "#5E460B"))
                    .cornerRadius(10.0)
            }
        }
        .padding()
    }
}
    
struct AdvertisementView: View {
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            VStack(alignment: .leading, spacing: 5) {
                Text("New")
                    .font(.custom("Optima", size: 35))
                    .foregroundColor(.black)
                    .italic()
                Text("    Collection")
                    .font(.custom("Optima", size: 35))
                    .foregroundColor(.black)
                    .italic()
                
                Button(action: {
                    // Add action to navigate to the shop page
                }) {
                    Text("Shop Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.vertical, 5) // Adjust padding as needed
                        .padding(.horizontal, 10) // Adjust padding as needed
                        .background(Color(hex: "#5E460B"))
                        .cornerRadius(10)
                }
            }
            
            Image("pic1") // Replace with your image
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(30.0)
                .foregroundColor(.brown)
        }
        .padding(20)
    }
}
    
struct CategoryView: View {
    private let categories = [
        Category(name: "Dresses"),
        Category(name: "Shirts"),
        Category(name: "Pants"),
        Category(name: "Accessories"),
        Category(name: "Shoes"),
        Category(name: "Bags"),
        Category(name: "Makeups")
    ]
    let categoryIcons = ["Dress_icon", "shirt_icon", "pants_icon", "rings_icon", "Shoes_icon","bags_icon","makeup_icon"]
    @State private var selectedCategory: Category? = nil
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(categories) { category in
                    Button(action: {
                        self.selectedCategory = category
                    }) {
                        VStack {
                            Image(categoryIcons[categories.firstIndex(where: { $0.id == category.id }) ?? 0])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 60)
                                .padding(10)
                                .background(Color(hex: "#5E460B", alpha: 0.31))
                                .clipShape(Circle())
                            
                            Text(category.name)
                                .font(.caption)
                                .foregroundColor(.brown)
                        }
                        
                    }
                }
            }
            .padding()
        }
        if let selectedCategory = selectedCategory {
            CategoryImageView(category: selectedCategory.name)
                .padding(.top, 20)
            
        }
    }
}
    
    
    struct ProductCardView: View {
        let image: Image
        let size: CGFloat
        var body: some View {
            VStack {
                image
                    .resizable()
                    .frame(width: size, height: 200 * (size/210))
                    .cornerRadius(20.0)
                
                Text("hdcbnduhcbsduchj")
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack(spacing: 2) {
                    ForEach(0..<5) { item in
                        Image("star")
                            .resizable()
                            .frame(width: 15, height: 15)
                        
                    }
                    Spacer()
                    
                    Text("Rs.3500")
                        .font(.caption)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                }
            }
            .frame(width: 150)
            .padding()
            .background(Color.gray.opacity(0.1))
        }
    }
    
    struct HomeBar: View {
        let image: Image
        let action: () -> Void
        
        var body: some View {
            Button(action: {}, label: {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 30)
            })
        }
    }
    
    

