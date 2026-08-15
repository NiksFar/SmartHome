//
//  RoomView.swift
//  SmartHome
//
//  Created by Mykyta on 10.08.26.
//

import SwiftUI

struct RoomView: View {
    
    @Binding var isRoomViewShown: Bool
    var devices: [SmartDevice]
    
    var body: some View {
        ZStack(alignment: .center) {
            PathBackgroundView()
            
            // Mark: Vstack
            
            VStack(spacing: 15) {
                
                HStack(spacing: 50) {
                    ForEach(devices) { device in
                        if device.type == .light {
                            Image(systemName: "lamp.ceiling.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(device.isOn ? .yellow : .black)
                            
                        }
                    }
                }
                
                HStack(spacing: 10) {
                    ForEach(devices) { device in
                        if device.type == .thermostat {
                            Image(systemName: "thermometer")
                                .font(.system(size: 25))
                                .foregroundStyle(device.isOn ? .red : .black)
                            Text("\(device.temperature, specifier: "%.1f")°C")
                                .font(.system(size: 25))
                        }
                    }
                }
                
                HStack(spacing: 20) {
                    ForEach(devices) { device in
                        if device.type == .lock {
                            if device.isLocked {
                                Image(systemName: "door.left.hand.closed")
                                    .font(.system(size: 55))
                                    .foregroundStyle(.black)
                            } else {
                                Image(systemName: "door.left.hand.open")
                                    .font(.system(size: 55))
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }
            }
            .offset(x: 15, y: -20)
            
            //
            Button {
                isRoomViewShown = false
            } label: {
                Image(systemName: "x.square.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                
            }
            .offset(x: 150, y: -92)
            
        }
    }
}

#Preview {
    RoomView(isRoomViewShown: .constant(true), devices: [
        SmartDevice(name: "Lampe1", type: .light),
        SmartDevice(name: "Lampe2", type: .light, isOn: true),
        SmartDevice(name: "Tür1", type: .lock),
        SmartDevice(name: "Tür2", type: .lock, isLocked: false),
        SmartDevice(name: "Tür3", type: .lock, isLocked: true),
        SmartDevice(name: "Thermo1", type: .thermostat)
    ])
}
