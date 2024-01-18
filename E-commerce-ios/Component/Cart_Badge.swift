//
//  Cart_Badge.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 19/1/2024.
//

import Foundation
import SwiftUI

struct CartBadge:View{
    let count=5
    var body:some View{
        ZStack{
            Image(systemName: "cart")
                .resizable()
                .foregroundColor(Color.gray)
                .frame(width:24,height:20)
            ZStack {
                        Circle()
                            .foregroundColor(.red) // Adjust badge color
                            .frame(width: 18, height: 18)

                        Text("\(count)")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold)) // Adjust text font
            }.offset(x: 10, y: -10)
        }
    }
}

struct CartBadge_Preview:PreviewProvider{
    static var previews: some View{
        CartBadge()
    }
}
