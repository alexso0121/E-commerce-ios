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
                List(cart_vm.cart) { cart in
                    Text(String(cart.productId))
                }
                Button("Click me") {
                    // Action to be performed when the button is tapped
                    
                    let _newitem:Cart_Item=Cart_Item(productId: 1, number:1)
                    cart_vm.cart.append(_newitem)
                }
                .padding()
            }
        
    }
}


struct CartViewPreview:PreviewProvider{
    static var previews: some View{
        CartView().environmentObject(Cart_Item_ViewModel())
    }
}
