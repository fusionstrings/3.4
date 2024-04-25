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
                    ForEach(authViewModel.userSubscription.plans.filter { $0.isActive }) { plan in
                        PlanCardView(plan: plan)
                    }

                    Spacer()

                    NavigationLink(destination: AllPlansView()) {
                        Text("See All Available Plans")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.bottom)
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
        NavigationLink(destination: PlanDetailView(plan: plan)) {
            VStack {
                HStack {
                    Image(systemName: "simcard.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.orange)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(plan.phoneNumber)
                            .font(.callout)
                            .foregroundColor(.gray)
                        Text(plan.name)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text("Data Used: \(plan.dataUsage) / \(plan.dataLimit)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    if plan.isActive {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    } else {
                        Text("Inactive")
                            .foregroundColor(.red)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .shadow(radius: 1)
            }
            .padding(.horizontal)
        }
    }
}

struct PlanDetailView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var plan: TelecomPlan
    
    var body: some View {
        VStack {
            Text("Details for \(plan.name)")
            Text("Phone Number: \(plan.phoneNumber)")
            if plan.isActive {
                Button("Deactivate Plan") {
                    authViewModel.deactivateSubscription(id: plan.id)
                }
                .foregroundColor(.red)
            } else {
                Text("This plan is currently inactive.")
            }
        }
        .navigationTitle(plan.planType.rawValue)
    }
}

struct AllPlansView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        List(authViewModel.availablePlanTypes, id: \.self) { planType in
            Button("Subscribe to \(planType.rawValue)") {
                let newPhoneNumber = authViewModel.generatePhoneNumber()
                authViewModel.addSubscription(planType: planType, phoneNumber: newPhoneNumber)
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
