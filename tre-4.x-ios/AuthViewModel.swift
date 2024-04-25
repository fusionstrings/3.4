//
//  AuthViewModel.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-25.
//

import SwiftUI

// Define a model for user subscriptions
struct UserSubscription {
    let phoneNumber: String
    var plans: [TelecomPlan] // 'plans' is now a variable
}

// Define a model for telecom plans
struct TelecomPlan: Identifiable {
    let id: UUID
    let name: String
    let dataUsage: String
    let dataLimit: String
    let planType: PlanType
    
    init(id: UUID = UUID(), name: String, dataUsage: String, dataLimit: String, planType: PlanType) {
        self.id = id
        self.name = name
        self.dataUsage = dataUsage
        self.dataLimit = dataLimit
        self.planType = planType
    }
}

// Enum for plan types
enum PlanType: String, CaseIterable {
    case flexi = "FLEXi"
    case unlimited = "UNLIMITED"
    case threeFourX = "3.4x"
}

// Sample data
let availablePlans = [
    TelecomPlan(name: "My FLEXi Plan", dataUsage: "10GB", dataLimit: "50GB", planType: .flexi),
    TelecomPlan(name: "UNLIMITED 5G", dataUsage: "Unlimited", dataLimit: "Unlimited", planType: .unlimited),
    TelecomPlan(name: "3.4x Advantage", dataUsage: "25GB", dataLimit: "100GB", planType: .threeFourX)
]

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = true
    @Published var userSubscription = UserSubscription(
        phoneNumber: "+1234567890",
        plans: [TelecomPlan(id: UUID(), name: "UNLIMITED 5G", dataUsage: "Unlimited", dataLimit: "Unlimited", planType: .unlimited)]
    )

    // Mock function to simulate adding a subscription
    func addSubscription(plan: TelecomPlan) {
        if !userSubscription.plans.contains(where: { $0.id == plan.id }) {
            userSubscription.plans.append(plan)
        }
    }
    func login() {
        // Your login logic goes here
        // For now, we'll just set isLoggedIn to true to simulate a login
        isLoggedIn = true
    }
    // Mock function to simulate login/logout
    func logout() {
        isLoggedIn = false
    }
}
