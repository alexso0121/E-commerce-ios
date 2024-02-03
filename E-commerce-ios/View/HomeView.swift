//
//  HomeView.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 15/1/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel=Product_ViewModel()

    @Binding var cart_num:Int
    let columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View{
        VStack {
            Text("View 2: \(cart_num)")
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.products.indices, id: \.self){item in
                        ProductItem_Card(  product: viewModel.products[item] ,cartCount: $cart_num).frame(width: 155.0, height: 250.0)
                    }
                    
                }
            }
            
                .onAppear(){
                    if(viewModel.products.isEmpty){
                        print("hi")
                        Task{
                            await viewModel._getAllProduct()
                        }
                    }
                }
            
            
        }
        
    }
    
    
    
}

struct HomeView_Preview:PreviewProvider{
    static var previews: some View {
        HomeView(cart_num:Binding.constant(3))
    }
}

