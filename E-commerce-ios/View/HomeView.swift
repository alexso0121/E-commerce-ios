//
//  HomeView.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 15/1/2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel=Product_ViewModel()
    let components=[
        Product(id: 0, image: "https://picsum.photos/id/28/300/300", name: "Product 0", brand:  "Brand 0", price: Price_DTO(currency: "JPY", value:  363.93), discountPrice: Price_DTO(currency: "JPY", value:  363.93)),
        Product(id: 0, image: "https://picsum.photos/id/28/300/300", name: "Product 0", brand:  "Brand 0", price: Price_DTO(currency: "JPY", value:  363.93), discountPrice: Price_DTO(currency: "JPY", value:  363.93)),
        Product(id: 0, image: "https://picsum.photos/id/28/300/300", name: "Product 0", brand:  "Brand 0", price: Price_DTO(currency: "JPY", value:  363.93), discountPrice: Price_DTO(currency: "JPY", value:  363.93)),
        Product(id: 0, image: "https://picsum.photos/id/28/300/300", name: "Product 0", brand:  "Brand 0", price: Price_DTO(currency: "JPY", value:  363.93), discountPrice: Price_DTO(currency: "JPY", value:  363.93))
    ]
    let columns = Array(repeating: GridItem(), count: 2)

    var body: some View{
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.products.indices, id: \.self){item in
                    ProductItem_Card(product: viewModel.products[item] ).frame(width: .infinity,height: 250)
                }
                
            }
        }.frame(width: 300)
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

struct HomeView_Preview:PreviewProvider{
    static var previews: some View {
        HomeView()
    }
}

