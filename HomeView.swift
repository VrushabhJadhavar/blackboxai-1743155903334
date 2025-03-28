import SwiftUI

struct HomeView: View {
    @State private var selectedTimeFrame = 0
    let timeFrames = ["Today", "Week", "Month"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Time frame selector
                Picker("Time Frame", selection: $selectedTimeFrame) {
                    ForEach(0..<timeFrames.count, id: \.self) { index in
                        Text(timeFrames[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Summary cards
                VStack(spacing: 15) {
                    SummaryCard(title: "Workouts", value: "5", unit: "sessions")
                    SummaryCard(title: "Distance", value: "12.5", unit: "km")
                    SummaryCard(title: "Time", value: "2:45", unit: "hours")
                }
                .padding(.horizontal)
                
                // Metrics section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Recent Activities")
                        .font(.headline)
                        .padding(.leading)
                    
                    ForEach(0..<5) { _ in
                        ActivityRow()
                    }
                }
                .padding(.top)
            }
            .padding(.vertical)
        }
        .navigationTitle("Peak Fitness")
    }
}

struct SummaryCard: View {
    let title: String
    let value: String
    let unit: String
    
    var body: some View {
        VStack {
            Text(value)
                .font(.title.bold())
            Text(title)
                .font(.subheadline)
            Text(unit)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

struct ActivityRow: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Running")
                    .fontWeight(.medium)
                Text("5.2 km • 32 min")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("Today")
                .font(.caption)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }
}