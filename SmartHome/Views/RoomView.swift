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
                .frame(width: 300, height: 500)
                .cornerRadius(20)
                .padding(25)
                .tint(.black)
                .background(.white)
                .cornerRadius(20)
            
            Button {
                isOn = false
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    
            }

        }
        
    }
}

#Preview {
    RoomView(isOn: .constant(true))
}
