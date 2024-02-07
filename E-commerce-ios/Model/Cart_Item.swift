//
//  Cart_Item.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 21/1/2024.
//

import Foundation

struct Cart_Item :Codable,Identifiable{
    var id:UUID
    var productId: Int
    var number:Int
    var name:String
    var unitPrice:Float
    
    init(productId:Int,number:Int,name:String,unitPrice:Float) {
        self.id=UUID()
        self.productId=productId
        self.number=number
        self.name=name
        self.unitPrice=unitPrice
    }
    
}
