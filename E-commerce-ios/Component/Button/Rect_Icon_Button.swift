//
//  Rect_Button.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 21/1/2024.
//

import Foundation
import SwiftUI

struct RectIconButton : View{
   
    let buttonAction: (() -> Void)?
    let backgroundColor:Color
    let iconColor:Color
    let iconPath:String
    let leftColor:Color
    let buttonText:String
    let height:Double
    let width:Double
    

    var body: some View{
        Button(action:{
            buttonAction?()
            
        }){
            HStack{
                HStack{
                    Image(systemName: iconPath)
                }.frame(maxWidth:80,maxHeight:.infinity)
                    .background(leftColor)
                HStack{
                    Text(buttonText)
                }.frame(maxWidth:.infinity,maxHeight:.infinity)
                    
            }
            
            
        }.frame(width: width,height: height)
            .background(backgroundColor)
    }
}

struct RectIconButtonPreview:PreviewProvider{
    static var previews: some View{
        RectIconButton(buttonAction: nil, backgroundColor: Color.gray, iconColor: Color.white, iconPath: "leaf", leftColor: Color.green, buttonText: "buy", height: 80, width: 200
        )
    }
}
 
