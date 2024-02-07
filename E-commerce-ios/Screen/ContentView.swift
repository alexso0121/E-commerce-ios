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
                        Image(systemName: "cart")
                        
                    }
                    .navigationBarTitle("Tab 2")
                ProfileView()
                    .tabItem{
                        Text("Profile")
                        Image(systemName: "person")
                    }
            }.onAppear() {
                UITabBar.appearance().barTintColor = .black
                   }

        }}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
