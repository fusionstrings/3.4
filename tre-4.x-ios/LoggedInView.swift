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
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Your Phone Number: \(authViewModel.userSubscription.phoneNumber)")
                        .font(.title2)
                        .padding()

                    ForEach(authViewModel.userSubscription.plans, id: \.id) { plan in
                        NavigationLink(destination: PlanDetailView(plan: plan)) {
                            PlanCardView(plan: plan)
                        }
                    }
                    NavigationLink(destination: AllPlansView()) {
                        Text("See All Available Plans")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Theme.primaryColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Your Subscriptions")
            .navigationBarItems(trailing: Button(action: {
                authViewModel.logout()
            }) {
                Text("Logout")
            })
        }
    }
}

struct PlanCardView: View {
    var plan: TelecomPlan

    var body: some View {
        HStack {
            Image(systemName: "simcard.fill") // This can be replaced with a custom icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(Theme.primaryColor)
            VStack(alignment: .leading) {
                Text(plan.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Theme.textColor)
                Text("Data Used: \(plan.dataUsage) / \(plan.dataLimit)")
                    .font(.subheadline)
                    .fontWeight(.regular)
                    .foregroundColor(Theme.textColor)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Theme.textColor, lineWidth: 2)
        )
    }
}

struct PlanDetailView: View {
    var plan: TelecomPlan

    var body: some View {
        Text("Details for \(plan.name)")
            .navigationTitle(plan.planType.rawValue)
    }
}

struct AllPlansView: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        List {
            ForEach(availablePlans, id: \.id) { plan in
                HStack {
                    Text(plan.name)
                    Spacer()
                    if authViewModel.userSubscription.plans.contains(where: { $0.id == plan.id }) {
                        Text("Subscribed")
                            .foregroundColor(.green)
                    } else {
                        Button("Subscribe") {
                            authViewModel.addSubscription(plan: plan)
                        }
                        .foregroundColor(Theme.primaryColor)
                    }
                }
            }
        }
        .navigationTitle("Available Plans")
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView().environmentObject(AuthViewModel())
    }
}
