//
//  Cart_Item_ViewModel.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 21/1/2024.
//

import Foundation
import Combine

class Cart_Item_ViewModel:ObservableObject{
    @Published var cart:[Cart_Item]=[]
    @Published var totalPrice: Float = 0
    
    private var cancellableSet:Set<AnyCancellable>=[]

    
    func _updateCart(item:Cart_Item)   {
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
        self.cart=updatedCart
        
    }
    
    func _deleteCartItem(_cart:Cart_Item){
        if let index=self.cart.firstIndex(where: {$0.id==_cart.id}){
            self.cart.remove(at: index)
        }
    }
    
    init(){
        $cart .receive(on: RunLoop.main)
            .map{
                carts in
                var total:Float=0
                for item in carts{
                    total+=Float(item.number)*item.unitPrice
                }
                return total
            
            }
            .assign(to: \.totalPrice,on:self)
            .store(in: &cancellableSet)
            
            
                    
    }
    
   
}
