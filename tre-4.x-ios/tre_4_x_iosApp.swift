//
//  tre_4_x_iosApp.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-24.
//

import SwiftUI

@main
struct tre_4_x_iosApp: App {
    @StateObject var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
