//
//  LoggedInView.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-24.
//
// LoggedInView.swift

import SwiftUI

struct LoggedInView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome, User!")
                .font(.title)
                .padding()
            Text("SIM Numbers: 12345, 67890")
            Button("Buy more SIMs") {
                // Implement purchase functionality
            }
            Button("Log out") {
                authViewModel.logout()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding()
    }
}

// SwiftUI Preview
struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView()
    }
}

