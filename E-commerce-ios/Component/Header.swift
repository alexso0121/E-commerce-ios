//
//  Header.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 18/1/2024.
//

import Foundation
import SwiftUI

struct Header : View{
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
            HStack(){
                Spacer()
                CartBadge()
                    
            }.frame(maxWidth:100,maxHeight:.infinity)
                .padding(8)
            
        }.padding(2).overlay(
            Rectangle()
                .frame(width: nil, height: 1, alignment: .bottom)
                .foregroundColor(Color.gray), // Adjust the color of the border
            alignment: .bottom
        )
    
    }
}

struct Header_preview:PreviewProvider{
   static var previews: some View{
       Header().frame(height: 50)
    }
}
