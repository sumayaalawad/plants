//
//  plant.swift
//  plants
//
//  Created by sumaya alawad on 01/05/1447 AH.
//

import Foundation

struct Plant: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var location: String
    var sun: String
    var water: String
    var isWatered: Bool
}
