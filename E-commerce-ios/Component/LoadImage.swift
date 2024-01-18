//
//  LoadImage.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 19/1/2024.
//

import Foundation
import SwiftUI

struct LoadImage:View{
    let url:String
    var body: some View{
        AsyncImage(url: URL(string:url )) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "exclamationmark.triangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            @unknown default:
                EmptyView()
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}
