//
//  LoggedOutView.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-25.
//

import SwiftUI

struct LoggedOutView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("tre-logo")  // Ensure logo is added to Assets.xcassets
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 50)
            Text("4.x")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding()
            Button(action: {
                authViewModel.login()
            }) {
                HStack {
                    Image("BankID_logo_black")  // Ensure this image is correctly imported into your project assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                    Text("Login with BankID")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color(.sRGB, red: 255/255, green: 92/255, blue: 0/255, opacity: 1.0))
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        //.cornerRadius(10)
        //.shadow(radius: 5)
        .padding()
    }
}

struct LoggedOutView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedOutView().environmentObject(AuthViewModel())
    }
}
