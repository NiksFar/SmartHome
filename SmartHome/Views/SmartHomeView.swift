//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Mykyta on 10.08.26.
//

import SwiftUI

struct SmartHomeView: View {
    
    @State private var text: String = ""
    @State private var isOn: Bool = false
    
    @State private var devices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light),
        SmartDevice(name: "Heizung", type: .thermostat),
        SmartDevice(name: "Haustür", type: .lock)
    ]
    
    var body: some View {
        
        VStack {
            
            Text("Smart Home")
                .font(Font.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
            
            HStack(alignment: .center, spacing: 20) {
                
                TextField("Enter your device", text: $text)
                    .frame(height: 50)
                    .padding(.leading, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray)
                    )
                
                Button("Hinzufügen") {
                    devices.append(SmartDevice(name: text, type: .light))
                }
                .frame(width: 120, height: 50)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding(15)
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            
            ScrollView {
                ForEach(devices) { device in
                    
                    HStack {
                        Text(device.name)
                        Spacer()
                        Text(device.type.rawValue)
                    }
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    
                }
            }
            
            if isOn {
                RoomView(isOn: $isOn)
            }
            
            Toggle("Raumvorschau anzeigen", isOn: $isOn)
                .padding(20)
                .tint(.blue)
        }
    }
}

#Preview {
    SmartHomeView()
}
