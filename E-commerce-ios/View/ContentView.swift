//
//  ContentView.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 15/1/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            TabView{
                HomeView()
                    .tabItem {
                        Text("Home")
                        Image(systemName: "house.fill")
                    }
                
                CartView()
                    .tabItem {
                        Text("Cart")
                        
                    }
                    .navigationBarTitle("Tab 2")
                    .navigationBarHidden(false)
                
            }         // Apply the default tab view style
            
            
            
            
            
        }}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
