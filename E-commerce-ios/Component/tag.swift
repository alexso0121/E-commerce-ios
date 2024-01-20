//
//  tag.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 20/1/2024.
//

import Foundation
import SwiftUI

struct Tag:View{
    var body: some View{
        ZStack{
            VStack{
                Text("新鮮直送")
                    .fontWeight(.light)
                    
            }.frame(width:100,height: 25)
                .cornerRadius(10)
                .shadow(radius: 5)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(hue: 0.258, saturation: 0.342, brightness: 0.967)/*@END_MENU_TOKEN@*/)

            Circle()
                      .fill(Color.green) // Change the fill color if needed
                      .frame(width: 15, height: 15) // Adjust the size as needed
                      .overlay(
                          Image(systemName: "leaf")
                              .resizable()
                              .scaledToFit()
                              .foregroundColor(.white)
                              .padding(2)
                      ).offset(x:-50,y: 0)
                
                
        }
        

    }
}


struct Tag_Preview:PreviewProvider{
    static var previews: some View{
        Tag()
    }
}
