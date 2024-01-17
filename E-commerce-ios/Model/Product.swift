//
//  Product.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 15/1/2024.
//

import Foundation

struct Product:Codable{
    var id:Int
    var image: String
    var name: String
    var brand:String
    var price: Price_DTO
    var discountPrice: Price_DTO
}

