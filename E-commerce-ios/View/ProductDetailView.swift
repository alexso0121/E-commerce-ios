//
//  ProductDetailView.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 18/1/2024.
//

import Foundation
import SwiftUI

struct ProductDetailView:View{
    let product:Product;
    var body: some View{
        NavigationView(){
            VStack{
                Header().frame(maxHeight:50)
                ScrollView(showsIndicators: false) {
                    LoadImage(url: product.image).frame(height:400)
                    VStack(alignment: .leading){
                        Text(product.brand)
                            .fontWeight(.bold)
                        Text(product.name)
                            .fontWeight(.bold)
                        Spacer()
                            .frame(minHeight: 4, maxHeight: 5)
                        Text("產地：中國").font(.system(size:14))
                        
                        HStack{
                            Text("sdf")
                            Spacer()
                            Text("sdf")
                        }
                    }
                }.padding(.horizontal)
                
            }
        }}
}


struct ProductDetailView_Preview:PreviewProvider{
    static var previews: some View {
        ProductDetailView(product: Product(id: 0, image: "https://picsum.photos/id/28/300/300", name: "Product 0", brand:  "Brand 0", price: Price_DTO(currency: "JPY", value:  363.93), discountPrice: Price_DTO(currency: "JPY", value:  363.93)))
    }
}
