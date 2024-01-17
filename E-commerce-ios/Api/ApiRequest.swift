//
//  ApiRequest.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 15/1/2024.
//

import Foundation

struct ApiRequest{
    
    static func getAllProducts()  async  -> [Product]{
        let apiManager=APIManager.shared
        var result:ProductsResponse_DTO=ProductsResponse_DTO(products: [])
        do{
            result = try await apiManager.makeAPIRequest(url: "https://everuts-codetest.s3.ap-southeast-1.amazonaws.com/products_1.json")
            print(result)
        }catch{
            print("Error fetching products: \(error)")
        }
        return result.products
    }
    
    
}
