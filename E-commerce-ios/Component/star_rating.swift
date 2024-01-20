//
//  star_rating.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 20/1/2024.
//

import Foundation
import SwiftUI

struct RatingStar: View {
    let rating: Double
    let maxRating: Double = 5.0

    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .foregroundColor(.yellow) // You can change the color to your preference
                    .font(.subheadline)
            }
            Spacer().frame(width: 12)
            Text(String(rating))
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.yellow)
            Spacer()
        }
    }
}



struct RatingStar_Previews: PreviewProvider {
    static var previews: some View {
        RatingStar(rating: 2.1)
    }
}
