//
//  PlanDetailView.swift
//  tre-4.x-ios
//
//  Created by Dilip Kumar Shukla on 2024-04-25.
//

import SwiftUI

struct PlanDetailView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    var plan: TelecomPlan

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Header
                Group {
                    Text("Plan Details")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Number: \(plan.phoneNumber)")
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .padding(.bottom)

                // Data and Voice Usage
                Group {
                    UsageSection(usageType: "Data", used: "25GB", limit: "50GB")
                    UsageSection(usageType: "Voice", used: "300 min", limit: "1000 min")
                }
                .padding(.bottom)

                // Predictive Analysis
                Group {
                    Text("Predictive Usage Analysis")
                        .font(.headline)
                        .fontWeight(.bold)
                    // Placeholder chart
                    SimpleLineChart()
                }
                .padding(.bottom)

                // Plan Recommendation
                Group {
                    Text("Plan Recommendation")
                        .font(.headline)
                        .fontWeight(.bold)
                    Text("Considering your usage, the FLEXi plan might suit you better.")
                        .font(.callout)
                        .padding()
                        .background(Color.green.opacity(0.1))
                        .cornerRadius(10)
                }
                .padding(.bottom)

                // Deactivate Plan Button
                if plan.isActive {
                    Button("Deactivate Plan") {
                        authViewModel.deactivateSubscription(id: plan.id)
                    }
                    .foregroundColor(.red)
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle(plan.name)
    }
}

struct UsageSection: View {
    let usageType: String
    let used: String
    let limit: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(usageType) Usage")
                .font(.headline)
                .fontWeight(.bold)
            HStack {
                Text("\(used) / \(limit)")
                Spacer()
                // Simple usage bar placeholder
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 200, height: 10)
            }
        }
    }
}

struct SimpleLineChart: View {
    // Placeholder data for line chart
    let dataPoints: [Double] = [10, 30, 20, 60, 30, 45, 50]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let widthFactor = geometry.size.width / CGFloat(dataPoints.count - 1)
                let heightFactor = geometry.size.height / (dataPoints.max() ?? 100)

                for (index, dataPoint) in dataPoints.enumerated() {
                    let x = widthFactor * CGFloat(index)
                    let y = geometry.size.height - (heightFactor * CGFloat(dataPoint))

                    if index == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(Color.purple, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .padding([.top, .bottom], 8)
        }
        .frame(height: 200)
    }
}
