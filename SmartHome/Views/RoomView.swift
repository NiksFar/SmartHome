//
//  RoomView.swift
//  SmartHome
//
//  Created by Mykyta on 10.08.26.
//

import SwiftUI

struct RoomView: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            Color.orange
                .frame(width: 300, height: 400)
                .padding(25)
                .background(.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.3), radius: 5)
            
            Button {
                isOn = false
            } label: {
                Image(systemName: "x.square.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            
        }
    }
}

#Preview {
    RoomView(isOn: .constant(true))
}
