//
//  E_commerce_iosApp.swift
//  E-commerce-ios
//
//  Created by tsz hin so on 15/1/2024.
//

import SwiftUI

@main
struct E_commerce_iosApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Cart_Item_ViewModel()
                                  )
        }
    }
}
