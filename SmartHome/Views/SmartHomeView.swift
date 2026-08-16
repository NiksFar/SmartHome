//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Mykyta on 10.08.26.
//

import SwiftUI

struct SmartHomeView: View {
    
    @State private var text: String = ""
    @State private var isRoomViewShown: Bool = true
    @State private var isGrid: Bool = false
    @State private var selectedDeviceType: DeviceType = .light
    
    @State private var devices: [SmartDevice] = [
        SmartDevice(name: "Wohnzimmerlicht", type: .light),
        SmartDevice(name: "Heizung", type: .thermostat),
        SmartDevice(name: "Haustür", type: .lock)
    ]
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                Text("Smart Home")
                    .font(Font.title.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                
                HStack(alignment: .center, spacing: 20) {
                    
                    TextField("Neues Gerät", text: $text)
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray)
                        )
                    
                    Picker("Gerätetyp", selection: $selectedDeviceType) {
                        ForEach(DeviceType.allCases) { deviceType in
                            Text(deviceType.rawValue)
                                .tag(deviceType)
                        }
                    }
                    .pickerStyle(.menu)
                }
                .padding(15)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .offset(y: -5)
                
                Button("Hinzufügen") {
                    devices.append(
                        SmartDevice(
                            name: text,
                            type: selectedDeviceType
                        )
                    )
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                .padding(.horizontal, 15)
                
                Toggle("Grid", isOn: $isGrid)
                    .frame(width: .infinity, height: 10)
                    .padding(15)
                
                if isGrid {
                    // Mark: Grid
                    Grid(alignment: .leading) {
                        ForEach(
                            Array(stride(from: 0, to: devices.count, by: 2)),
                            id: \.self
                        ) { index in
                            
                            GridRow {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(devices[index].name)
                                    Text(devices[index].type.rawValue)
                                }
                                .padding(5)
                                if index+1 < devices.count {
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text(devices[index+1].name)
                                        Text(devices[index+1].type.rawValue)
                                    }
                                }
                            }
                        }
                    }
                } else {
                    //
                    ScrollView {
                        
                        ForEach($devices) { $device in
                            
                            SmartDeviceView(device: $device)
                            
                        }
                        .padding(10)
                        /*
                         HStack {
                         Text(device.name)
                         Spacer()
                         Text(device.type.rawValue)
                         
                         Button {
                         if let index = devices.firstIndex(where: { $0.id == device.id }) {
                         devices.remove(at: index)
                         }
                         } label: {
                         Image(systemName: "trash")
                         }
                         
                         
                         }
                         .padding(.leading, 15)
                         .padding(.trailing, 15)
                         }
                         */
                    }
                    
                    
                }
                //
                
                if isRoomViewShown {
                    RoomView(isRoomViewShown: $isRoomViewShown, devices: devices)
                }
                
                
                Toggle("Raumvorschau anzeigen", isOn: $isRoomViewShown)
                    .padding([.leading, .trailing], 20)
                    .tint(.blue)
            }
        }
    }
}

#Preview {
    SmartHomeView()
}
