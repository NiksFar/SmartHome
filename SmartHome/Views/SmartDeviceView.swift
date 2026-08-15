//
//  SmartDeviceView.swift
//  SmartHome
//
//  Created by Mykyta on 15.08.26.
//

import SwiftUI

struct SmartDeviceView: View {
    
    @Binding var device: SmartDevice
    
    var body: some View {
        
        HStack {
            Image(systemName: device.iconName)
                .font(Font.system(size: 25))
                .foregroundColor(Color.blue)
            VStack(alignment: .leading) {
                Text(device.name)
                    .font(.headline)
                Text(device.type.rawValue)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            
            switch device.type {
                
            case .light:
                Toggle(isOn: $device.isOn) {
                }
            case .thermostat:
                Text("\(device.temperature, specifier: "%.1f")°C")
                Slider(value: $device.temperature, in: 15...35)
            case .lock:
                Button(device.isLocked ? "Unlock" : "Lock") {
                    device.isLocked.toggle()
                }
                .frame(width: 130, height: 45)
                .foregroundColor(Color.white)
                .background(Color.red)
                .cornerRadius(10)
                
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5)
            .padding(.horizontal, 15))
        
        
    }
}
        
                
        /*
        
        switch device.type {
         
         // Mark: Light
        case .light:
         HStack {
             Image(systemName: "lightbulb")
                 .font(Font.system(size: 25))
                 .foregroundColor(Color.blue)
             VStack(alignment: .leading) {
                 Text(device.name)
                     .font(.headline)
                 Text(device.type.rawValue)
                     .font(.subheadline)
                     .foregroundColor(Color.gray)
             }
             Spacer()
             Toggle(isOn: $device.isOn) {
                 //device.isOn.toggle()
             }
         }
         .padding(20)
         .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5))
        
         // Mark: Thermostat
        case .thermostat:
         
         HStack {
             Image(systemName: "thermometer.medium")
                 .font(Font.system(size: 25))
                 .foregroundColor(Color.blue)
             VStack(alignment: .leading) {
                 Text(device.name)
                     .font(.headline)
                 Text(device.type.rawValue)
                     .font(.subheadline)
                     .foregroundColor(Color.gray)
             }
             .padding(.trailing, 20)
             Spacer()
            
             Text("\(device.temperature, specifier: "%.1f")°C")
             Slider(value: $device.temperature, in: 15...35)
         }
         .padding(20)
         .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5))
         
        // Mark: lock
        case .lock:
         
         HStack {
             Image(systemName: "lock")
                 .font(Font.system(size: 25))
                 .foregroundColor(Color.blue)
             VStack(alignment: .leading) {
                 Text(device.name)
                     .font(.headline)
                 Text(device.type.rawValue)
                     .font(.subheadline)
                     .foregroundColor(Color.gray)
             }
             .padding(.trailing, 20)
             
             Spacer()
            
             Button(device.isLocked ? "Unlock" : "Lock") {
                 device.isLocked.toggle()
             }
             .frame(width: 130, height: 45)
             .foregroundColor(Color.white)
             .background(Color.red)
             .cornerRadius(10)

         }
         .padding(20)
         .background(RoundedRectangle(cornerRadius: 15).fill(Color.white).shadow(radius: 5))
         
        }
        */
    


#Preview {
   SmartDeviceView(device:.constant(
    SmartDevice(name: "Tür", type: .thermostat, isLocked: .init(true))
   ))
}
