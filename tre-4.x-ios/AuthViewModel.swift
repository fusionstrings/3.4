//
//  AuthViewModel.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-25.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false  // Toggle this for testing logged in/out views

    func login() {
        withAnimation {
            isLoggedIn = true
        }
    }

    func logout() {
        withAnimation {
            isLoggedIn = false
        }
    }
}
