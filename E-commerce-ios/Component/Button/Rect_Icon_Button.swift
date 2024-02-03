//
//  Rect_Button.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 21/1/2024.
//

import Foundation
import SwiftUI

struct RectIconButton : View{
   
    let buttonAction: (() async-> Void)?
    let backgroundColor:Color
    let iconColor:Color
    let iconPath:String
    let leftColor:Color
    let buttonText:String
    let height:Double
    let width:Double
    

    var body: some View{
        Button(action:{
            Task{
                await buttonAction?()
            }
            
        }){
            HStack(spacing:0){
                HStack{
                    Image(systemName: iconPath)
                        .resizable()
                        .frame(width:height*0.4,height:height*0.4)
                        .foregroundColor(Color.white)
                        
                }.frame(maxWidth:height,maxHeight:.infinity)
                    .background(leftColor)
                HStack{
                    Text(buttonText)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        
                }.frame(maxWidth:.infinity,maxHeight:.infinity)
                    
            }
            
            
        }.frame(width: width,height: height)
            .background(backgroundColor)
            .border(Color.gray,width: 1.5)
    }
}

struct RectIconButtonPreview:PreviewProvider{
    static var previews: some View{
        RectIconButton(buttonAction: nil, backgroundColor: Color.ECGreyColor, iconColor: Color.white, iconPath: "leaf", leftColor: Color.green, buttonText: "buy", height: 50, width: 150
        )
    }
}
 
