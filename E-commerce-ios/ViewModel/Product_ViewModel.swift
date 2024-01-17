//
//  Product_ViewModel.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 15/1/2024.
//

import Foundation
class Product_ViewModel:ObservableObject{
    @Published var products:[Product]=[]
    @Published var loading:Bool=false
    
 
    func _getAllProduct() async {
        loading=true
        products=await ApiRequest.getAllProducts()
        loading=false
    }

    
}
