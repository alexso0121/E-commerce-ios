//
//  AuthView.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 7/2/2024.
//

import Foundation
import SwiftUI

struct AuthView: View {
    @State private var isRegistering = false
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Text(isRegistering ? "Register":"Login").font(.title)
            TextField("Username", text: $viewModel.username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $viewModel.password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if isRegistering {
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button(action: {
                if isRegistering {
                    viewModel.register()
                } else {
                    viewModel.login()
                }
            }) {
                Text(isRegistering ? "Register" : "Login")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: {
                isRegistering.toggle()
            }) {
                Text(isRegistering ? "Already have an account? Login" : "Don't have an account? Register")
                    .padding()
            }
        }
        .padding()
    }
}

struct Auth_Preview:PreviewProvider{
    static var previews: some View{
        AuthView(viewModel: AuthViewModel())
    }
}
