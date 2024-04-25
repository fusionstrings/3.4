//
//  ContentView.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        ZStack {
            if authViewModel.isLoggedIn {
                LoggedInView()
                    .transition(.asymmetric(insertion: .opacity.combined(with: .scale), removal: .opacity.combined(with: .scale)))
            } else {
                LoggedOutView()
                    .transition(.asymmetric(insertion: .opacity.combined(with: .scale), removal: .opacity.combined(with: .scale)))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel())
    }
}
