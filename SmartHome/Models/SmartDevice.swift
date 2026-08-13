//
//  SmartDevice.swift
//  SmartHome
//
//  Created by Mykyta on 11.08.26.
//
import Foundation

struct SmartDevice: Identifiable {
    
    let id: UUID = UUID()
    
    let name: String
    let type: DeviceType
    let isOn: Bool
    let temperature: Double
    let isLocked: Bool
    
    init(
        name: String,
        type: DeviceType,
        isOn: Bool = false,
        temperature: Double = 20,
        isLocked: Bool = true
    ) {
        self.name = name
        self.type = type
        self.isOn = isOn
        self.temperature = temperature
        self.isLocked = isLocked
    }
}
