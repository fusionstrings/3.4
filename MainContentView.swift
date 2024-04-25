//
//  MainContentView.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-24.
//

import SwiftUI

struct MainContentView: View {
    @Namespace var animation
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some View {
        if isLoggedIn {
            LoggedInView(namespace: animation, userDetails: UserDetails.placeholder)
        } else {
            AuthenticationView(namespace: animation)
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}

