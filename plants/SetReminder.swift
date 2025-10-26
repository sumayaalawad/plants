//
//  SetReminder.swift
//  plants
//
//  Created by sumaya alawad on 28/04/1447 AH.
//

import SwiftUI

struct SetReminderView: View {
    @Binding var plants: [Plant]
    var onSave: () -> Void
    var onCancel: () -> Void
    
    @State private var plantName = ""
    @State private var selectedRoom = "Bedroom"
    @State private var selectedLight = "Full sun"
    @State private var wateringDays = "Every day"
    @State private var selectedWaterAmount = "25-50 ml"
    
    let rooms = ["Bedroom", "Living room", "Kitchen", "Balcony", "Bathroom"]
    let lightOptions = ["Full sun", "Partial sun", "Low light"]
    let wateringOptions = ["Every day", "Every 2 days", "Every 3 days", "Once a week", "Every 10 days", "Every 2 weeks"]
    let waterAmounts = ["25-50 ml", "50-100 ml", "100-200 ml", "200-300 ml"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Plant name", text: $plantName)
                        .autocapitalization(.words)
                }
                Section {
                    Picker("Select Room", selection: $selectedRoom) {
                        ForEach(rooms, id: \.self) { Text($0) }
                    }
                    Picker("Select Light", selection: $selectedLight) {
                        ForEach(lightOptions, id: \.self) { Text($0) }
                    }
                }
                Section {
                    Picker("Watering Frequency", selection: $wateringDays) {
                        ForEach(wateringOptions, id: \.self) { Text($0) }
                    }
                    Picker("Water Amount", selection: $selectedWaterAmount) {
                        ForEach(waterAmounts, id: \.self) { Text($0) }
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        onCancel()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                ToolbarItem(placement: . principal) {
                    Text("set reminder")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newPlant = Plant(
                            name: plantName,
                            location: selectedRoom,
                            sun: selectedLight,
                            water: selectedWaterAmount,
                            isWatered: false
                        )
                        plants.append(newPlant)
                        onSave()
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
            }
        }
    }
}
#Preview {
    SetReminderView(plants: .constant([]), onSave: {}, onCancel: {})
}
