//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Mykyta on 10.08.26.
//

import SwiftUI

struct SmartHomeView: View {
    
    @State private var text: String = ""
    @State private var secText: String = ""
    @State private var isOn: Bool = false
    
    var body: some View {
        VStack {
            
            HStack(alignment: .center, spacing: 20) {
                
                TextField("Enter your name", text: $text)
                    .frame(height: 50)
                    .padding(.leading, 10)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray)
                        )
                    
                Button("Hinzufügen") {
                    secText = text
                }
                .frame(width: 120, height: 50)
                .foregroundColor(Color.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                
            }
            .padding(15)
            .frame(maxWidth: .infinity)
            .frame(height: 70)
            
            Text(secText)
                .fontWeight(.semibold)
                .font(.system(size: 30))
            
            if isOn {
                RoomView()
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
