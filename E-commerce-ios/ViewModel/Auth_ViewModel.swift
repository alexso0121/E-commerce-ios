//
//  Auth_ViewModel.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 7/2/2024.
//

import Foundation


class AuthViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isLoggedIn = false
    
    func login() {
        guard let url = URL(string: "http://localhost:3000/login") else {
                   // Handle invalid URL
                   return
               }

               let credentials = ["username": username, "password": password]

               do {
                   let jsonData = try JSONSerialization.data(withJSONObject: credentials)
                   
                   var request = URLRequest(url: url)
                   request.httpMethod = "POST"
                   request.httpBody = jsonData
                   request.addValue("application/json", forHTTPHeaderField: "Content-Type")

                   URLSession.shared.dataTask(with: request) { (data, response, error) in
                       DispatchQueue.main.async {
                           if let error = error {
                               print("Error: \(error.localizedDescription)")
                               // Handle error
                               return
                           }

                           if let data = data {
                               do {
                                   let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                                   // Handle the response accordingly
                                   if response.success {
                                       self.isLoggedIn = true
                                   } else {
                                       // Handle unsuccessful login
                                       print("Login failed: \(response.message)")
                                   }
                               } catch {
                                   print("Error decoding response: \(error.localizedDescription)")
                                   // Handle decoding error
                               }
                           }
                       }
                   }.resume()
                   self.isLoggedIn = true
               } catch {
                   print("Error creating JSON data: \(error.localizedDescription)")
                   // Handle JSON serialization error
               }
           
        
        
    }
    
    func register() {
      
        self.isLoggedIn = true
    }
    
    func logout() {
       
        self.isLoggedIn = false
    }
}

struct LoginResponse: Decodable {
    let success: Bool
    let message: String
    // Add other properties based on your server response
}
