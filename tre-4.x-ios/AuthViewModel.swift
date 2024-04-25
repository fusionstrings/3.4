import SwiftUI

// Define a model for user subscriptions
struct UserSubscription {
    var plans: [TelecomPlan]
}

// Define a model for telecom plans
struct TelecomPlan: Identifiable {
    let id: UUID
    var phoneNumber: String
    let name: String
    let dataUsage: String
    let dataLimit: String
    let planType: PlanType
    var isActive: Bool
    
    // Generate a new UUID by default if none is provided
    init(id: UUID = UUID(), phoneNumber: String, name: String, dataUsage: String, dataLimit: String, planType: PlanType, isActive: Bool = true) {
        self.id = id
        self.phoneNumber = phoneNumber
        self.name = name
        self.dataUsage = dataUsage
        self.dataLimit = dataLimit
        self.planType = planType
        self.isActive = isActive
    }
}

// Enum for plan types
enum PlanType: String, CaseIterable {
    case flexi = "FLEXi"
    case unlimited = "UNLIMITED"
    case threeFourX = "3.4x"
}

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = true
    @Published var userSubscription = UserSubscription(plans: [])
    @Published var availablePlanTypes: [PlanType] = [.flexi, .unlimited, .threeFourX]

    init() {
        // Initialize with a default plan
        addSubscription(planType: .unlimited, phoneNumber: generatePhoneNumber())
    }
    
    func addSubscription(planType: PlanType, phoneNumber: String) {
        let newPlan = TelecomPlan(phoneNumber: phoneNumber, name: planType.rawValue, dataUsage: "0GB", dataLimit: planType == .unlimited ? "Unlimited" : "50GB", planType: planType)
        userSubscription.plans.append(newPlan)
    }

    func deactivateSubscription(id: UUID) {
        if let index = userSubscription.plans.firstIndex(where: { $0.id == id }) {
            userSubscription.plans[index].isActive = false
        }
    }

    func generatePhoneNumber() -> String {
        let number = (1000000...9999999).randomElement() ?? 1000000
        return "+4670\(number)"
    }
    
    func login() {
        isLoggedIn = true
    }
    
    func logout() {
        isLoggedIn = false
    }
}
