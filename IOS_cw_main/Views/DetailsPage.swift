import SwiftUI
import Kingfisher

struct DetailsPage: View {
    
    @Environment(\.presentationMode) var presentationMode
    var product : ProductModel
    @Binding var cart: [ShoppingCartItem]
    @State private var quantity: Int = 1
    
        
    var body: some View {
        ZStack{
            Color(.white)
            VStack{
                ScrollView{
                    KFImage(URL(string:product.imageURL))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    
                    
                    DescriptionView(product: product, quantity:$quantity)
                        .padding(.top, -20)
//                        .offset(y: -100)
                        
                    
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("   Price")
                            .font(.title2)
                        Text("Rs.\(product.price)")
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    Spacer()
                    
//                    NavigationLink(destination: ShoppingCartView(cartItems: [])) {
                    Button(action: {
                        let index : Int = cart.firstIndex(where:{ $0.product.id == product.id} ) ?? -1
                        
                        if index>0 {
                            cart[index].quantity += quantity
                        }else{
                            cart.append(ShoppingCartItem(product: product, quantity: quantity, price: Double(product.price)! * Double(quantity)))
                        }
                    }) {
                        Text("Add to Cart")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding()
                            .padding(.horizontal)
                            .background(Color.brown)
                            .cornerRadius(10.0)
                    }
//                    }

                }
                .padding()
                .background(Color.white)
                
            }
            .edgesIgnoringSafeArea(.all)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: (
            
            HStack {
                   Button(action: {
                       self.presentationMode.wrappedValue.dismiss()
                   }) {
                       Image(systemName: "chevron.backward")
                           .padding(.all, 12)
                           .background(Color.white)
                           .foregroundColor(.black)
                           .cornerRadius(8.0)
                   }
                   Spacer() // Add spacer to push the cart image to the right
                   // Adjust padding as needed
               }
        ))
    }
}

struct DetailsPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPage(product: product1, cart: .constant([item1]))
    }
}
struct DescriptionView: View {
    var product: ProductModel
    @Binding var quantity: Int
    @State private var selectedColor: Color?
    @State private var selectedSize: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(product.sex)
                    .font(.caption)
                    .fontWeight(.light)
                Spacer()
                Button(action: {
                    if quantity > 1 {
                        quantity -= 1
                    }
                }) {
                    Image(systemName: "minus")
                        .padding(.all, 8)
                }
                .frame(width: 25, height: 25)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                .foregroundColor(.black)
                Text("\(quantity)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 2)
                Button(action: {
                    quantity += 1
                }) {
                    Image(systemName: "plus")
                        .padding(.all, 8)
                }
                .frame(width: 25, height: 25)
                .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                .foregroundColor(.black)
            }
            Text(product.name)
                .font(.headline)
                .fontWeight(.bold)
            HStack(spacing: 2) {
                            ForEach(0..<product.rating) { item in
                                Image("star")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                            }
                Text("(\(product.rating).0)")
                    .font(.caption)
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            Text("Description")
                .font(.caption)
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text(product.description)
                .font(.caption)
                .lineSpacing(8.0)
                .opacity(0.6)
            HStack {
                VStack(alignment: .leading) {
                    Text("Select Color")
                        .font(.caption)
                        .fontWeight(.semibold)
                    HStack {
                        ForEach(ProductColor.allCases, id: \.self) { color in
                            ColorDotView(color: color.color, text: "", isSelected: selectedColor == color.color)
                                .onTapGesture {
                                    selectedColor = color.color
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                VStack(alignment: .leading) {
                    Text("Select Size")
                        .font(.caption)
                        .fontWeight(.semibold)
                    HStack {
                        ForEach(ProductSize.allCases, id: \.self) { size in
                            ColorDotView(color: .gray, text: size.rawValue, isSelected: selectedSize == size.rawValue)
                                .onTapGesture {
                                    selectedSize = size.rawValue
                                }
                        }
                    }
                }
            }
            .padding(.vertical)
            
            Spacer()
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius(30.0)
    }
}

struct ColorDotView: View {
    let color: Color
    let text: String
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            Text(text)
                .foregroundColor(.white)
                .font(.caption2)
        }
        .overlay(Circle().stroke(Color.black, lineWidth: isSelected ? 2 : 0))
    }
}

enum ProductColor: String, CaseIterable {
    case brown = "Brown"
    case pink = "Pink"
    case black = "Black"
    case blue = "Blue"
    
    var color: Color {
        switch self {
        case .brown: return .brown
        case .pink: return .pink
        case .black: return .black
        case .blue: return .blue
        }
    }
}

enum ProductSize: String, CaseIterable {
    case XS, S, M, L, XL, XXL
}
