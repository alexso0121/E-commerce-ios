//
//  CartView.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 3/2/2024.
//

import Foundation
import SwiftUI

struct CartView :View{
    @EnvironmentObject var cart_vm:Cart_Item_ViewModel
    
    var body: some View{
        
            VStack{
                Text("Your Cart:").font(.headline)
                List(cart_vm.cart) { cart in
                    HStack{
                        Text(cart.name)
                        Spacer()
                        Text(String(cart.number))
                    }.contextMenu{
                        Button(action:{
                            cart_vm._deleteCartItem(_cart:cart )
                        }){
                            HStack{
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                    }
                }
                Spacer()
                HStack{
                    Spacer()
                    Text("Current Price $ \(String(format:"%.2f",cart_vm.totalPrice))")
                }
                
               
            }
            .padding()
        
    }
}


struct CartViewPreview:PreviewProvider{
    static var previews: some View{
        CartView().environmentObject(Cart_Item_ViewModel())
    }
}
