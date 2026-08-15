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
            
            VStack(spacing: 40) {
                
                HStack(spacing: 50) {
                    ForEach(devices) { device in
                        if device.type == .light {
                            Image(systemName: "lamp.ceiling.fill")
                                .font(.system(size: 45))
                                .foregroundStyle(device.isOn ? .yellow : .black)
                            
                        }
                    }
                }
                
                HStack(spacing: 10) {
                    ForEach(devices) { device in
                        if device.type == .thermostat {
                            Image(systemName: "thermometer")
                                .font(.system(size: 35))
                                .foregroundStyle(device.isOn ? .red : .black)
                            Text("\(device.temperature, specifier: "%.1f")°C")
                                .font(.system(size: 35))
                        }
                    }
                }
                
                HStack(spacing: 20) {
                    ForEach(devices) { device in
                        if device.type == .lock {
                            if device.isLocked {
                                Image(systemName: "door.left.hand.closed")
                                    .font(.system(size: 45))
                                    .foregroundStyle(.black)
                            } else {
                                Image(systemName: "door.left.hand.open")
                                    .font(.system(size: 45))
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                }
            }
            .offset(x: 20, y: -40)
            
            //
            Button {
                isRoomViewShown = false
            } label: {
                Image(systemName: "x.square.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                
            }
            .offset(x: 165, y: -180)
            
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
