//
//  ProductItem_Card.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 16/1/2024.
//

import Foundation
import SwiftUI

struct ProductItem_Card:View  {
    let product:Product
    
    
    var body: some View{
        VStack{
            VStack( spacing: 0) {
                renderAsyncImage(url: product.image)
                Spacer()
                    .frame(minHeight: 10, maxHeight: 10)
                productName_container(brand: product.brand, name: product.name)
                
                Spacer()
                
                price_container(currency: product.price.currency, discountValue:product.discountPrice.value, price:product.price.value)
                Spacer()
                    .frame(minHeight: 10, maxHeight: 10)
                Button{
                    print("\(product.id) is clicked")
                } label: {
                    Text("即買")
                        .foregroundColor(.black)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity, minHeight: 25)
                        .background(.yellow)
                        .cornerRadius(15)
                }
                
            }.padding(5)
            
        } .frame(width: 150.0, height: 250.0)
            .background(Color.white)
        
        
    }
    
    func renderAsyncImage(url: String) -> some View {
        return AsyncImage(url: URL(string:url )) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            @unknown default:
                EmptyView()
            }
        }
    }
    
    func productName_container(brand:String,name:String) -> some View{
        return HStack{
            VStack(alignment: .leading, spacing: 0) {
                Text(product.brand)
                    .font(.system(size: 12))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                Text(product.name)
                    .font(.system(size: 12))
                
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                
            }
            Spacer()
        }
    }
    
    func price_container(currency:String,discountValue:Float,price:Float)->some View{
        return HStack {
            Text("\(currency)  \(String(format:"%.2f",price)) ")
                .font(.system(size: 15))
            
                .fontWeight(.bold)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
            
            Spacer()
            Text(String(format:"%.2f",discountValue))
                .foregroundColor(Color.gray)
                .strikethrough()
                .font(.system(size: 10))
        }
    }
    
    
    
    
}

struct ProductItem_Card_Preview:PreviewProvider{
    
    static var previews: some View {
        
        ProductItem_Card(product: Product(id: 0, image: "https://picsum.photos/id/28/300/300", name: "Product 0", brand:  "Brand 0", price: Price_DTO(currency: "JPY", value:  363.93), discountPrice: Price_DTO(currency: "JPY", value:  363.93)))
    }
}


