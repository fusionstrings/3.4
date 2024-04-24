//
//  LoggedInView.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-24.
//
// LoggedInView.swift

import SwiftUI

struct LoggedInView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    
    let userDetails: UserDetails

    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome, \(userDetails.firstName) \(userDetails.lastName)!")
                    .font(Theme.headingFont)
                    .foregroundColor(Theme.textColor)
                
                Text("Account Number: \(userDetails.accountNumber)")
                    .font(Theme.bodyFont)
                    .foregroundColor(Theme.textColor)
                
                Text("Balance: \(userDetails.balance)")
                    .font(Theme.bodyFont)
                    .foregroundColor(Theme.textColor)
            }
            .padding()

            Spacer()
            
            Button(action: {
                isLoggedIn = false // This changes the @AppStorage value, triggering the view switch
            }) {
                Text("Log Out")
                    .font(Theme.bodyFont)
                    .foregroundColor(Theme.textColor)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Theme.primaryColor)
                    .cornerRadius(8)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.backgroundColor)
        .navigationBarHidden(true)
    }
}

struct UserDetails {
    var firstName: String
    var lastName: String
    var accountNumber: String
    var balance: String
}

// Placeholder data for the purpose of demonstration
extension UserDetails {
    static var placeholder: UserDetails {
        return UserDetails(
            firstName: "Erik",
            lastName: "Svensson",
            accountNumber: "1234 5678 9012",
            balance: "100,000 SEK"
        )
    }
}

// SwiftUI Preview
struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView(userDetails: .placeholder)
    }
}

