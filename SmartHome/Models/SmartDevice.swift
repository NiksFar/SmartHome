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
    let isOn: Bool = false
    let temperature: Double = 20
    let isLocked: Bool = true
    
}
