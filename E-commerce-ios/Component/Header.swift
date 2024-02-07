//
//  Header.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 18/1/2024.
//

import Foundation
import SwiftUI

struct Header : View{
      var count:Int
    
    

    var body: some View{
        
       
            HStack{
                HStack{
                    Image(systemName: "line.horizontal.3")                    .resizable()
                        .foregroundColor(Color(hue: 0.411, saturation: 0.476, brightness: 0.832))
                        .frame(width:20,height:13)
                    Text("選項目錄")
                        .font(.system(size: 12, design: .default))
                        .foregroundColor(Color(hue: 0.411, saturation: 0.476, brightness: 0.832))
                    Spacer()
                    
                }.frame(maxWidth:100, maxHeight:.infinity ).padding(8)
                Spacer()
                Text("Alex Mall")
                    .font(.system(size: 20, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hue: 0.395, saturation: 0.968, brightness: 0.629))
                Spacer()
                // Action to be performed when the HStack is tapped
                NavigationLink(destination:CartView()){
                    
                    HStack(){
                        Spacer()
                        CartBadge(count:count)
                        
                    }.frame(maxWidth:100,maxHeight:.infinity)
                        .padding(8)
                    
                }
            }.padding(2)
                .overlay(
                    Rectangle()
                        .frame(width: nil, height: 1, alignment: .bottom)
                        .foregroundColor(Color.gray), // Adjust the color of the border
                    alignment: .bottom
                )
//                .offset(y: max(0, -geo.frame(in: .global).minY))
//                .zIndex(1) // Set Z-index to 1 to make it topmost

            
            
        }

        
    
}

struct Header_preview:PreviewProvider{
   static var previews: some View{
       Header(count: 3).frame(height: 50)
    }
}
