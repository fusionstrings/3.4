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

/*
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
*/
/*
struct AllPlansView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        List(authViewModel.availablePlanTypes, id: \.self) { planType in
            HStack {
                Text(planType.rawValue)
                Spacer()
                if authViewModel.userSubscription.plans.contains(where: { $0.planType == planType && $0.isActive }) {
                    Button(action: {
                        // Functionality to handle adding another subscription of the same plan type
                        let newPhoneNumber = authViewModel.generatePhoneNumber()
                        authViewModel.addSubscription(planType: planType, phoneNumber: newPhoneNumber)
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.green)
                    }
                    .buttonStyle(BorderlessButtonStyle()) // to make sure the button doesn't highlight the entire row
                } else {
                    Button(action: {
                        // Functionality to handle adding the first subscription of this plan type
                        let newPhoneNumber = authViewModel.generatePhoneNumber()
                        authViewModel.addSubscription(planType: planType, phoneNumber: newPhoneNumber)
                    }) {
                        Text("Subscribe")
                            .foregroundColor(Color.blue)
                    }
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
        }
        .navigationTitle("Available Plans")
    }
}

*/

struct AllPlansView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        List(authViewModel.availablePlanTypes, id: \.self) { planType in
            HStack {
                Text(planType.rawValue)
                Spacer()
                
                // Calculate the count of active subscriptions of this plan type
                let count = authViewModel.userSubscription.plans.filter { $0.planType == planType && $0.isActive }.count
                
                // If already subscribed, show the count and the plus sign
                if count > 0 {
                    Button(action: {
                        // Functionality to handle adding another subscription of the same plan type
                        let newPhoneNumber = authViewModel.generatePhoneNumber()
                        authViewModel.addSubscription(planType: planType, phoneNumber: newPhoneNumber)
                    }) {
                        HStack {
                            Text("\(count)")
                                .foregroundColor(.gray)
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(Color.green)
                        }
                    }
                    .buttonStyle(BorderlessButtonStyle()) // Prevent button from highlighting the entire row
                } else {
                    Button(action: {
                        // Functionality to handle adding the first subscription of this plan type
                        let newPhoneNumber = authViewModel.generatePhoneNumber()
                        authViewModel.addSubscription(planType: planType, phoneNumber: newPhoneNumber)
                    }) {
                        Text("Subscribe")
                            .foregroundColor(Color.blue)
                    }
                    .buttonStyle(BorderlessButtonStyle())
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
