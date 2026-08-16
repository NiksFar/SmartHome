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
            
            VStack(spacing: 5) {
                
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
                            /*
                            Image(systemName: "thermometer")
                                .font(.system(size: 25))
                                .foregroundStyle(device.isOn ? .red : .black)
                            Text("\(device.temperature, specifier: "%.1f")°C")
                                .font(.system(size: 25))
                            */
                            
                            Gauge(
                                value: device.temperature,
                                in: 15...35,
                                label: {
                                    Text("°C")
                                },
                                currentValueLabel: {
                                    Text("\(device.temperature, specifier: "%.1f")")
                                }
                            )
                            .gaugeStyle(.accessoryCircular)
                            .tint(
                                LinearGradient(
                                    colors: [.blue, .red],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
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
            .offset(x: 15, y: -22)
            
            //
            Button {
                isRoomViewShown = false
            } label: {
                Image(systemName: "x.square.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                
            }
            .offset(x: 150, y: -92)
            
            //
            VStack(spacing: 10) {
                ForEach(devices) { device in
                    if device.type == .media {
                        if device.isOn {
                            Image(systemName: "tv")
                                .font(.system(size: 40))
                                .foregroundStyle(.blue)
                                .rotation3DEffect(
                                        .degrees(45),
                                        axis: (x: 0, y: 1, z: 0)
                                    )
                        } else {
                            Image(systemName: "tv")
                                .font(.system(size: 40))
                                .foregroundStyle(.black)
                                .rotation3DEffect(
                                        .degrees(45),
                                        axis: (x: 0, y: 1, z: 0))
                        }
                    }
                }
            }
            .offset(x: -122, y: 5)
            //
            
        }
    }
}

#Preview {
    RoomView(isRoomViewShown: .constant(true), devices: [
        SmartDevice(name: "Lampe1", type: .light),
        SmartDevice(name: "Lampe2", type: .light, isOn: true),
        SmartDevice(name: "Tür1", type: .lock),
        SmartDevice(name: "Thermo1", type: .thermostat, temperature: 22),
        SmartDevice(name: "TV", type: .media, isOn: true)
    ])
}
