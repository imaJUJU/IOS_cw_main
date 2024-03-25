import SwiftUI

struct HomeBarView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {
                Color.black
                    .frame(height: 60)
                    .cornerRadius(30)
                
                HStack {
                    ForEach(0..<4) { index in
                        Button(action: {
                            selectedTab = index
                            navigateToTab(index)
                        }) {
                            VStack {
                                Image(systemName: index == selectedTab ? selectedIconName(forIndex: index) : unselectedIconName(forIndex: index))
                                    .foregroundColor(index == selectedTab ? .brown : .white)
                                    .padding()
                                    .background(index == selectedTab ? Color.white : Color.clear)
                                    .clipShape(Circle())
                                    .padding(14)
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
    
    func selectedIconName(forIndex index: Int) -> String {
        switch index {
        case 0:
            return "house.fill"
        case 1:
            return "tag.fill"
        case 2:
            return "cart.fill"
        case 3:
            return "person.fill"
        default:
            return ""
        }
    }
    
    func unselectedIconName(forIndex index: Int) -> String {
        switch index {
        case 0:
            return "house"
        case 1:
            return "tag"
        case 2:
            return "cart"
        case 3:
            return "person"
        default:
            return ""
        }
    }
    
    func navigateToTab(_ index: Int) {
        // Define navigation actions based on the selected tab
        switch index {
        case 0:
            // Navigate to home page (ContentView)
            print("Navigate to home page")
            // You can use NavigationLink here to navigate to ContentView
        case 1:
            // Placeholder action for offers
            print("Navigate to offers page")
            // Implement navigation to the offers page
        case 2:
            // Navigate to shopping cart page (ShoppingCartView)
            print("Navigate to shopping cart")
            // You can use NavigationLink here to navigate to ShoppingCartView
        case 3:
            // Placeholder action for profile
            print("Navigate to profile page")
            // Implement navigation to the profile page
        default:
            break
        }
    
    

    }
}

struct HomeBarView_Previews: PreviewProvider {
    @State static var selectedTab = 0
    
    static var previews: some View {
        HomeBarView(selectedTab: $selectedTab)
    }
}
