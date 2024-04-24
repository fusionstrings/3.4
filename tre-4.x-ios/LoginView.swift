//
//  LoginView.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-24.
//

// LoginView.swift

import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        VStack(spacing: 15) {
            Text("Login with BankID")
                .font(Theme.headingFont)
                .foregroundColor(Theme.textColor)
            
            Button(action: {
                // Simulate BankID authentication success
                self.isLoggedIn = true
            }) {
                Text("Authenticate with BankID")
                    .font(Theme.bodyFont)
                    .foregroundColor(Theme.textColor)
                    .padding()
                    .background(Theme.primaryColor)
                    .cornerRadius(8)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.backgroundColor)
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}