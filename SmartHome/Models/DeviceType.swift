//
//  DeviceType.swift
//  SmartHome
//
//  Created by Mykyta on 11.08.26.
//

enum DeviceType: String, Identifiable, CaseIterable {
    case light = "Licht"
    case thermostat = "Thermostat"
    case lock = "Schloss"
    
    var id: String {
        rawValue
    }
}
