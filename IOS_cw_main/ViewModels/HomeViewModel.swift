//
//  HomeViewModel.swift
//  IOS_cw_main
//
//  Created by Imanthi Abeyratne on 2024-03-31.
//

import Foundation
import SwiftUI

class HomeViewModel : ObservableObject {
    
    @Published var isLoading = false
   
    func getProducts(prdts: Binding<[ProductModel]>) {
        self.isLoading = true
        
        guard let url = URL(string: "http://localhost:3000/products") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data received: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let prodcs = try decoder.decode([ProductModel].self, from: data)
                
                prdts.wrappedValue = prodcs
                
                self.isLoading = false
   
            } catch {
                print("Error decoding response: \(error.localizedDescription)")
            }
        }.resume()
    }
}
