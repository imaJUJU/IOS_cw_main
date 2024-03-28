//
//  DetailsPage.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-28.
//

import SwiftUI

struct DetailsPage: View {
    @Environment(\.presentationMode) var presentationMode
        
    var body: some View {
        ZStack{
            Color(.white)
            VStack{
                ScrollView{
                    Image("img_2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                    
                    
                    DescriptionView()
                        .offset(y: -100)
                    
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("   Price")
                            .font(.title2)
                        Text("    Rs. 2800")
                            .font(.title3)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    
                    
                    Spacer()
                    
                    NavigationLink(destination: ShoppingCartView()) {
                        Button(action: {
                            // Add code to add the item to the shopping cart
                        }) {
                            Text("Add to Cart")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding()
                                .padding(.horizontal)
                                .background(Color.brown)
                                .cornerRadius(10.0)
                        }
                    }
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
        DetailsPage()
    }
}
struct DescriptionView: View {
    //@StateObject private var viewModel = ShoppingCartViewModel()
    @State private var quantity: Int = 1
    var body: some View {
        
        VStack(alignment: .leading){
            HStack{
                Text("Women")
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
            
                
            Text("2-piece sweatshirt and skirt set")
                .font(.headline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            HStack(spacing: 2) {
                ForEach(0..<5) { item in
                    Image("star")
                        .resizable()
                        .frame(width: 10, height: 10)
                }
                Text("(4.8)")
                    .font(.caption)
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            Text("Description")
                .font(.caption)
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("This set includes a sweatshirt top and a  woven skirt, both made of soft brushed fabric, with adjustable elastication and concealed zip and press stud closure.")
                .font(.caption)
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Select Color")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    HStack{
                        ColorDotView(color: .brown, text:"")
                        ColorDotView(color: .pink, text:"")
                        ColorDotView(color: .black, text:"")
                        ColorDotView(color: .blue, text:"")
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Select Size")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: .gray, text:"XS")
                        ColorDotView(color: .gray, text:"S")
                        ColorDotView(color: .gray, text:"M")
                        ColorDotView(color: .gray, text:"L")
                        ColorDotView(color: .gray, text:"XL")
                        ColorDotView(color: .gray, text:"XXL")
                   
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                    
                
            }
            .padding(.vertical)
            
            
            
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color: Color
    let text: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20) // Adjust size as needed
            Text(text)
                .foregroundColor(.white)
                .font(.caption2)
        }
    }
}
