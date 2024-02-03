//
//  Cart_Item_ViewModel.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 21/1/2024.
//

import Foundation

class Cart_Item_ViewModel:ObservableObject{
    @Published var cart:[Cart_Item]=[]
    @Published var cart_num=0
    
    func _updateCart(item:Cart_Item) async  {
        var isProductExist = false
        var updatedCart = cart.map { _item in
            var updatedItem = _item
            if item.productId == _item.productId {
                updatedItem.number = item.number
                isProductExist = true
            }
            return updatedItem
        }

        if !isProductExist {
            updatedCart.append(item)
        }
        
//       await MainActor.run{
//            self.cart_num=updatedCart.count
//            self.cart=updatedCart
//        }
    }
}
