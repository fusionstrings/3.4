//
//  LoggedInView.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-24.
//
// LoggedInView.swift

import SwiftUI

struct LoggedInView: View {
    let userDetails: UserDetails = UserDetails(
        firstName: "Erik",
        lastName: "Svensson",
        accountNumber: "1234 5678 9012",
        balance: "100,000 SEK"
    )

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Welcome, \(userDetails.firstName) \(userDetails.lastName)!")
                .font(Theme.headingFont)
                .foregroundColor(Theme.textColor)
            
            HStack {
                Text("Account Number:")
                    .font(Theme.bodyFont)
                    .foregroundColor(Theme.textColor)
                Spacer()
                Text(userDetails.accountNumber)
                    .font(Theme.bodyFont)
                    .foregroundColor(Theme.textColor)
            }
            
            HStack {
                Text("Balance:")
                    .font(Theme.bodyFont)
                    .foregroundColor(Theme.textColor)
                Spacer()
                Text(userDetails.balance)
                    .font(Theme.bodyFont)
                    .foregroundColor(Theme.textColor)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Theme.backgroundColor)
    }
}

struct UserDetails {
    var firstName: String
    var lastName: String
    var accountNumber: String
    var balance: String
}

#Preview {
    LoggedInView()
}
