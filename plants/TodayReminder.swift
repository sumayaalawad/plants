//
//  Untitled.swift
//  plants
//
//  Created by sumaya alawad on 01/05/1447 AH.
//

import SwiftUI

struct TodayReminder: View {
    @Binding var plants: [Plant]
    @State private var ShowAllReminderCompleted = false
    @State private var showingDeleteEdit = false
    var wateredCount: Int {
        plants.filter { $0.isWatered }.count
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("My plants🌱")
                    .font(.largeTitle)
                    .padding(.horizontal)
                    .bold()
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)

                if plants.isEmpty {
                    Spacer()
                    Text("Your plants are waiting for a sip 💦")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.horizontal)
                    Spacer()
                } else {
                    VStack(spacing: 10) {
                        if wateredCount == 0 {
                    Text("Your plants are waiting for a sip💦")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                } else if wateredCount == plants.count {
                 Text("\(wateredCount) of your plants feel loved today ✨")
                    .foregroundColor(.white)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                        }
                   ProgressView(value: Double(wateredCount), total: Double(plants.count))
                    .tint(.green)
                    .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity)
                ScrollView {
                VStack(spacing: 12) {
                    ForEach(plants.indices, id: \.self) { index in
            HStack {
                Button {
            plants[index].isWatered.toggle()
            } label: {
                Image(systemName: plants[index].isWatered ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(plants[index].isWatered ? .green : .gray)
                                    }
                                    
            VStack(alignment: .leading) {
                Text(plants[index].name)
                    .foregroundColor(.white)
                Text("in \(plants[index].location)")
                    .foregroundColor(.gray)
                    .font(.subheadline)
                        }
             Spacer()
            VStack(alignment: .trailing) {
                Label(plants[index].sun, systemImage: "sun.max")
                    .foregroundColor(.yellow)
                    .font(.caption)
                Label(plants[index].water, systemImage: "drop")
                    .foregroundColor(.blue)
                    .font(.caption)
                }
            }
                    .padding()
                    .background(Color(.secondarySystemBackground).opacity(0.2))
                    .cornerRadius(10)
                            }
                        }
                    }
                }
                HStack {
            Spacer()
                Button {
                showingDeleteEdit = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(.green)
                                    }
                                }
                .padding(.top, 10)
                .padding(.horizontal)

            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showingDeleteEdit) {
            deleteEdit(plants: $plants, onSave: {
                showingDeleteEdit = false
            }, onCancel: {
                showingDeleteEdit = false
            })
        }
    }
}
#Preview {
    NavigationStack {
        TodayReminder(plants: .constant([]))
    }
}
