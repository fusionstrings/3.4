//
//  AuthenticationView.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-24.
//

// AuthenticationView.swift

import SwiftUI

struct AuthenticationView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        NavigationView {
            if isLoggedIn {
                LoggedInView()
            } else {
                VStack(spacing: 20) {
                    Text("Welcome")
                        .font(Theme.headingFont)
                        .foregroundColor(Theme.textColor)
                    
                    NavigationLink("Login", destination: LoginView())
                    NavigationLink("Sign Up", destination: SignUpView())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Theme.backgroundColor)
                .navigationBarHidden(true)
            }
        }
    }
}

struct SignUpView: View {
    var body: some View {
        Text("Sign Up View")
            .font(Theme.headingFont)
            .foregroundColor(Theme.textColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Theme.backgroundColor)
    }
}


#Preview {
    AuthenticationView()
}
