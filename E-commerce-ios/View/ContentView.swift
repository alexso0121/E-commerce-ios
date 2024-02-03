//
//  ContentView.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 15/1/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cart_vm=Cart_Item_ViewModel()
    
    var body: some View {
        
            NavigationView {
                VStack{
                Header(count:$cart_vm.cart_num).frame(maxHeight: 50)

                HomeView(cart_num: $cart_vm.cart_num)
                    .environmentObject(cart_vm)
                
                
            }}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
