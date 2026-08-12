//
//  DeviceType.swift
//  SmartHome
//
//  Created by Mykyta on 11.08.26.
//

enum DeviceType: String, Identifiable, CaseIterable {
    case light = "Light"
    case thermostat = "Thermostat"
    case lock = "Lock"
    
    var id: String {
        rawValue
    }
}
