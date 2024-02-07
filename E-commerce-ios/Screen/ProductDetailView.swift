//
//  ProductDetailView.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 18/1/2024.
//

import Foundation
import SwiftUI

struct ProductDetailView:View{
    @EnvironmentObject var Carts:Cart_Item_ViewModel

    
    let product:Product;
    let multiLineText="dfsfdfsafs\ndfsfdsfsa\nsdf"
    @State var value:Int = 1
    var body: some View{
        NavigationView(){
            VStack{
                ScrollView(showsIndicators: false) {
                    LoadImage(url: product.image).frame(height:400)
                    DetailInfoContainer()
                    DescriptionContainer()
                    ItemNumberBox()
//                    Button("Update State") {
//                                  AddToCart()
//                               }
                    
                    VStack(alignment:.leading){
                        Spacer()
                            .frame( height: 16)
                        HStack(spacing:18){
                            RectIconButton(buttonAction: AddToCart, backgroundColor: Color.ECGreyColor, iconColor: Color.white, iconPath: "cart.fill", leftColor: Color.green, buttonText: "加入購物車", height: 45, width: 160
                            )
                            RectIconButton(buttonAction: nil, backgroundColor: Color.ECGreyColor, iconColor: Color.secondary, iconPath: "heart.fill", leftColor: Color.secondary, buttonText: "加入喜愛清單", height: 45, width: 160
                            )
                        }
//                        Button("Update State") {
//                                      AddToCart()
//                                   }

                        Spacer()
                            .frame( height: 16)
                    }
                    
                }.padding(.horizontal)
                    .font(.system(size: 14))
                  
                
                
            }
        }}
    
    private func AddToCart  () async ->Void  {
        let cartItem:Cart_Item=Cart_Item(productId: product.id, number: value)

        Carts._updateCart(item: cartItem)

        print("onclick")
    }
    
    func DetailInfoContainer()->some View{
        return VStack(alignment: .leading){
            
            Text(product.brand)
                .fontWeight(.bold)
            Text(product.name)
                .fontWeight(.bold)
            Spacer()
                .frame(minHeight: 4, maxHeight: 5)
            Text("產地：中國")
            
            HStack(alignment:.bottom){
                Text("$ \(String(format:"%.2f",product.price.value))")
                    .foregroundColor(Color.black)
                    .strikethrough()
                    .font(.system(size: 12))
                Spacer()
                Tag()
            }
            Text("$ \(String(format:"%.2f",product.discountPrice.value))")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(hue: 1.0, saturation: 0.803, brightness: 0.962))
            Spacer()
                .frame( height: 1)
            HStack{
                RatingStar(rating: 2).frame(width: 200)
                Spacer()
                Text("7 則評論")
                    
                
                Image(systemName: "arrowtriangle.right.fill")
                    .resizable()
                    .frame(width:6,height:6)
                
            }.frame(height:60)

        }
        .overlay(
            Rectangle()
                .frame(width: nil, height: 1, alignment: .bottom)
                .foregroundColor(Color.gray), // Adjust the color of the border
            alignment: .bottom
        )
    }
    
    
    
    func DescriptionContainer() ->some View{
        return   VStack(alignment:.leading){
            Spacer()
                .frame( height: 12)
            ForEach(multiLineText.split(separator: "\n"), id: \.self) { line in
                           Text(String(line))
                       }
            Spacer()
                .frame( height: 25)
            HStack{
                Text("搜索編號 ：").font(.system(size:14))
                Spacer()
            }
            Spacer()
                .frame( height: 22)
        }.overlay(
            Rectangle()
                .frame(width: nil, height: 1, alignment: .bottom)
                .foregroundColor(Color.gray), // Adjust the color of the border
            alignment: .bottom
        )
        
    }
    
    func ItemNumberBox()->some View{
        return VStack(alignment: .leading ){
            Spacer().frame(height:12)
            
                Text("送貨/退貨")
               
            Spacer().frame(height:8)
            Text("・ 此商品由 AlexMall 派新")
                .foregroundColor(Color(hue: 0.131, saturation: 0.813, brightness: 0.801))
                
            Text("・ 由 \(product.brand) 出售")
                .foregroundColor(Color(hue: 0.131, saturation: 0.813, brightness: 0.801))
            Text("・ 此商品不可退貨")
                .foregroundColor(Color(hue: 0.131, saturation: 0.813, brightness: 0.801))
            Spacer().frame(height:15)
            
            Text("數量：")
            
            HStack{
                Button(
                    "+"
                ){
                    value+=1
                }
                .frame(width:40,height:40)
                .background(Color.ECGreyColor)
                .foregroundColor(Color.black)
                
                
                Button(String(value)){
                   
                }
                .frame(width:60,height:40)
                .background(Color.ECGreyColor)
                .foregroundColor(Color.black)
                
                Button("-"){
                    if(value>0) {value-=1}
                }
                .frame(width:40,height:40)
                .background(Color.ECGreyColor)
                .foregroundColor(Color.black)
                
                Spacer()
            }
            Spacer().frame(height:22)
            
            
        }.overlay(
            Rectangle()
                .frame(width: nil, height: 1, alignment: .bottom)
                .foregroundColor(Color.gray), // Adjust the color of the border
            alignment: .bottom
        )
    }
    
}


//struct ProductDetailView_Preview:PreviewProvider{
//    static var previews: some View {
//        ProductDetailView(cartCount: 2, product: <#T##Product#>,product: Product(id: 0, image: "https://picsum.photos/id/28/300/300", name: "Product 0", brand:  "Brand 0", price: Price_DTO(currency: "JPY", value:  363.93), discountPrice: Price_DTO(currency: "JPY", value:  363.93)))
//    }
//}
